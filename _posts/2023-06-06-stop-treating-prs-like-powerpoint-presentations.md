---
layout: post
title: "Stop Treating Pull Requests like PowerPoint Presentations"
date: 2023-06-06
categories: "software development"
tags: ["pull request", "developer communication"]
---

Pull Requests (PRs) are meant to serve as a platform for sharing information across development teams. There is a point in the growth of an engineering organization where knowledge cannot be maintained in brains and needs to be well documented, reviewed asynchronously, and be a platform for conversation to raise the knowledge level of individual engineers.

So why do we hate them?

Because we treat them like PowerPoint presentations.

A PR is typically placed in front of a developer with a requirement to get an “approval” so someone clicks the “approve” button, it gets deployed, everyone's happy.. Until the bugs start raining.

Or, a developer presents their PR to a group whose eyes begin to glaze over as they nod and say “yes, yes, this makes sense,” without any inclination of how to actually work on the piece of code if the PR creator is on vacation.

In practice, the PR can sit for days as multiple engineers discuss the intricacies of the architectural choices, the design of the solution and how it will impact other areas of the application this developer didn't consider, the formatting of methods and naming of variables. After all of that, even if the PR gets through, some senior developer or manager may stumble across a piece of code involved in the PR and say, “this is wrong. Change it.” Repeating the cycle.

Nobody has gained a greater understanding of the system. The back-and-forth comments prompts more questions and frustration. Once the PR is approved and falls into the default-hidden “merged” category, nobody is looking to it as documentation.

On top of all that, every developer has to take time out of productive work cycles to torture themselves.

Haven't we all learned in our past that PowerPoint presentations don't work?

A powerful PR process is one that provides learning THROUGH review. Here are some techniques that add impact to the process and remove the slog we can easily fall into:

* Triad Review: The PR-creator invites at least 2 others to the review process. Instead of presenting the PR, person 2 explains the PR to person 3. In the vein of creative critique, PR-creator is to be silent unless asked a specific question. This method will show PR-creator what is and isn't working in terms of their design, forces person 2 to truly understand the code because person 3 is engaged
* Shoutouts And Questions: Instead of mindlessly giving a “thumbs up” approval to a PR, take time to congratulate the author on an innovative use of a concept or your team's tools. By showing interest, those around you will take note and realize good design. Ask questions about a solution you are not fully bought-in on. If you are confused, at least two other people are too
* Run It Locally: Don't limit your viewport to the diff of the change. Run the code and evaluate it in your IDE. If there is a change to a method, see what other services are referencing it and if they are providing the correct arguments. Does the new implementation make sense compared to the previous solution? Who will be impacted and how is this change going to be communicated out to the team?
* Prompt To Sync: I judiciously use the “if this will take more than 3 sentences to type, let's talk” rule. The worst part of not being able to explain context through text is the fact that “PR Review time” is often de-prioritized. Your question may not be seen for days, leaving the PR in “request limbo.” It's much easier to get the involved parties in the same room at the same time and discuss the solution. This does come with a great danger: The people who talk through the solution will come to an agreement, approve the PR, then 6 months later have no idea what the conversation was. Make sure to followup with some kind of documentation of meeting notes

Make a habit of reviewing PRs and evaluating HOW you can learn from another developer's perspective. The point of a PR review process is not to get code shipped faster, it is to have a broader understanding of the code across a team so that individuals have greater mobility within the system.
