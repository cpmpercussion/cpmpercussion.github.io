---
layout: page
title: Projects
hidden: true
started: 2008
permalink: /projects/
description: "Projects and ensembles in music technology, intelligent musical interfaces, and computational intelligence by Charles Martin."
tags: [projects, music technology, new interfaces, research, ensembles]
image: /assets/images/charlesmartin-background.jpg
---

I'm a performer and researcher in music technology, this page is about projects
and ensembles that I've been involved with over the years.

{% assign sorted = site.projects | sort: 'started' %}

<section class="row">
{% for project in sorted reversed %}
{% unless project.hidden %}
<div class="col-sm-4 p-3">
<div class="card">
<img class="card-img-top" src="{{ project.image }}" alt="{{ project.image_alt }}">
<div class="card-body">
<h5 class="card-title"><a href="{{ project.url | relative_url }}">{{ project.title }}</a></h5>
{% if project.started or project.ended %}
<h6 class="card-subtitle mb-2 text-muted">{{project.started}}-{{project.ended}}</h6>
{% endif %}
{{ project.summary }}
<a class="card-link" href="{{ project.url | relative_url }}">read more</a>
</div>
</div>
</div>
{% endunless %}
{% endfor %}
</section>

I work at the intersection of music performance (computer and percussion), new
interfaces for musical expression, and computational intelligence (ML/AI), and
I'm always looking for new ways to combine these interests!

![Charles Martin Background]({{site.baseurl}}/assets/images/charlesmartin-background.jpg)

### Research Labs

- [Intelligent Musical Instrument Lab]({{ site.baseurl }}/lab/)
- [ANU Code/Creativity/Culture Lab](https://cs.anu.edu.au/code-creativity-culture/)
- [Robotics and Intelligent Systems (ROBIN) group](https://www.mn.uio.no/ifi/english/research/groups/robin/index.html)
- [RITMO Centre for Interdisciplinary Studies in Rhythm, Time and Motion](https://www.uio.no/ritmo/english/)

### Ensembles

- [Canberra Experimental Music Studio (EMS)](https://www.facebook.com/canberraexperimentalmusicstudio/)
- [Compositions]({% link _projects/compositions.md %})
- [Andromeda is Coming]({% link _projects/andromeda-is-coming.html %})
- [Metatone]({% link _projects/metatone.html %})
- [Nordlig Vinter]({% link _projects/nordlig-vinter.html %})
- [Ensemble Evolution]({% link _projects/ensemble-evolution.html %})
- [Last Man to Die]({% link _projects/lmtd.html %})
- [Strike on Stage]({% link _projects/strike-on-stage.html %})


### Projects

- [EPEC - Engineering Predictability with Embodied Cognition (University of Oslo)](https://www.uio.no/ritmo/english/projects/all/epec/)
- [MusicLab (University of Oslo)](https://www.hf.uio.no/ritmo/english/news-and-events/events/musiclab/)
