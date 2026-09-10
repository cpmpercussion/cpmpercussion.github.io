---
layout: page
title: Publications
permalink: /publications/
description: "Refereed journal articles, conference papers, and book chapters by Charles Martin on computer music, machine learning, and musical interaction."
tags: [publications, research, computer music, machine learning, human-computer interaction]
---

{% include research-profile.html %}

This page shows refereed journal articles, conference articles, and book chapters. My [Google Scholar page](https://scholar.google.com/citations?user=mTlH4G8AAAAJ) is usually slightly more up to date than this list.

{% bibliography --query @*[keywords ~= refereed] %}

{% comment %}

## Refereed Journal Articles, Conference Articles, and Book Chapters

## Book Chapters

{% bibliography --query @*[keywords ~= book-chapter && keywords ~= refereed] %}

## Refereed Journal Articles

{% bibliography --query @*[keywords ~= journal-article && keywords ~= refereed] %}

## Refereed Conference Proceedings

{% bibliography --query @*[keywords ~= conference-paper && keywords ~= refereed] %}

## Other Publication Outputs

### Articles Under Review

{% bibliography --query @*[keywords ^= under-review] %}

### Non-Refereed Conference Proceedings

{% bibliography --query @*[keywords ^= conference-paper && keywords ^= non-refereed] %}

### Conference Presentations

{% bibliography --query @*[keywords ^= conference-presentation] %}

### Open-Source Code Projects

{% bibliography --query @*[keywords ^= open-source] %}

### Open Data Sets

{% bibliography --query @*[keywords ^= open-data] %}

### Selected Research-Led Artistic Performances

{% bibliography --query @*[keywords ^= artistic-performance] %}

### Selected Music Recordings

{% bibliography --query @*[keywords ^= music-recording] %}

{% endcomment %}
