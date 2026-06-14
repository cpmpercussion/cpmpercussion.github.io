---
layout: post
title: Creative Computing on the BBC micro:bit with Bare-Metal ARM Assembly
date: 2025-08-01
category: teaching
image: /assets/blog/2025/2025-baremetal-arm-serial-experiments-charles.jpg
image_alt: "Charles Martin live-coding MIDI in ARM assembly on a BBC micro:bit during a lecture, standing beside a projected screen of code."
tags:
- teaching
- arm assembly
- bbc micro:bit
- computing education
description: "Reflections on teaching second-year computing using ARM assembly on real hardware. A talk given at the University of Oslo Robotics and Intelligent Systems lab in September 2022."
---

In September 2022, I gave a talk at the University of Oslo's Robotics and Intelligent Systems lab about my experience teaching [COMP2300: Computer Organisation and Program Execution](https://comp.anu.edu.au/courses/comp2300/) at ANU. The core idea: teach second-year computing by writing creative ARM assembly programs and running them directly on real hardware. No operating system, no runtime, no guard rails. The course content is archived at [twenty-three-hundred](https://cpmpercussion.github.io/twenty-three-hundred/).

The goals were:

- To build and cement mental models for computer organisation and code execution
- To give students the transformational experience of running code right on the metal

tl;dr: Can students do it? **Yes!**

Here's the talk:

{% include youtubePlayer.html id="mZrlSOVUIYA" %}

In this post, I'll write out the slides and expand a bit on this experience. Looking back, this was transformational for _me_ as well, as I had committed a new way of running this class and the assessments and weekly live-coded lecture demos were all new. The end point of the talk was a high-point of the course: live-coding a MIDI output on the microbit and sending MIDI messages to a synthesiser live in the lecture. It seems basic, but going from `add r0, #1` to MIDI in 12 weeks felt like an incredible journey.

## The Hardware

