#!/usr/bin/env ruby
# frozen_string_literal: true

# Post a blog post to Mastodon (aus.social).
#
# Usage:
#   ./toot-post.rb _posts/2026-06-14-my-post.md            # post it
#   ./toot-post.rb _posts/2026-06-14-my-post.md --dry-run  # show toot, don't post
#   ./toot-post.rb _posts/2026-06-14-my-post.md -m "Custom message"  # override lead text
#
# Auth: reads the access token from $MASTODON_TOKEN, or from a file
# named `.mastodon-token` in the repo root (gitignored). Create a token at
# aus.social -> Preferences -> Development -> New application. Required scopes:
#   write:statuses  (to post the toot)
#   write:media     (to upload the image — omit only if you always use --no-image)
# Or just tick `write` to cover both. After changing scopes you MUST regenerate
# the access token. Copy the token into .mastodon-token.

require "yaml"
require "date"
require "json"
require "net/http"
require "uri"
require "digest"

INSTANCE   = "https://aus.social"
SITE_URL   = "https://charlesmartin.au"
MAX_CHARS  = 500
VISIBILITY = "public"

def die(msg)
  warn "error: #{msg}"
  exit 1
end

def load_token
  return ENV["MASTODON_TOKEN"] if ENV["MASTODON_TOKEN"] && !ENV["MASTODON_TOKEN"].empty?

  file = File.join(__dir__, ".mastodon-token")
  return File.read(file).strip if File.exist?(file)

  die "no token found. Set $MASTODON_TOKEN or create #{file} (see header of this script)."
end

# --- parse args -------------------------------------------------------------
path = nil
dry_run = false
custom_lead = nil
no_image = false

args = ARGV.dup
until args.empty?
  arg = args.shift
  case arg
  when "--dry-run", "-n" then dry_run = true
  when "--no-image"      then no_image = true
  when "-m", "--message" then custom_lead = args.shift
  else
    die "unexpected argument: #{arg}" if path
    path = arg
  end
end

die "usage: ./toot-post.rb _posts/YYYY-MM-DD-slug.md [--dry-run] [-m \"lead text\"]" unless path
die "file not found: #{path}" unless File.exist?(path)

# --- read front matter ------------------------------------------------------
raw = File.read(path)
unless raw =~ /\A---\s*\n(.*?\n)---\s*\n/m
  die "no YAML front matter found in #{path}"
end
front = YAML.safe_load(Regexp.last_match(1), permitted_classes: [Date, Time]) || {}

title = front["title"]&.to_s&.strip
die "post has no `title` in front matter" if title.nil? || title.empty?

# --- build canonical URL from filename --------------------------------------
basename = File.basename(path, ".*")
unless basename =~ /\A(\d{4})-(\d{2})-(\d{2})-(.+)\z/
  die "filename must be YYYY-MM-DD-slug.md, got: #{basename}"
end
year, month, day, slug = Regexp.last_match.captures
url = "#{SITE_URL}/blog/#{year}/#{month}/#{day}/#{slug}"

# --- image (from front matter `image:`) -------------------------------------
image_path = nil
image_alt  = nil
unless no_image
  if (img = front["image"]&.to_s&.strip) && !img.empty?
    candidate = File.join(__dir__, img.sub(%r{\A/}, ""))
    if File.exist?(candidate)
      image_path = candidate
      image_alt  = (front["image_alt"] || front["title"]).to_s.strip
    else
      warn "warning: image #{img} referenced in front matter not found on disk; posting without it"
    end
  end
end

# --- hashtags from tags -----------------------------------------------------
tags = Array(front["tags"]).map(&:to_s)
hashtags = tags.first(4).map do |t|
  "#" + t.strip.split(/\s+/).map(&:capitalize).join
end.join(" ")

# --- compose status ---------------------------------------------------------
lead = custom_lead || "New post: #{title}"
desc = front["description"]&.to_s&.strip

parts = [lead]
parts << desc if desc && !desc.empty? && custom_lead.nil?
parts << url
parts << hashtags unless hashtags.empty?
status = parts.join("\n\n")

# Trim the description if we blow the character budget (URL counts as 23).
if status.length > MAX_CHARS && desc && custom_lead.nil?
  overflow = status.length - MAX_CHARS + 1
  trimmed = desc[0, [desc.length - overflow, 0].max].rstrip + "…"
  parts = [lead, trimmed, url]
  parts << hashtags unless hashtags.empty?
  status = parts.join("\n\n")
end

puts "--- toot (#{status.length} chars) ---"
puts status
puts "------------------------------------"
if image_path
  puts "image: #{image_path}"
  puts "alt:   #{image_alt.empty? ? "(none)" : image_alt}"
end

if dry_run
  puts "(dry run — not posted)"
  exit 0
end

# --- post -------------------------------------------------------------------
token = load_token

def content_type_for(file)
  case File.extname(file).downcase
  when ".jpg", ".jpeg" then "image/jpeg"
  when ".png"          then "image/png"
  when ".gif"          then "image/gif"
  when ".webp"         then "image/webp"
  else "application/octet-stream"
  end
end

# Upload media first (if any) and collect its id.
media_id = nil
if image_path
  uri = URI("#{INSTANCE}/api/v2/media")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  req = Net::HTTP::Post.new(uri)
  req["Authorization"] = "Bearer #{token}"
  form = [["description", image_alt]]
  form << ["file", File.open(image_path, "rb"),
           { filename: File.basename(image_path), content_type: content_type_for(image_path) }]
  req.set_form(form, "multipart/form-data")
  res = http.request(req)
  die "media upload failed #{res.code}: #{res.body}" unless res.is_a?(Net::HTTPSuccess)
  media_id = (JSON.parse(res.body)["id"] rescue nil)
  die "media upload returned no id: #{res.body}" unless media_id

  # 202 = still processing; poll until ready so the toot isn't sent too early.
  if res.code == "202"
    poll = URI("#{INSTANCE}/api/v1/media/#{media_id}")
    20.times do
      sleep 1
      r = http.request(Net::HTTP::Get.new(poll).tap { |g| g["Authorization"] = "Bearer #{token}" })
      break if r.is_a?(Net::HTTPSuccess) && r.code == "200"
    end
  end
  puts "uploaded image (media id #{media_id})"
end

uri = URI("#{INSTANCE}/api/v1/statuses")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

req = Net::HTTP::Post.new(uri)
req["Authorization"]   = "Bearer #{token}"
req["Idempotency-Key"] = Digest::SHA256.hexdigest(url) # avoids accidental double-posts
params = [["status", status], ["visibility", VISIBILITY]]
params << ["media_ids[]", media_id] if media_id
req.body = URI.encode_www_form(params)
req.content_type = "application/x-www-form-urlencoded"

res = http.request(req)

if res.is_a?(Net::HTTPSuccess)
  body = JSON.parse(res.body) rescue {}
  puts "posted: #{body["url"] || "(ok)"}"
else
  die "Mastodon API #{res.code}: #{res.body}"
end
