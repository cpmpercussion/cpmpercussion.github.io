---
layout: post
title: "Dream Tent: a sonic reconstruction of a 19th-century mind therapy device"
date: 2025-09-17
image: /assets/blog/2025/2025-dream-tent-5.jpg
image_alt: "The Dream Tent in operation in the gallery, a tall fabric enclosure with sound diffused quietly via small loudspeakers under a couch, inviting visitors to enter for full immersion."
description: "Collaborating with Martyn Jolly to reconstruct James Leonard Corning's 1899 Dream Tent at the ANU Drill Hall Gallery, with a generative soundtrack built on Bela and Pure Data."
tags:
- performance
- installation
- bela
- pure data
- magic-lantern
---

Recently, [Martyn Jolly](https://martynjolly.com) and I debuted our *Dream Tent* at the ANU Drill Hall Gallery as part of the [RGB+: Film and Re-enactment Events](https://dhg.anu.edu.au/event_post/rgb-film-and-re-enactment-events/). This was a curated evening of abstract colour film screening and live re-enactment within the *Light Source* exhibition.

![The Dream Tent in operation, during the installation the sound is diffused quietly via small loudspeakers under the couch, inviting visitors to enter and experience full immersion with the side panel closed.]({% link assets/blog/2025/2025-dream-tent-5.jpg %})


## The original Dream Tent

The *Dream Tent* is a reconstruction of an apparatus devised by the American neurologist James Leonard Corning in 1899. As Martyn wrote, Corning theorised that the brain was ["susceptible to chromatic and sonic vibrations in the drowsy state before sleep,"](https://martynjolly.com/2025/10/22/charles-martin-martyn-jolly/) and built a device to explore this. Patients would recline wearing a padded helmet connected via tubing to a phonograph, and watch a motor-driven chromatrope project slowly rotating patterns of colour onto a screen before them. Corning reported treating conditions including "Matutinal Depression", "Inertia", "Insomnia", "Morbid Dreams", "Imperative Conceptions" and "Nervous Irritability".

Martyn has written a longer [account of the project](https://martynjolly.com/2025/10/22/charles-martin-martyn-jolly/) covering the history, reconstruction, and experience of building it together. In our version, the chromatrope is a faithful reconstruction using authentic magic lantern technology. Visitors remove their shoes, recline on a low couch, put on headphones, and spend a few minutes immersed in colour and sound.

![Martyn Jolly demonstrating use of the Dream Tent but without the tent fully zipped up.]({% link assets/blog/2025/2025-dream-tent-2.jpg %})


## Designing a soundtrack for an installation

Previous work with Martyn have been tightly scripted magic lantern performances with live music, narration, and carefully sequenced slides. As an installation, the *Dream Tent* was a different challenge with visitors arriving when they like, spending as long as they like. The soundtrack needed to run continuously, evolve slowly, and never feel like it had started or ended.

The acoustic dimension of Corning's original was the wax cylinder phonograph, a physically rotating mechanical sound source. I wanted to honour that quality but rather than composing a fixed piece, I built a generative system that uses interlocking slow-moving cycles (I imagine them as big "wheels") to drive layers of synthesis and musical events.
Each wheel is a low-frequency oscillator (LFO) operating on a different timescale, gradually modulating amplitude, pitch, and timbre across multiple synthesiser layers. The effect is something that breathes and shifts over long periods without ever arriving at a clear beginning or end; an acoustic parallel to the chromatrope that endlessly turns via it's electric motor.

![The Bela Mini, mixer, and Magic Lantern. Martyn's magic lanterns are authentic but have been retrofitted with LED light sources rather than original limelight burners or early electric lights]({% link assets/blog/2025/2025-dream-tent-3.jpg %})

## Bela and Pure Data

The soundtrack runs on a [Bela Mini](https://bela.io), a small, low-power embedded audio computer designed for real-time audio work. Bela boots directly into the audio patch with no operating system overhead, which means it can run for hours without attention and automatically restart in case of incidental interference (e.g., being uplugged momentarily) that might trouble a laptop.

The patch itself is written in [Pure Data](https://puredata.info) and lives in the [dream-tent-soundtrack repository](https://github.com/cpmpercussion/dream-tent-soundtrack). The synthesis draws on FM synthesis and detuned supersaw layers, tuned to mixolydian scales that suit the archaic and dreamlike quality we were after. Delay and reverb blur the edges of events into one another. The LFO wheels govern which events fire and when layering a gentle randomness on top of the slow cycles, so no two visitors hear quite the same texture.

![Charles Martin (me!) and Martyn Jolly in front of the Dream Tent at Drill Hall Gallery, Canberra]({% link assets/blog/2025/2025-dream-tent-4.jpg %})
