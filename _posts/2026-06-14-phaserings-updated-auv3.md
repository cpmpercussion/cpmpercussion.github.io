---
layout: post
title: PhaseRings Updated as an AUv3 Plugin
date: 2026-06-14 17:16 +1000
tags:
- phaserings
- ios
- ipad
- app
- auv3
- music technology
- performance
description: "PhaseRings, my annular touchscreen instrument from 2014, is back: two updates restore it to working order and re-release it as an AUv3 plugin that integrates into modern iPad music workflows."
image: /assets/blog/2026/2026-phaserings-blog-darkmode-16x10.jpg
image_alt: "Three iPhone screenshots of the PhaseRings app on a dark teal background, each showing concentric rings tuned to a musical scale. The first has faint grey rings labelled with note names, the second has bright pink, cyan and orange rings, and the third shows the settings panel with sound scheme and composition options."
---

[PhaseRings]({% link _projects/phaserings.md %}) is an annular iOS app for performing percussive music on a touchscreen that I released [way back in 2014]({% link _posts/2014-11-17-phaserings-released.md %}) during my PhD. Two recent updates have restored the app to working order and enabled it to be used as an AUv3 plugin so that it now fully integrates into modern iPad music workflows.

![PhaseRings on iPhone showing the concentric-ring interface in three colour schemes, with the settings panel open on the right.]({% link assets/blog/2026/2026-phaserings-blog-darkmode-16x10.jpg %})

PhaseRings was the last (and best) app design in my [PhD research](http://hdl.handle.net/1885/101786) where I explored ways to [track and respond to percussive gestures](https://hdl.handle.net/10852/58518), [introduce networked ensemble interaction](https://dl.acm.org/doi/10.1145/2858036.2858269), and [create new touch-based compositions and performances](https://www.icad.org/icad2016/proceedings/concert/ICAD2016_paper_99.pdf). I've used it in _many_ performances, both specifically about this research and just as a part of my artistic practice and it's by far the most popular piece of computer music software I've released.

PhaseRings was _just_ an app initially, turning the iPad into a musical instrument, but as iOS became more developed and the musical ecosystem emerged, the expectation was for apps to talk to other apps for on-device music production. I added Inter-App Audio and AudioBus support pretty early on so that PhaseRings could send audio across to other audio host apps.

All was good for some years and I hadn't updated PhaseRings since 2018 or so. Well, eventually I noticed that PhaseRings wasn't playing nicely in AUM anymore, and I had to stop using it, and I recently had reports that the audio wasn't playing correctly in any app so a long overdue update was required.

Finally finding some time to work on this problem (and starting to try out Claude Code), I released two updates to PhaseRings in the last few weeks to bring it up to modern standards. The first release (v2.0) removed AudioBus (now defunct) and restored PhaseRings as a working IAA app. The second update is more-or-less a re-release as an AUv3 plugin.

Using PhaseRings as an AUv3 plugin is something I've wanted to use for years and it's been frustrating to see so much progress in AUv3 plugins on iPad (my usual performance rig has been iPad with AUM since 2021) but for PhaseRings to be left behind. The critical point was Pure Data. PhaseRings was a `libpd` app, but Pure Data doesn't like to run as multiple instances. I know there's been some progress here, and an [open pull request on `libpd`](https://github.com/libpd/libpd/pull/377), but I suddenly remembered that I might be able to use Heavy (`hvcc`) instead to compile the Pd sources into C++. Well it wasn't completely straightforward but eventually I got the Pd patches from PhaseRings into a state where `hvcc` would compile them and they all sound correct. Claude got them integrated back into the app and helped to update the UI with a few modern niceties.

![PhaseRings running as an AUv3 plugin inside AUM, with its rings interface alongside a host channel strip and effects chain.]({% link assets/blog/2026/2026-phaserings-aum.jpg %})

The new app works better than ever. As an AUv3 generator, it loads directly into AUM, you can perform using the annular interface (no code changes needed there), use PhaseRings as a MIDI sound module, or even as a MIDI interface to other sounds. It's the PhaseRings I've wanted to have for my performances and I'm excited to keep using it!

I wondered a bit whether anybody will care, but looking at AppStore Connect was encouraging: in the last few weeks, the app has been updated 4.5 thousand times and a returning customer even left a 5-star review! It's just wonderful to know that people still have PhaseRings on their device and I hope they continue to enjoy using it!

For a blast from the past, the Sound Test Room's classic review of PhaseRings is still up on YouTube:

{% include youtubePlayer.html id="rLI-vE4wuJE" %}
