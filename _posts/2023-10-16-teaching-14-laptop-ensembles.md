---
layout: post
title: Teaching 14 Laptop Ensembles
date: 2023-10-16
category: teaching
tags:
- teaching
- laptop ensemble
- music
- ANU
- computer music
- computing education
description: "A reflection on five years of running laptop ensemble as a credit course at ANU, and what it took to scale from 8 students to 61 in 2023 — with 14 ensembles performing at Llewellyn Hall."
image: /assets/blog/2023/acmc2023-15-lens-concert-llewellyn-dramatic.jpg
image_alt: "A laptop ensemble performance at Llewellyn Hall with dramatic generative visuals filling the screens."
---

This is a write-up of my presentation at the [2023 Australasian Computer Music Conference](https://computermusic.org.au/conferences/acmc2023/) (ACMC2023), held at the University of New England in Parramatta, NSW in October 2023. The talk described five years of running a laptop ensemble as a credit course in the ANU School of Computing, and the challenges — and surprises — of scaling it to 61 students in 2023.

## Background

I started running a for-credit laptop ensemble (LENS) in ANU Computing in 2018. At ACMC2019, Ben Swift, Alec Hunter, and I argued the case for [bringing CS and music students together](https://doi.org/10.25911/5e37e8d92ff89) in a laptop ensemble: it brings creativity into CS education, and it emphasises *tool creation* in music technology. Students don't just use software, they build it.

[![Two Perspectives on Rebooting Computer Music Education paper](/assets/blog/2023/acmc2023-1-two-perspectives.png)](https://doi.org/10.25911/5e37e8d92ff89)

The question I kept coming back to was this: Can we scale the LENS experience to meet the demands of large student numbers that we see in computing? Can we run a LENS class with 50 students? What about 500?

## ANU LENS History

The laptop ensemble at ANU has a 10-year history at various levels of formality:

- **2013-2017**: workshops, projects, collectives
- **2018**: LENS project through the TechLauncher project course
- **2019**: Laptop Ensemble Music and CS Project course (2nd year)
- **2020-2022**: Laptop Ensemble as "Special Topic in Computing" (2nd/3rd year)
- **2023**: Sound and Music Computing COMP4350/8350 (4th year/Masters), now part of the Human Centred and Creative Computing Minor/Major/Specialisation

In 2019, "laptop ensemble" became a special topic course and in 2023 it gained its own course code and title as "Sound and Music Computing". Over that time, student numbers have increase from 8 to 61.

| Year | 2019 | 2020 | 2021 | 2022 | 2023 |
| :-: | :-: | :-: | :-: | :-: | :-: |
| Students | 8 | 9 | 11 | 21 | **61** |

## LENS 2019: The First Credit Course

The first iteration had 8 students meeting weekly. The first half focused on completing tutorials in Pd and Extempore. Students then presented a demo concert and, at the end of semester, each composed and performed an *ensemble piece* and submitted their code and performance materials.

![Students rehearsing for their demo concert in 2019](/assets/blog/2023/acmc2023-2-lens-rehearsal-2019.jpg)

![LENS students gathered around instruments and laptops in the Peter Karmel building studios in 2019 before their final concert.](/assets/blog/2023/acmc2023-4-lens-gathering-2019.jpg)

## What Wasn't Working

Even with only 8 students, problems popped up in 2019. Good students didn't reach their potential. They didn't have confidence in collaboration or improvisation and they didn't get far enough to apply advanced computer music concepts in the final concert.

The root cause: they were focussed on their final ensemble piece and ended up only making that *one piece* all semester. That's not enough practice.

## The Change: Beat Cyphers

Also at ACMC2019, Benjamin Murphy presented a "beat cypher" approach to song production at Box Hill TAFE. The key insight was that new music students have produced very few songs and need to make *lots* of them to develop skills. His solution was to make a song a week following a prompt, then listening and discussing together in class.

Thinking about this paper at the end of 2019 helped me to make sense of the problems in LENS and what we could do to solve them. It was now clear that one piece per semester wouldn't get students anywhere.

## Computer Music Diary

Our response in 2020 was to implement a weekly 1-minute performance screencast called  the **Computer Music Diary**. Students needed to show their screens and submit before class. This task is both easy and hard: easy because it only takes 1 minute to record, hard because students need to do the learning and preparation to show something in the video.

![A student's Gibber code and Pd patch screenshotted for a Computer Music Diary submission](/assets/blog/2023/acmc2023-3-lens-video.png)

We set up a consistent rhythm for the whole course. Each weekly session (2 hours, 15--20 students) became:

| Time | Activity |
| :-: | :-: |
| 00:00 | show up, get settled, pre-class questions |
| 00:10 | listen to that week's CM diary submissions |
| 00:30 | crit discussion |
| 00:50 | small group jam activity |
| 01:20 | group performances |
| 01:40 | discussion, feedback, questions on notice |

**At home:** students create a 1-minute piece (every week), record screen. **In class:** we watch performances together, share knowledge, live improv, discuss. **By the end of the course** everybody has created 8 solo pieces, 2 group pieces and 1 final performance.

![Students watching laptop screens during a workshop session in 2022](/assets/blog/2023/acmc2023-7-lens-workshop-2022.jpg)

Key insights from this format:

- Students create **11 pieces** over the semester, not 1
- Improv starts in **week 1**
- Students need to *learn* to collaborate, exposing crises early, not the day before concert
- Peer-learning and student-led process can be *transcendent* when students show up for each other

We used this structure in 2020, 2021, 2022 in three more "special topic" iterations of LENS.

## Scaling to 60: 14 Ensembles

In 2023, the course got a new code and became a proper part of the CS curriculum. Enrolments jumped to **61 students**, three times the 2022 cohort, split across **14 ensembles** of 4-5 students in three separate workshop groups.

![Students in a laptop ensemble group session, gathered around laptops and a mixer in 2022](/assets/blog/2023/acmc2023-12-lens-group-2022.jpg)

![Another LENS group working together in a studio with audio equipment](/assets/blog/2023/acmc2023-14-lens-group-2-2022.jpg)

The goal was to push the course toward more advanced computer music concepts, while avoiding a loss of shared identity and understanding.

My solution was to **double down on ensembles** as the main organising unit. Ensembles formed in week 4 and submitted group diaries in weeks 5 and 9. The hope was to shake out social problems early, and balance the micro (ensemble), meso (workshop), and macro (lecture) levels of the course.

### Lectures

Lectures were added by popular demand (imagine that!). They cover background and foundational knowledge, with lots of live coding in Pd and Gibber, and discussion of how to actually make music for a concert.

![The LENS lecture venue at ANU in 2023. A collaborative learning space with movable furniture and large screens.](/assets/blog/2023/acmc2023-11-lens-lecture-venue-2023.jpg)

The lectures are very interactive. I present theory and demonstrate a computer music program, then ask students to replicate what I have done and to help each other until everybody can do it on their own computer.

I like to use learning spaces that have individual tables for 5-6 people for this kind of structure.

In 2023, I wrote the lecture slides from the ground up, you can look at the slides here: <https://smcclab.au/smc-course/lectures/>

## The Video Workflow Problem

With 60+ students submitting 1-minute screencasts every week, video becomes an assessment medium at scale. LMS tools are simply not designed for this. I adapted our [Lucy](https://comp.anu.edu.au/docs/lucy/) course management system that knows students, weeks, and folder structures, with code that runs FFMPEG to generate combined weekly crit videos automatically. The FFMPEG code originated with [Ben Swift](https://benswift.me) and dates back to our online conference system for ACMC2020. Ben's FFMPEG wizardry enabled normalised audio and student names overlaid on the videos.

![LENS video workflow diagram: students submit videos on Teams, a server picks them up via OneDrive, combines them into a weekly crit reel](/assets/blog/2023/acmc2023-8-lens-video-workflow.png)

These innovations made it possible to actually *watch* all the submissions in class without wasting time opening tabs, downloading files, or asking students where missing submissions were.

## The Concerts

All 14 ensembles performed during the **ANU Laptop Ensemble 2023 Concert Series** at Llewellyn Hall, ANU School of Music forming three days of performance assessments at scale.

![ANU Laptop Ensemble 2023 Concert Series poster showing 14 ensembles across three days at Llewellyn Hall](/assets/blog/2023/acmc2023-13-lens-concert-poster.jpg)

![An ensemble performing on stage at Llewellyn Hall, with student screens projected on two large screens behind them](/assets/blog/2023/acmc2023-10-lens-stage-setup.jpg)

![View from the audience at Llewellyn Hall — an ensemble performing with code projected on two large screens](/assets/blog/2023/acmc2023-9-lens-concert-llewellyn.jpg)

![An ensemble performance at Llewellyn Hall with dramatic generative visuals filling the screens](/assets/blog/2023/acmc2023-15-lens-concert-llewellyn-dramatic.jpg)

## What Do Computing Students Get Out of SMC?

Just "creativity" is not enough of an answer. The students are primarily upper undergraduate and Master computing students. After some reflection, I have a clearer idea of the knowledge and skills they are developing:

- **Integrated system knowledge**: coding, OS, networks, interfaces, signal processing, interaction design (all applied together)
- **Collaboration and social skills** under real (but friendly) pressure
- **Music and improvisation:** good for the human spirit, and increasingly relevant in HCI and creative computing

There's one part of the course that's hard to explain until it happens. 
Students get to feel the **special responsibility of being on stage, making music in front of an audience**. If your piece crashes, you look like a fool. If it works, you're a rockstar.

I've now learned that SMC students sometimes see the final concert as an important moment at the end of their degree. They overcame many difficulties in learning and collaborating and get the wonderful feeling of showing their work on a big stage.

## Resources

- Course website: <https://comp.anu.edu.au/courses/comp4350/>
- ANU LENS YouTube: <https://www.youtube.com/@anulens>

## References

Martin, C. (2023). Sound and music computing. [Course website, ANU School of Computing]. Retrieved from <https://comp.anu.edu.au/courses/comp4350/>

Murphy, B. (2019). Practicing creativity and the pedagogical benefits of "Beat Cyphers". In *Proceedings of the Australasian Computer Music Conference*, (pp. 32-35).

Swift, B., Martin, C. P., & Hunter, A. (2019). Two perspectives on rebooting computer music and music education: Composition and computer science. In *Proceedings of the Australasian Computer Music Conference*, (pp. 53-57). DOI:[10.25911/5e37e8d92ff89](https://doi.org/10.25911/5e37e8d92ff89)

