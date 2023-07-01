---
layout: post
title: "The Historic Decisions Document"
date: 2023-06-30
categories: "software development"
tags: ["historic decisions document", "developer communication"]
---
Documentation is a hassle. As a requirement, it forces you to spend extra cycles on overexplaining what you just did. I mean, the code’s written right? It should be self-documenting, well-constructed, and have significant test coverage so the next developer who works on the code doesn’t mess up the business requirements.
But what about those times where you come across that weird piece of logic where in case X, add 5. It works as it's expected to, nobody has reported it as a bug, it even has a test: “When X it should add 5.” But why'd we decide to do that? Does the Product Owner even remember?
Enter the Historic Decisions Document
The concept is to have an artifact that records the WHY of features. The things you will inevitably forget 6, 8, 24 months down the road. The things that when someone new joins the team will ask you “why did you build this in that way” and your only answer will be “I don’t remember.”
The purpose is not to repeat what can be logged in a doc block, or referred to in a ticket number in a comment, or reviewed in a living design document. This covers the actual decisions that have been made throughout the lifecycle of a project. The REASON you decided to “add 5 in case X” because it’s a business need spanning multiple services and related to a specific customer type.
Beyond existing as an encyclopedia about the project for your team, it sheds light for others (technical and non-technical alike) on what is changing in the system. As your engineering organization grows this becomes increasingly important. It's also important in a small organization, where it's easy to over-rely on subject matter experts who are a shoulder-tap away.. until they go on vacation.
Don’t expect future-you to understand the context of the present. The Historic Decisions Document is a tool that will make your life easier in the future so you can focus on the important things that matter.
