# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Serve site locally with live reload
bundle exec jekyll serve

# Build site (outputs to _site/)
bundle exec jekyll build

# Update publications from remote BibTeX source
./get_publications.sh

# Validate HTML (uses html-proofer gem)
bundle exec htmlproofer ./_site --disable-external --no-enforce-https --assume-extension .html --ignore-urls "/twitter.com/,/x.com/,/linkedin.com/"
```

Ruby version is pinned to 3.3.9 via `.ruby-version`. Run `bundle install` after adding gems.

## Architecture

This is a **Jekyll 4** personal/academic website for Charles Martin (charlesmartin.au), deployed to GitHub Pages via Actions.

### Content collections

- **`_posts/`** — Blog posts, named `YYYY-MM-DD-slug.md`. Front matter includes `layout: post`, `title`, `date`, `category`, `tags`. Tags use multiline YAML list format:
  ```yaml
  tags:
  - tag one
  - tag two
  ```
  Older posts (2006–2014, migrated from WordPress/Posterous) may have legacy front matter fields like `status`, `meta`, `published`, and `categories: []` — these are harmless but not used by the current theme.
- **`_projects/`** — Portfolio project pages, using `layout: project`. Front matter includes `started`, `ended`, `image`, `image_alt`, `summary`.
- **`_lab/`** — Pages for the SMCCLAB research group section, using `layout: page`. The lab is being wound down on this site in favour of the separate [smcclab.au](https://smcclab.au) website. Lab project entries from `_data/lab-projects.yml` are being converted to regular blog posts instead.
- **`_bibliography/publications.bib`** — BibTeX file powering the publications page via `jekyll-scholar`. Updated by running `./get_publications.sh` (fetches `publications.bib` from the `cpmpercussion/preprints` repo, which also deploys the preprint PDFs to charlesmartin.au/preprints/). Publications are filtered by BibTeX `keywords` field (e.g. `refereed`, `conference-paper`, `journal-article`).

### Data files (`_data/`)

- `navigation.yml` — Top nav links
- `lab-members.yml` — Current SMCCLAB members (rendered on `/lab/`)
- `lab-alumni.yml` — Former lab members
- `lab-projects.yml` — Lab project cards shown on `/lab/`; being phased out as projects are converted to blog posts

### Layouts and includes

- `_layouts/default.html` — Base layout; includes Bootstrap 5.3 (local copy), Font Awesome 6, academicons, and custom CSS from `assets/css/main.css`. Has a special `titlepage: true` front matter flag that renders the homepage hero section.
- `_layouts/post.html`, `project.html`, `page.html`, `bibliography.html` — extend `default.html`
- `_includes/` — Reusable partials: `head.html` (meta/CSS), `nav.html` (Bootstrap navbar with dark-mode toggle), `scripts.html`, plus media embeds (`youtubePlayer.html`, `vimeoPlayer.html`, `carousel.html`, `tocdiv.html`, `socialicons.html`)

### Plugins

Key Jekyll plugins configured in `_config.yml`:
- `jekyll-scholar` — Renders academic bibliography from BibTeX; config block in `_config.yml` sets CSL style, bibliography template, and grouping
- `jekyll-paginate-v2` — Paginates posts (6 per page)
- `jekyll-toc` — Auto table of contents (used in post layout via `{% include tocdiv.html %}`)
- `jekyll-seo-tag` — SEO meta tags in `<head>`

### Homepage topic shortcuts

`_config.yml` has a `shortcut_tags` list that controls the topic shortcut buttons shown above "Recent Posts" on the homepage:

```yaml
shortcut_tags:
  - research
  - teaching
  - performance
```

These link to `/tags/?tag=<name>`. Values must match actual tag names used in posts (lowercase). To add or change shortcuts, edit this list — no changes to `index.html` needed. The tags page hides the full tag cloud when a filter is active, with a "Browse all tags" toggle to reveal it.

### Button styles

Use `btn-outline-secondary` for tag/filter buttons and secondary actions throughout the site. Use `btn-secondary` (filled) for primary navigation actions like "All tags →". Avoid `btn-outline-primary` or `btn-link` — these introduce colours outside the site's orange/amber scheme.

### Styling

`assets/css/main.scss` and `assets/css/bibliography.scss` are Sass source files processed by Jekyll at build time (configured via `sass:` in `_config.yml`). Bootstrap, academicons, and `image-captions.css` are pre-compiled third-party files stored directly in `assets/css/`.

### Linking between pages

Use Jekyll's `{% link %}` tag for internal links (e.g. `{% link _projects/microjam.md %}`), not bare relative paths, to get build-time link checking.

### Publications workflow

The BibTeX file is maintained externally at `cpmpercussion/preprints` on GitHub, alongside the preprint PDFs served at https://charlesmartin.au/preprints/. Run `./get_publications.sh` to pull the latest version and strip metadata fields that cause parsing issues. Do not edit `_bibliography/publications.bib` directly.

## SEO and accessibility conventions

### Post front matter
- Use `description:` for an explicit meta description (jekyll-seo-tag picks this up for `og:description` and `<meta name="description">`)
- Use `image:` to set the `og:image` for social preview cards (important for Twitter `summary_large_image` card)
- Tags use multiline YAML list format (see Content collections above)

### Carousel images (`_includes/carousel.html`)
Carousel entries in front matter support both `image:` and `alt:` fields:
```yaml
carousel:
  - image: /assets/bio/example.jpg
    alt: Descriptive alt text for the image
```

### Structured data
- `llms.txt` at root — plain-text site summary for LLM crawlers (update if site content or profiles change)
- Homepage (`index.html`) head includes a Schema.org `Person` JSON-LD block via `_includes/head.html` (only rendered on `/`) — update if job title, institution, or profile URLs change

### Accessibility
- Skip-to-content link is in `_includes/nav.html`; `<main>` has `id="main-content"` in `_layouts/default.html`
- "Read more" links on the homepage use `visually-hidden` spans with post titles for screen readers
- Twitter card type is `summary_large_image` (set in `_config.yml`)
