---
layout: post
title: "Mob Programming Tips"
date: 2018-06-14
categories: "programming"
tags: ["programming", "mob programming", "programming techniques", "team techniques"]
---

This article continues [my previous one about mob programming](http://azanebrain.github.io/news/why-would-anyone-mob-program/) - the technique of having multiple developers work on the same code.. through one keyboard.

It sounds crazy, but my team had a surprising amount of success with it. This article will outline all of the tools, techniques, and gotchas that helped my team be successful.

## Tools

* The first thing you'll need is space. Mobbing involves a lot of talking and causes lots of noise. If you work in a pit, you'll probably be too distracting to your colleagues so find a section of the room that's isolated. You'll also want to make sure _you_ have enough space to move around freely
* A big monitor. It's essential that everyone can see the screen at the same time. If you can't see the line numbers in your IDE, it's too small. If you have enough space to setup two monitors and extend your screen, go for it, but I haven't seen it work - the secondary monitor is either too small, or positioned in a way that doesn't have clear visibility for everyone.
* Give up your desk. Now that you're all sharing the same desk, there's no point in having your "own" space - in fact, it will invade the group's space and give you the very bad opportunity of working on something that isn't the mob’s priority. Instead, have a research station or two where anyone can break away from the mob to look up something
* Possibly a few extra keyboards and mice. If you find it's too hard to get to the keyboard when it's your turn  to drive, try having a few more keyboards - just make sure you don't have to contort your body to see the screen!
* A big whiteboard
* [Pluralsight's Mob Timer Tool](https://github.com/pluralsight/mob-timer) is awesome. It lets you add an avatar for each team member so that you know who should be driving and who's next. It can also do a pop-up when it's time to switch drivers that will block the whole screen. We configured it to switch drivers every 20 minutes, and we took a break after every fourth person.
  * Instead of people's real faces, choose a theme each week l. Some of our favorites were Horror Movie Monsters, Rock Bands, and Nicolas Cage-Faced Pokemon. Don't use GIFs - it's way too distracting
* Vimium: Adds VIM type tooling to Chrome. This is useful for telling the driver what link to press

## Techniques

### Things that work

* Ask questions. Mobbing only works when everyone understands what's happening. If you're confused or lost: Get clarification. Often, when explaining something, you will be forced to re-evaluate your assumptions and make sure your solution is bullet-proof
* Focus on a single task. The mob should only focus on one thing from start to finish. There should be no blockers or handoffs since your team has multiple viewpoints evaluating the code, architecture, and testing. The mob will be able to roll through task after task and other parties like your product manager will have clear visibility into what is being accomplished.
* Keep mob focused and on the simplest solution available for a given task. It's very easy to dive into overly-technical planning discussions. Focus on keeping it simple
* Squash parallel convos
* Decide how many people are needed for a quorum. Our team decided that development would begin as long as we had 3 people in the office
* Don't be afraid to switch tasks when you're all stuck. Someone will inevitably be thinking about the problem and will probably come to a eureka conclusion
* Define when it is okay to split the mob. Sometimes you'll hit a wall. It's okay to split up and work in parallel
* When you split to do research, time-box it. Everyone works at different paces so some will inevitably complete there research and have nothing to do. If everyone stops at a set time, you can sync your notes and anything you didn't figure out you may have enough info for the mob to get started
* Figure out ways to decrease troubleshooting. The mob shouldn't be spending time figuring out how to set up keybindings in your IDE. If the whole mob is stuck on something for 10 minutes, consider breaking apart
* Send one member as a representative to meetings. Since each member knows the system and what you've been working on fully, they can represent the whole team
* Take a few breaks through the day to check individual email / slack for personal messages you missed while mobbing
* Keep it fun
* Every line of code should be written by the mob, not copied from someone's personal research. 
  * I'm conflicted by this because I don't think it's a valuable use of time writing documentation and creating test mocks in a full mob. Instead, we would assign a person to write these during our split time and create a PR that the team reviews together.
  * Make this a statement, like: Unless documentation and mocks, every line must be written in the mob
* Track daily goals and set them ahead of time or the day before so the mob can hit the ground sprinting
  * Have a daily standup/wrap-up where you track in a table what worked, didn't work, and other notes from each person
  * Keep a record of each day’s accomplishments and decisions. It will help when individuals need to find out what the team has been doing, and make sure everyone's on the same page about what the mob is focused on
  * These practices promote the idea that anyone can leave at any time, and be able to come back fluidly
* Avoid accounts where possible. 
  * Use an email list alias for communication. If you stop mobbing, it will be easier to continue using the email alias
  * Defer to slack channels instead of a user. If you ever stop mobbing, all that convo will be in an unused account. Keeping it in a channel also let's individuals review the convo from their personal accounts
* If you use tools like slack, set your status indicating that you are mobbing, and what room to use in order to speak with the mob to find you
* Don't be afraid to do training and exercises
* Design must be top priority. The higher quality planning you can do, the less time you'll have to spend debugging and fixing bugs, and restructuring your architecture. As I mentioned in my previous article, you have assumptions that noone else will ever think of. Spend more time than you think you need on planning. Measure twice, cut once
* Throat lozenges and tea. You will be spending _lots_ of time talking. Take care of your throat. Throat Coat tea is awesome

### Things that don't work

* Multiple conversations happening in parallel. As soon as you notice this happening, cut both conversations, come back together, and go through both as a group
* "Mob mentality." It's dangerous to go along with the group because it's a group. Peer pressure aside, you might fall into this trap from brain fatigue. Keep an eye out for decisions the group made that have no (or weak) reasoning
* Brainstorming too early. Have you ever tried picking a restaurant to go to work 6 opinionated friends? Brainstorming in a mob is no different. If you start trying to plan for dinner right after eating breakfast, people are going to spend more time imagining what they _think they will_ want. On the other hand, if you wait to decide 5 minutes before it's time to go, the group is going to come to a decision faster. You want to emulate the "5 minutes before" option
* Not splitting the mob. Splitting is one of the most powerful things you can do while mobbing. Don't forget that each mob member has full context of the entire project. When you split, you're basically making copies of yourself. It's an awesome concept, just make sure you don't diverge too far
* Estimating is nearly impossible. It's so hard to gauge how much planning needs to happen, and what will go into getting everyone on board
* Marathoning. Mobbing is more draining than just about anything you'll do in your life. Don't try to marathon because you'll burn yourself out

## Lexicon

Telling people how to write code is a unique experience that requires its own language. I like to think of text-based tools Vim and emacs: How do you tell someone to cut 5 lines then paste them 14 lines up? The same way you tell these tools.

* Line X-And-A-Half: Start on line X and start a new line
* Key DIRECTION NUMBER: Move the cursor NUMBER spaces to the DIRECTION

## Conclusion

I hope these tips will help you have a successful time mobbing. I only tried it for a few months and have lots to learn. Let me know how it goes for you and if you have any suggestions of your own!
