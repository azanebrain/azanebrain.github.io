---
layout: post
title: "A 4-Step Structure for Improving Your Pull Request Review Process for Better Code Delivery"
date: 2023-07-13
categories: "software development"
tags: ["pull-request", "developer communication", "developer communication"]
---
When the PR Review process is a friction point in software delivery, it indicates a need for better design preparation. When the back-and-forth exchange of concepts between reviewers and creators becomes frequent, it shows how both sides are approaching the problem from different points of view too late in the development lifecycle. Now, sometimes that is expected and a natural result of using a pull request to introduce a new concept. It becomes problematic when it hampers code development speed.

Break through this friction by providing enough context for the reviewers to get up to speed. In other words: Give them context.

To achieve this, a strong pull request should have a clear structure including these sections:

1. An overview of what problem this change solves
2. The context that is important for understanding the blast radius of this change
3. How to evaluate the change and replicate in environments
4. Extra information

1. What’s the problem?

It’s very easy to glaze over a diff and say “okay, this looks good. Approved” and move on with your day (see my previous article on treating pull requests like PowerPoint presentations https://azanebrain.github.io/news/stop-treating-prs-like-powerpoint-presentations/). When you actually explain _why_ this change to the code needs to be made, your reviewers will come to the PR with a mindset of evaluating how this achieves that goal. Instead of looking at the code diff, they will be thinking about the implementation.

2. Why is it important to them?

A PR is a messy page of stuff. It means something to you, it means a little less to your team, and it means even less to everyone else. However, every change has a blast radius. No matter how focused your change is, it still impacts other areas of the code which someone (even your future-self), will have to understand and react to.

It’s easy to forget that other people don’t have your brain nor your memories. By being transparent about how this change will impact your reviewers, they will review it from a different perspective considering their own areas of responsibility.

3. Quality Assurance

Make it _easy_ for people to interact with the change in testing environments such as their local system or a shared development environment. By providing the data or “setup your system” instructions, reviewers will quickly start evaluating the change against their day-to-day area of the application and move the whole process towards a closer view of the end-user experience. By identifying and addressing bugs at the PR phase, your future-self will be much happier _not_ solving a p1 fire.

4. Extras

Screenshots, meeting notes, workflow recordings, concept documentation, async discussions, sample datasets for testing, known gotchas, etc. By including these items in the PR, you provide a centralized source of truth that can help resolve confusion efficiently. Remember, this shouldn't be an exhaustive compendium but rather a reference repository for quick answers, eliminating the need for prolonged back-and-forth exchanges.

To wrap it up, think about your PR from the opposite viewpoint. If you were coming to it without understanding the context nor previous design preparation, what questions would you ask? Be prepared for those by providing answers and resources from the beginning. 
