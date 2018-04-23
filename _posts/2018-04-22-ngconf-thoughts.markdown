---
layout: post
title: "My Thoughts from NGConf 2018"
date: 2018-04-22
categories: "programming"
tags: ["angular", "conference", "ngconf"]
---

I just got back from ngconf2018 and wanted to share some of my thoughts on new concepts materializing in the ecosystem. From my point of view, there seems to be a major shift in the trajectory of the community towards getting everyone into the habit of keeping assets up to date, well tested, and continually pushing the envelope.

# Angular Elements

This is a major shift in how Angular can be utilized. In a nutshell: Elements will allow us to export individual Angular components as native HTML web components. This means you can import the functionality of the component into not only another Angular application, but also a basic HTML/JS page, or an app running on another framework, such as React. This will have huge implications for Progressive Web App developers and platforms like Ionic that depend on reliable, fast, component-based features.

# Updating

Updates kept coming up as a big concern during the event. Every 6 months, a new major version of Angular is released that can have breaking changes. These updates not only have new features, but also security patches. In an effort to not make our lives a nightmare of constant updates and regression testing, the Angular team has been working hard on supplying tools and concepts to help:

* With v6, all assets in the Angular ecosystem will be the same version (@angular/* assets, the cli, material, etc)
* Angular CLI Schematics: Like the `ng generate ...` command that scaffolds new components, services, modules, etc. Angular CLI Schematics will help with adding more complex features. In this talk, you can see how schematics are used to easily add Material Design features: http://confsnap.com/event/ng-conf-18/111
* `ng update` command in Angular CLI: This uses schematics to automatically get packages to the exactly correct version, as well as update schema in configuration files. We should be able to use this to quickly update core packages as they're released instead of waiting. e2e tests and screenshot comparisons will help regression testing

Beyond features and security patches, the performance of Angular has been on a constant upward trajectory. An upcoming update to the renderer (called Ivy) will significantly decrease bundle sizes. A Hello World app will go from 36kb down to 2.7kb.

[Blue Harvest](https://github.com/angular-seattle/blue-harvest) is a cool looking helper library for End To End testing. It provides screenshot comparisons, the ability to run integration tests in debug mode, and more. You can see it in use here: https://github.com/angular-seattle/protractor-new-hope

# Reactive JS v6

RXJS was added to the Angular ecosystem at v2 as way for components and services to communicate with each other.

Version 6 is adding lots of performance updates and a few breaking features. Now, instead of chaining methods, you will pass functions to the `pipe()` method of an observable - the concepts are the same, the syntax is different. Error handling is now async and the handler method should be passed to the `.subscribe()`. It will also be _much_ less confusing when including operators.

The suggested upgrade plan is to get RXJS up to v5.5.10, follow the docs and run `tslint --fix` a few times before updating to 6. This http://confsnap.com/event/ng-conf-18/158 

# Angular at scale

"There is only one Angular" - Google

Google has over 600 projects all using the current head of Angular. When a commit is pushed, every project is automatically tested. Again, good test coverage lets teams be comfortable that updates won't cause headaches. If any one project breaks from the change, it is automatically rolled back. I think this should be the goal for every company. If you could get into the habit of weekly updates instead of major-only you'll not only benefit from the performance and security features, but also gain the benefit of having high test coverage and confidence in automated smoke tests.

Some useful-looking tools that came up around this concept

* [Dep-Graph](https://www.npmjs.com/package/dep-graph): Reads through NPM dependencies and creates a graph
* [NG-Packagr](https://github.com/dherges/ng-packagr): Packages a resource to be used as an NPM dependency in Angular projects. For example: A veyo-analytics tool that can be easily shared across projects
* [Narwhal Checklist](https://drive.google.com/drive/u/0/mobile/folders/13OnVqbFvz-w-dDc2FQ9_Yv2eXmrhBl5X): This PDF aggregates many best-practices that [Narwhal](nrwl.io) use with their large corporation clients

# Angular for Designers

With all of the updates making development easier, new tools are popping up to streamline the handoff between design and development teams - or even eliminate the concept of a "hand off" entirely.

* Storybook for Sketch allows importing real, functional components into Sketch. It unifies the source of truth by having design comprehensives exactly match production UI (and maybe UX? I need to play w this)
* Pagedraw: This tool takes an opinionated approach by having a GUI tool generate presentational Angular components. The dev team can take this code and wire in the business logic
* StackBlitz.com is an online code editor based on VSCode for quickly mocking up Angular projects. You don't need to install anything

This combination of tools introduces some interesting concepts for making mockups. What if instead of whiteboarding, we used StackBlitz to create interactive wireframes, one step closer to the end product?

This video is basically an inspirational speech of the concepts: http://confsnap.com/event/ng-conf-18/160

# Redux

Implementing Redux patterns in Angular through NGRX (not to be confused with RXJS) is the new hotness. 

I've learned about the basics of redux from a few presentations and React "getting started" tutorials, but I had the pleasure of participating in some workshops and taking at length with other attendees who have put NGRX through the wringer. 

My conclusion is that it seems like there is still a lot of difficulty in documenting the relationship between reducers and side effects. I've hit similar issues with bad practices around when to setup RXJS observable subscriptions. I've found a Redux-like approach of keeping observable definitions, modifying functions, and subscriptions in structurally named methods to solve the confusion.

Personally, I think NGRX is a bit immature and adds unnecessary complexity compared to keeping RXJS observables organized. Once ngrx-data is merged into the core framework, I'll seriously consider implementing the pattern because of the dev tool benefits.

The best aspect, by far, are the dev tools around State management and Action logs. Because you can track every single action, and the resulting state change caused by it, you can reproduce bugs incredibly easily, and setup your environment to work on edge cases. These steps can be exported to JSON, and even captured in production error reports.

Get ready to have your mind melted: https://github.com/reduxjs/redux-devtools/blob/master/README.md

This is huge! You no longer have the "works on my machine" problem because you can share the JSON log off every step taken to get the state into a bug-causing scenario. You will no longer have to write reproduction steps because you'll have an export file of the problem. Years of developers' lives will be restored. 

# Use pipes instead of functions

As a final treat, this talk dives into a simple For Loop optimization that caused an 88% decrease in calls: http://confsnap.com/event/ng-conf-18/106

Remember: Use pipes instead of functions.
