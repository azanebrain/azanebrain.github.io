---
layout: post
title: "Hackathons Are Life"
date: 2018-11-14
categories: "coding"
tags: ["code", "coding", "software", "hackathon", "meetup", "organization"]
---

I watched as the group split up into teams. Each one responsible for a different section of the project: Defining the data model and seeding the database, spinning up and hosting the Express API, generating the React app, figuring out how to scrape a page in Chrome…

This was my competition in a recent hackathon. A team of 8 engineers building exactly the same idea my team had: A Chrome Extension which scrapes web pages to inform users that they may be purchasing an item with illegally sourced or environmentally harmful ingredients.

My team had two engineers, one designer, and two non-technicals.

We ended up shipping to the Chrome Web Store and winning the hackathon. They had a prototype that worked on one computer.

Comparing the two teams, our approaches, and the corners we cut to complete the weekend projects, I realized how much hackathons emulate real life.

## Hackathons Emulate Real Life

Similar to a tamagotchi, hackathons condense looong periods of time. Because of the pressure to deploy _something_, teams cut through the bureaucracy of normal company-life and focus on fast release cycles. This forces you (as a teammate) to produce simplest solutions that gain the most benefit. Ironically, this is also the goal of daily company life. So why are hackathons different?

It’s easy (and admittedly fun) to over-plan and over-architect. Here’s the thing about complexity: It’s never worth it. Things (even simple things) don’t go as expected and become complicated. By limiting the time window for when you actually need to ship, you should put yourself into a corner and force yourself to shave off anything that’s not completely necessary - or, you fail to ship and are left with a smoldering pile of complex code the next developer is going to throw away.

It’s dangerous (but admittedly fun) to dive into the new hotness. It’s dangerous because not only are there tons of new frameworks coming out all the time, but you have no idea how the tools you use will evolve. On a hackathon scale, you won’t see the changes, but think about after the hackathon: We always think we’ll maintain a project. But then there’s actual work, and look at that pattern you’ve never used before, didn’t I need to update my computer’s RAM, oh no.. the dishes need to get cleaned… Life happens. By the next time you look at this hackathon project, your future self will have completely forgotten the context of what was going on during your sleep-deprived weekend and maybe not even be able to _run_ the new hotness tool you setup in the last minute.

Use the tools you know and don’t reinvent the wheel.

(Sidenote: This does open up an interesting idea for testing the new hotness. When evaluating a new tool, framework, language, etc, do a hackathon with it. Evaluate how long it takes you to grok the documentation and make a more-complicated-than-hello-world app. Take that number and multiply it by 50 because that’s how long it will _really_ take you. Ask yourself if you can afford that much time researching and learning this tool for a production project.)

## While the other team was architecting…

While the other team was architecting, my dev partner and I spun up a WordPress site, made accounts for our non technical teammates, and used the content they wrote (through the default  WP REST API) to evaluate the current webpage.
When the other team asked what we were using for our database, one of our “content writers” said we didn't have one. The solution was so seamless that the technology became invisible.  


By choosing tools we were comfortable with (although this was the first time  any of us made a chrome extension) and decreasing friction, we were able to focus on developing the hardest parts of the system that provided the most gain. Our solution was light, had about 50% of the features we set out to build, and will keep working without any intervention from my team.

The next time you're planning a feature at work: Try approaching it like a Hackathon. And the next time you go to an hackathon: Don't approach it like work.

I invite you to visit [the project’s site](https://2018zoohackathon.ajzane.com), [download the extension](https://chrome.google.com/webstore/detail/conscious-consumer/epanifmhoacidolgoijlkkphokheimhc), and take a look at [the code](https://github.com/azanebrain/zoohackathon2018).

