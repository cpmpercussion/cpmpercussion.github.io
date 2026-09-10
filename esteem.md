---
layout: page
title: Esteem and Service
permalink: /esteem/
description: "Funding, leadership roles, awards, supervision, software adoption and creative outputs of Charles Martin, collected in one place for assessors and collaborators."
tags: [esteem, service, funding, supervision, research profile]
---

{% assign m = site.data.metrics %}

This page collects indicators of research esteem, leadership and service in one place. Figures carry the date they were last checked. For the argument these support, see [why this work matters]({% link bio.md %}#why-this-work-matters).

## Roles

- Senior Lecturer, School of Computing, Australian National University (2022--). Lecturer (2019--2021).
- Interim Associate Director (Education), ANU School of Computing (April 2026--).
- Lead of the ANU node of the [MishMash Centre for AI and Creativity](https://mishmash.no), Norway (2026--).
- Visiting Scientist, CSIRO (2021--).
- Postdoctoral Fellow, [EPEC project](https://www.uio.no/ritmo/english/projects/all/epec/), Robotics and Intelligent Systems group, University of Oslo (2016--2019). Honorary Associate Professor, University of Oslo (2021--2022).

## Funding

| Year | Source | Amount |
|---|---|---|
| 2026 | MishMash Centre for AI and Creativity, Research Council of Norway. ANU node within a 173M NOK (A$25M) national centre. | A$150,000 to ANU |
| 2022 | Defence Science and Technology Group, AI for Decision Making Initiative | A$30,000 |
| 2019 | CSIRO Data61 Collaborative Research Project, "The Augmented Urban Web" (with H Gardner, B Swift and others) | A$20,000 |
| 2019 | NVIDIA Data Science GPU Grant | hardware, US$3,000 |
| 2017 | University of Oslo, GPU workstations | A$22,500 |
| 2017 | Arts Council Norway, development grant for "Synesthetic" | A$11,600 |
| 2010--2014 | Australia Council for the Arts, ArtsACT, National Science Week and ANU grants for performance works and travel | A$48,000 in total |

PhD students in the lab are funded by the CSIRO Next Generation Graduate Program, a CSIRO Cobotics top-up scholarship, the Australian Government Research Training Program and ANU scholarships. NIME 2025 returned a surplus of about A$40,000 to the university.

## Leadership in the field

- **General Chair, [NIME 2025](https://nime.org/web_archive/2025/)**, the International Conference on New Interfaces for Musical Expression, hosted at the ANU. {{ m.nime2025.attendees }} attendees ({{ m.nime2025.in_person }} in person, {{ m.nime2025.remote }} remote), {{ m.nime2025.papers }} papers, {{ m.nime2025.musical_works }} musical works, {{ m.nime2025.workshops }} workshops and {{ m.nime2025.concerts }} concerts. Proceedings were published before the conference and an accessibility chair was introduced. Full archive: [doi:{{ m.nime2025.archive_doi }}](https://doi.org/{{ m.nime2025.archive_doi }}). [Reflection on hosting NIME 2025]({% link _posts/2026-02-06-on-hosting-nime2025-in-canberra.md %}).
- **General Chair, OzCHI 2022**, hosted at the ANU, with a [hybrid format]({% link _posts/2023-07-21-hybrid-conference.md %}) recognised by the CHISIG executive for its accessibility and reduced carbon impact.
- **Co-founder and Co-Chair, Generative AI and HCI (GenAICHI) workshop at ACM CHI**, 2022--2025.
- **Elected Board Member, NIME** (2024--); NIME Web Officer (2019--2024); NIME workshop chair (2022) and demo chair (2016).
- **President** (2019--2021) then **Secretary** (2021--) of the Australasian Computer Music Association. Paper and Artist Talk Chair, Australasian Computer Music Conference 2020.
- **Lead Editor, [Chroma: Journal of the Australasian Computer Music Association](https://journal.computermusic.org.au/chroma)**, 2021--2023, rebooting the journal.

## Peer review and recognition

- Reviewer for the **European Research Council** Consolidator Grant scheme (2025).
- **Associate Chair**: ACM CHI 2026, ACM Multimedia 2024, ACM DIS 2022. More than 110 reviews logged in Precision Conference with special reviewer recognition at CHI 2018, DIS 2022 and CHI 2026.
- **Senior Member** of the ACM and of the IEEE.
- **Senior Fellow of the Higher Education Academy** (2023).
- **Teaching Excellence Award** and **Excellence in Supervision Commendation**, ANU College of Systems and Society Education Awards 2025. Dean's Award for Remote Teaching and Student Experience (2020).
- PhD examiner for two theses and Master's examiner for one.

## Invited talks and media

- Invited workshop on inclusive teacher training, ANU IDEATE summit for senior higher education leaders (2025).
- linux.conf.au (2021); Data Science Conference Europe (2020); Tekna Big Data Network, Norway (2018); Cutting Edge Festival, Oslo Innovation Week (2017); Technology and Emotions Conference, Oslo (2017); Music and Video Games, Oslo Konserthus (2016); Percussive Arts Society International Convention, Indianapolis (2014).
- Workshop leader, "Creative Prediction with Neural Networks", ALife 2018 and NIME 2019; "Building NIMEs with Embedded AI", NIME 2024.
- Media: The Conversation (2021, DyRET robot); WIN News and Nine News Canberra (2019, Electronic Carillon); Canberra Times (2019, 2013); ANU TV (2014).

## Supervision

- **PhD completed**: Dr Yichen Wang (ANU, 2021--2026, now postdoctoral fellow, Université de Lille); Dr Benedikte Wallace (University of Oslo, 2018--2023, now postdoctoral fellow, University of Oslo); Dr Tønnes Nygaard (University of Oslo, associate supervisor, 2016--2020, now Associate Professor, University of Oslo).
- **PhD under examination**: Xinlei Niu (ANU, submitted March 2026).
- **PhD continuing**: Minsik Choi, Sandy Ma, Albert Ngabo-Niyonsenga.
- 14+ Master's and 16+ Honours students supervised.
- Student outcomes include papers at CHI, Creativity and Cognition, NIME, ICML, ICASSP, Interspeech and AAAI; three internships at Dolby and one at Sony AI; and committee roles at NIME 2025 and GenAICHI 2025.

## Software and adoption

| Software | What it is | Adoption |
|---|---|---|
| [IMPSY]({% link _projects/imps.md %}) | Open-source intelligent musical instrument platform, running on a Raspberry Pi | {{ m.software.impsy.releases }} releases since 2019; basis of Sandy Ma's 2025 commission at Science Gallery Melbourne and of lab papers at CHI, Creativity and Cognition and NIME |
| [keras-mdn-layer](https://github.com/cpmpercussion/keras-mdn-layer) | Mixture density network layer for Keras and TensorFlow | {{ m.software.keras_mdn_layer.stars }} GitHub stars, {{ m.software.keras_mdn_layer.forks }} forks, {{ m.software.keras_mdn_layer.citing_papers }} citing papers outside the lab |
| [MicroJam]({% link _projects/microjam.md %}), [PhaseRings]({% link _projects/phaserings.md %}) | iOS music-making apps | Publicly released on the App Store; MicroJam archived on Zenodo |
| RoboJam, Gesture-RNN, Metatone Classifier | Research systems for predictive and ensemble touchscreen music | Open source with Zenodo DOIs |

Software figures retrieved {{ m.software.retrieved | date: "%-d %B %Y" }}.

## Creative practice

- 15+ performances with intelligent musical instruments in 2024--2026, including the curated [SoundOut Festival 2026]({% link _posts/2026-02-01-soundout-2026.md %}) and a peer-reviewed performance at NIME 2026 in London.
- Seven albums, most recently [Hyphae]({% link _projects/hyphae.md %}) (2026) with Alexander Hunter as Andromeda is Coming.
- Commissions and installations include the Electronic Carillon for the National Capital Authority (2019) and live soundtracks for Martyn Jolly's Magic Lantern shows (2020--2025).

## Teaching at scale

- Initiated Sound and Music Computing at the ANU in 2019 with 7 students; 180 enrolled in 2025, assessed through public concert performance.
- Co-led the Human Centred and Creative Computing major, minor and specialisations (from 2023), convenor from 2024. Now the third-largest study focus in the School of Computing and its most gender-diverse (48% non-male students, 2025).
- Designed and delivered college-wide tutor training: about 90 tutors in 2025 and more than 130 in the first half of 2026.
- Redesigned Human-Computer Interaction (2025, 296 students) and Computer Organisation and Program Execution (2022, about 400 students).
