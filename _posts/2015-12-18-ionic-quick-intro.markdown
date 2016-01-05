---
layout: post
title:  "A Noob's Quick, Technical Intro to Ionic"
date:   2015-12-18 07:13:13 -0800
categories: 
---

_(This is part of a series on [how I used WordPress to create a functional app prototype in a 54 hour startup weekend](/news/startup-weekend-winter-2015/). There are references in this article to code samples and concepts mentioned in previous articles so take a look at those if something here doesn't make sense)_

I wanted to have this article be a goto resource for making WordPress-powered Ionic mobile apps. When I was getting started, I found a lot of great resources and conceptual ideas, but never a step by step guide to getting everything installed.

Now that I've gone through the process a few times, I've decided to not rewrite the dictionary, but instead provide some missing key points from the best articles out there. My goal is that you'll be able to walk away from this small set of articles with a working starter app and all of the resources you'll need to accomplish anything you want with Ionic. 

## Definition 

I've [once described](/news/anatomy-of-a-wp-powered-mobile-app) [Ionic](http://ionic.io) as:

> ... the buttered toast of app making for web devs. You only need to write HTML, CSS, and AngularJS to make full-featured, cross-platform apps with a single codebase. It's the best.

I really like the description made on the Reactor blog ([reactorapps.io/blog/wordpress-api-ionic-app](http://reactorapps.io/blog/wordpress-api-ionic-app)):

> Ionic allows you to add elements to your app such as menus, page transitions, modal windows, and handle your data with pre-built "drop-in" components. It is built on AngularJS, although it abstracts much of the complexity of Angular away, and makes it easier to use. … Hybrid apps have admittedly been terrible in the past, but Ionic, along with advancements in device technology, are changing that quickly. Using a well-built Ionic app on a modern device is almost indistinguishable from a native app in many cases.

It's a framework that helps you create mobile and web apps with the tools you probably already know (HTML and CSS) and maybe a little you don't (AngularJS).

As an AngularJS web developer, I love Ionic. You could argue the pros and cons of hybrid vs native apps, or the differences between the faux/near-native tools that are hitting our world every few months ([React Native](http://www.reactnative.com), [Famo.us](http://famous.co), [Polymer](https://www.polymer-project.org), etc), but the most important factor of code delivery is getting the work done. This article is about Ionic. There will probably be more about some of those other tools, but right now: Ionic works.

## The short master list of getting started / things to consume to get started

These resources helped me a lot when I was getting started. I'll be making references to them in this article, but figured I'd also aggregate them here to make them easier to find in the future.

- [Official Ionic Framework Docs](http://ionicframework.com/docs)
- [Official Ionic Platform Docs](http://docs.ionic.io)
- [Scotch IO's article on creating your first mobile app](https://scotch.io/tutorials/create-your-first-mobile-app-with-angularjs-and-ionic) - This is a great tutorial with really good code samples. Seriously, I'm not going to say much that isn't covered in this one. Go read it
- [Reactor's article on getting started creating WordPress-powered Ionic apps](http://reactorapps.io/blog/wordpress-api-ionic-app) - Again, I'm only going to highlight why this article's important. It's a must read. 
- [Learn Ionic "formulas"](http://learn.ionicframework.com/formulas/) - Even though this site hasn't been updated in a while, it has a great collection of tutorials. 

Yes, there's two official documentation sites. They have a lot of overlapping information, but also a lot of non-overlapping information. The difference is that the Ionic Platform **"offers a range of powerful, hybrid-focused mobile backend services and tools to make it easy to build beautiful, performant hybrid apps, at a rapid pace."** In other words, while the Ionic Framework is the comple codebase-starter for a hybrid app, the Ionic Platform provides free and premium tools to make a customer facing service. 

My suggestion is to refer to them both while you learn because the way a concept is explained in one will potentially trigger an "Aha!" Moment. 

## Setting up the project 

This guide on [creating a to-do app](https://scotch.io/tutorials/create-your-first-mobile-app-with-angularjs-and-ionic) by Scotch covers a lot of great basics with really good snippets: 

- An overview of Ionic, Angular, and Cordova
- How to set up the project 
- Serving the app on your computer and setting up "lab mode" to view iOS and Android side by side 
- How Angular interacts with the project
- Adding local storage

One thing I want to stress is how easy it is to get a full Ionic project setup on a completely new system.

All you need to run are the following terminal commands (and make sure you have [NPM installed](http://blog.npmjs.org/post/85484771375/how-to-install-npm)):

```
npm install -g cordova ionic
ionic start {appname} {template}
cd {appname}
ionic platform add ios
ionic platform add android
ionic serve
```

The final command will boot up your default browser with the fully interactive app. It's easier than making pancakes.

The only snafoo in this setup process is that your project will be initialized with a layout template. If you list nothing, you will get the **blank** template and if you're anything like me will think only half of ionic got installed. Don't worry, everything's OK.

The article wraps up with a section on testing using PhoneGap which I disagree with. The Ionic team has made emulating iOS and Android so simple that you barely need device testing, but when you do, you can use their free [IonicView](http://view.ionic.io) app to not only load it on your own phone, but also send it to other people on your team for them to preview and QA.

You can also run `ionic run {platform}` (where {platform} is `ios` or `android` with a device plugged into your computer to get actual hardware testing.

For example, after plugging my droid into my computer and running: `ionic run android`, the terminal becomes full of log messages as an APK of my app is built and instantly launched on my device.

There are also a few differences between the code repo provided and the code in the examples. Read the comments for the specifics.


## Build a Mobile App with the WordPress REST API and Ionic

[This article from Reactor](http://reactorapps.io/blog/wordpress-api-ionic-app/) introduces the basics of getting the WordPress side up and running to work with the app. It has great brainfood considering how you can approach  plugins, themes, and content architecture for your app. 

- Getting WordPress content into the app through the [WP JSON REST API](https://wordpress.org/plugins/json-rest-api/)
- Querying data with jQuery
- Ionic templating
