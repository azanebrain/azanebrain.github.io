---
layout: post
title: "Why Would Anyone Mob Program? (an intro)"
date: 2018-04-25
categories: "programming"
tags: ["programming", "mob programming", "programming techniques", "team techniques"]
---


## We had to create a filter

The requirements called for a UI that would allow a user to search for trips by a few parameters like "who took the trip," or "trip date." It was easy. I sat down at the computer and told my colleague to start typing `<input type=text…` but was stopped. Someone else on my team assumed the filter would be a free text search box. We started discussing the idea but stopped when another colleague assumed we would use a "choose your filter" UX similar to Amazon. Yet another colleague suggested some of our problems would be solved with another screen that separated the filter logic into multiple steps.

We spent the next few hours whiteboarding, architecting, a faux coding.

All before a single line of code was written.

This happened on my team's first day of mob programming. Although it sounds painful, it was an incredibly valuable and efficient experience. 

## The Concept

The concept of Mob Programming is pretty simple: Instead of being a coder troll who puts on headphones to ignore the world and bang out an awesome feature - a team of ~3-5 works together on a single feature, with only one person typing at a time.

![Street Sharks Mob Programming and Micro Managing](/assets/streetsharks-micromanage.gif "Mob Sharks")

It sounds insane. But what in the world of software development isn't?

Mob programming works by having a single "driver" at the keyboard. The rest of the team will "navigate" their driver by telling them what to type. Seriously. Every single character of text needs to be verbalized: "Now, on a new line, let's add an input, type text, with a placeholder of …"

The driver seat rotates and whoever is driving *cannot* think. They must become a puppet so that the navigator can translate their thoughts without any friction. It's hard at first, but once you get used to it driving is a nice mental break.

Meanwhile, the other members of the team not actively speaking are able to consider the broader implications of the current design path, jumping in to guide the development when it's going off course, or catch potential bugs. 

## But Why???

Why have five devs do the job of one?

My brother in law told me about the concept before my company started experimenting with it. I thought: What kind of company would do this to their developers? To literally not think and be told by someone else what to type. I went through how many years of hell learning how to write code to shut off my brain?

But he told me one concept of mobbing that stuck with me: While your driver is being navigated, you have the freedom to consider some other part of the system you are going to work on. As if the driver/navigator are the main brain and you are the subconscious. A subconscious that's able to actively focus on some nagging concept that _must_ be done. 

Think about that concept.

When you have your headphones on (in your troll code cave) you are putting 100% of your concentration into the task at hand. Some part of your brain is working on the other things you need to handle: That bug, the next feature, if you turned the oven off - that is your subconscious. 

While mobbing, your subconscious is ~2-4 full brains focused on the main concept at hand - and ~1-2 more can be focused on those pesky, extra tasks. 

## Conclusion

Mob Programming actually works. Despite everything you are thinking and feeling - this technique keeps your team focused on the highest priority items and spreads domain knowledge.

By keeping your team focused on a single task, you are able to move at a constant pace. Suddenly, there are no obstacles in your way. Quality Assurance is not a hurdle because they are part of the team. Assumptions are thrown out the window. Every single decision is passed through a multi-brain filter before any work begins.

It _is_ slow, but the quality of work you produce is at a level multiple times better than what a single developer will ever create.

Your team has one objective to complete, and _everyone_ who interacts with your mob will know it. To distract your team with an "urgent" bug or meeting means to distract the entire mob. This is very powerful. 

Since every mob member has contributed to the project, every member of the mob has full domain knowledge of the system you've developed. If you ever need to sync with another team or present in a meeting, you can send off one member to represent the mob. Afterwards, that member will download their meeting notes to the group. It's very Borg-y.

For all the benefits you'll gain, it is a painful process to go from troll-coding to mobbing. It will take at least 6 weeks to find your groove. My next article in this series will go into techniques that my team gained from our experiment that will help you get through the difficult parts of mobbing.

