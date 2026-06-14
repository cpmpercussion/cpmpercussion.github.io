---
layout: post
title: Experimenting with Intelligent Synths and AI in a MIDI Plug
date: 2024-02-26
category: posts
tags:
- research
- music technology
- imps
- midi
- raspberry-pi
description: Experimenting with IMPS running on a Raspberry Pi Zero 2 W and communicating via MIDI with regular synthesisers — a "GenAI MIDI plug" concept for intelligent musical instruments.
image: /assets/blog/2024/202402-intelligent-synths-1-raspberrypi.jpg
image_alt: "A Raspberry Pi Zero 2 W with a MIDI output socket soldered directly onto the board."
---

I'm back at work for a research-focussed year and getting back to the _Intelligent Musical Instruments_ theme that I set for my [lab](https://smcclab.au).

One of the limitations of my previous work was that connecting IMPS to synth software was a fairly involved process. IMPS communicates with OSC messages and the assumption was that the musician would be designing a custom computer music instrument at the same time as training a machine-learning model.

Some of the most compelling IMPS work was the EMPI project involving an embedded and self-contained musical instrument running on a Raspberry Pi.

What I've been trying this year is to get IMPS working (again) on a Raspberry Pi, and communicating via MIDI with regular synthesisers. 

One of the motivators here was discovering that IMPS should work a bit more easily on 64-bit Raspberry Pi OS and that the Raspberry Pi Zero 2 W could work as a way to encapsulate IMPS in a very small and low-powered package.


![The Raspberry Pi Zero 2 W with a MIDI output soldered directly on the board.]({% link assets/blog/2024/202402-intelligent-synths-1-raspberrypi.jpg %})

With a Raspberry Pi, you (strictly speaking) might not even need an external MIDI interface as you can get a MIDI signal straight off the Pi's serial GPIO pins.

![Circuit diagram for the MIDI output, two resistors are necessary which can be hidden inside the MIDI connector]({% link assets/blog/2024/202402-intelligent-synths-4-circuit-diagram.jpg %})

As an initial demo I connected a (somewhat refactored) IMPS Raspberry Pi to a Korg Volca FM.


![An intelligent Korg Volca FM]({% link assets/blog/2024/202402-intelligent-synths-2-volcafm.jpg %})

The Volca FM is squeaky, self-contained, and reasonably fun to experiment with. So far, I've only got a MIDI out on the Raspberry Pi so the interaction is one way between the Pi and the Volca. 

Here's a video with the volca demonstrating this idea. In this video, I explored the name "GenAI MIDI plug" for this idea, thinking of encapsulation to something that is close to a MIDI plug as the important part of this project.

{% include youtubePlayer.html id="TU-jIDH9pYU" %}


Extending this idea, I connected the system to a Behringer K-2 synth. The Pi Zero 2 W actually fits right behind the synth. This suggests incorporating the Pi Zero into lots of different synths to start to explore many intelligent instrument designs.

![The IMPS Pi connected to a Behringer K-2]({% link assets/blog/2024/202402-intelligent-synths-3-behringer.jpg %})




_Edit:_ This work is (so far) exploratory but I've written up some of the early thought processes in a workshop paper for GenAICHI 2024:

- [Generative AI for Musicians: Small-Data Prototyping to Design Intelligent
Musical Instruments](https://generativeaiandhci.github.io/papers/2024/genaichi2024_50.pdf)