The course uses the [BBC micro:bit v2](https://microbit.org/), a small ARM Cortex-M4 board designed for education. It has a 5x5 LED grid, buttons, a speaker, microphone, accelerometer, and a Bluetooth radio. Plenty of peripherals to make programming tangible and creative.

## Bare-Metal ARM Assembly

We start from scratch. The minimal bare-metal program looks like this, built and flashed with [this `.ld` linker script](https://github.com/cpmpercussion/microbit-v2-baremetal/blob/main/nRF52833.ld) and [this `Makefile`](https://github.com/cpmpercussion/microbit-v2-baremetal/blob/main/Makefile):

```armasm
.thumb
.syntax unified
    .global __reset

.section .vectors
.word __stack
.word __reset

.text
.thumb_func
__reset:
    mov r0, #0
loop:
    add r0, #1
    nop
    b loop
```

This sets up the vector table, defines a reset handler, and loops forever — that's it. No C library, no startup code beyond what students write themselves. To keep the course accessible, a short [`startup.S` program](https://github.com/cpmpercussion/microbit-vscode-simple/blob/master/lib/startup.S) handles loading static `.data` into RAM and setting up the interrupt vector, so students can write their `main` function in a slightly more familiar pattern:

```armasm
.syntax unified
.global main

.type main, %function
main:
  nop
  ldr r0, =hello

  b main
.size main, .-main

.data
hello:
.word 0x424242
```

Throughout the course, we got to know this snippet very well. It was the starting point of every lecture demo, lab and assignment for the students. 

## Toolchain

The toolchain is built around Visual Studio Code:

- [COMP2300 VS Code extension](https://marketplace.visualstudio.com/items?itemName=comp2300-anu.comp2300-2021-extension)
  - [Cortex Debug Extension](https://github.com/Marus/cortex-debug)
- [COMP2300 toolchain](https://github.com/cpmpercussion/comp2300-toolchain)
  - [xPack OpenOCD](https://xpack.github.io/openocd/)
  - [xPack GNU Arm Embedded GCC](https://xpack.github.io/arm-none-eabi-gcc/) (`arm-none-eabi` — gcc, gdb, ld, objcopy, as)
  - [COMP2300 discoserver](https://github.com/cpmpercussion/comp2300-discoserver): ARM Cortex-M4 CPU emulator (by Benjamin Grey), so students can test code without hardware
  - `make`
- [baremetal micro:bit VS Code template](https://github.com/cpmpercussion/microbit-vscode-simple)
- [baremetal example](https://github.com/cpmpercussion/microbit-v2-baremetal)

Part of making this course inclusive and welcoming for students at all levels was providing a completely effortless toolchain with great debugging tools available.
I made sure that students on all OSs would be able to install all the tools they needed from within VS Code. 
I need to thank my tutor team for incredible work here. Harrison Shoebridge and Brent Schuetze developed the VS Code extension and Benjamin Grey (incredibly) put together an ARM CPU emulator, so students could test basic code without a microbit plugged in.

## The Course

COMP2300/COMP6300 is a second-year computing course, obligatory for all undergraduate computing majors, the ANU equivalent of "intro to computer systems." Since 2020 it has enrolled over 400 students per semester, with 325 passing in 2022. 
The course has moved on a bit with more emphasis on digital logic since I last taught it in 2022 but my version of the curriculum is archived at [twenty-three-hundred](https://cpmpercussion.github.io/twenty-three-hundred/).

The curriculum covers:

1. Digital logic, CPU architecture
2. Machine instructions, ALU operations
3. Memory and memory instructions
4. Conditional execution and control flow
5. Functions
6. Toolchains and compilers
7. Data structures in assembly
8. Interrupts, context switches, asynchronism
9. Networks
10. Operating systems
11. CPU architectures

Labs are the core of the course. They start with `mov r0, #1` and end with students implementing a context switch between two programs — their own miniature OS.

## The Assignments

Two open-ended creative programming assignments give students latitude to make something genuinely their own.

**Assignment 1: [Lightshow](https://comp.anu.edu.au/courses/comp2300/assessments/light-show/)** — use the LED matrix to create a light show that changes over time. The speaker is allowed; input peripherals are not. This scopes the task while still leaving enormous creative space. Students need ALU operations, memory operations, conditional branching, and [control structures (if/then/while/for in assembly)](https://comp.anu.edu.au/courses/comp2300/labs/04-blinky/). Functions, shifting operations, and reading the nrf52833 hardware manual help a lot.

**Assignment 2: [Digital Pet](https://comp.anu.edu.au/courses/comp2300/assessments/digital-pet/)** — build an interactive digital pet displayed on the LED matrix. Requirements: a data structure in memory to store the pet's state, and [interrupts](https://comp.anu.edu.au/courses/comp2300/labs/08-interrupts/) to detect button presses. Sound and any available peripheral are fair game. This introduces functions, calling conventions, structs and arrays in assembly, SysTick timers, and much deeper engagement with the hardware manual.

## Going Deeper: IO and Networks

Later in the semester, students explore how computers communicate. Starting from the concept of a voltage on a wire, they construct basic UART (RS-232/serial) communication from first principles and then using the nrf52833's on-chip peripherals.

![Binary serial data on a wire]({{site.baseurl}}/assets/blog/2025/2025-baremetal-arm-serial.jpg)

This extends naturally to MIDI — a serial protocol at the heart of electronic music since 1983.

![A MIDI message broken down byte-by-byte]({{site.baseurl}}/assets/blog/2025/2025-baremetal-arm-midi.png)

## Serial Experiments Charles

The climax of the course, and of this talk, is a live lecture where I coded MIDI output in ARM assembly on a micro:bit in real time. The idea was to show students that you can tell stories in assembly code, that low-level programming can be expressive, even musical. Here's a photo from that lecture:

![Live-coding MIDI in ARM assembly on a BBC micro:bit in a lecture]({{site.baseurl}}/assets/blog/2025/2025-baremetal-arm-serial-experiments-charles.jpg)

And here's the demo — MIDI output produced entirely from bare-metal ARM assembly, live:

<video controls loop style="width:100%; max-width:720px;">
  <source src="{{site.baseurl}}/assets/blog/2025/2025-baremetal-arm-midi-demo.mp4" type="video/mp4">
</video>

No operating system. No MIDI library. Just ARM assembly instructions, a carefully crafted timing loop, sending bits to GPIO pins, and a micro:bit plugged into a synthesiser. The point is to demonstrate that this is *possible*, and doing it live in a lecture makes students see assembly in a completely different way. This scaffold the ideas of interrupts, timing, and real-world consequences of small deviation in the code (because of course it goes wrong when I make adjustments). 

## YourOS 1.0

The most challenging lab in the course, originally written by the inimitable [Ben Swift](https://benswift.me), asks students to build a handcrafted context switch and use it to run two programs concurrently: one LED blinking on one side of the display, another on the other. Students define their own process table in memory:

```armasm
.data
process_table:
.word 0            @ index of currently-operating process
.word 0x20008000   @ stack pointer 1
.word 0x20007000   @ stack pointer 2
```

Getting this to work requires understanding the exception model, stack management, privilege levels, and scheduling. The same concepts behind every real operating system.

## Reflections

**What can go wrong? Surprisingly little.** We explicitly *don't* tell students to be careful in this course. Across the whole cohort of ~400 students in 2022, there were only 1–2 instances of students physically breaking a micro:bit, and 2 instances of bricking one. The one real pitfall turned out to be toggling a GPIO pin as fast as possible (a one-cycle loop) can disrupt the USB connection. The micro:bit developers provided special firmware to handle this case.

**What can go right?**

Assignments students actually *want* to do. Student feedback at the end of the course was so positive and affirming:

> "This is the best course I've ever taken."

> "I thought assembly would be boring, but it was really fun!"

> "I feel like I learnt a lot from taking this course."

There's something genuinely exciting about running your own code on the metal with no abstractions hiding what's happening. The live MIDI demo captures this impact. It's one thing to tell students that assembly is powerful and another to show them music coming out of a chip programmed by hand. 

Students come in feeling intimidated and bored by assembly end up building creative, expressive programs in a language most people never touch. They come out feeling like original 1970s hackers or 90s demoscene programmers with creative achievements in their portfolios and a deeper understanding of how computers really work.

The [presentation slides](https://cpmpercussion.github.io/creative-prediction/presentations/2022-baremetal-arm/) from the Oslo talk are available online.
