---
layout: post
title:  "Anatomy of a WordPress Powered Mobile App"
date:   2015-12-03 07:13:13 -0800
categories: 
---

_(This is part of a series on [how I used WordPress to create a functional app prototype in a 54 hour startup weekend](/news/startup-weekend-winter-2015/). There are references in this article to code samples and concepts mentioned in previous articles so take a look at those if something here doesn't make sense)_

From a WordPress development approach, architecting a mobile app is very easy. WP's data is already well structured and full of features like post types, meta, taxonomies, and user data. 

In Roy Sivan's article about how he [used WordPress to create CodingOfficeHours.com ](http://www.roysivan.com/launching-angularjs-client-side-application-powered-wordpress), he says:

> "CodingOfficeHours is pretty basic when you strip it apart. It is users, requests (content), payment (Stripe API), and Reviews (content). Nothing WordPress can't handle if you were not building a client-side application. In fact, I could have built the whole thing as a WordPress theme, and called it a day, but that wouldn't have been nearly as fun

This platform flexibility lets you easily pivot your app's feature set as your goals and business model (inevitably) change. This saved me during the startup weekend because I was able to switch focus from making a browser-based Politician to Legislation relationship and data-scraping list site, to a functional, data-driven, mobile prototype. When my team decided to switch our focus part way through the second day, the work we had done gathering and entering data into our site was still valid. 

Just like the publishing industry has been able to use this ideology to create incredibly advanced and integrated content creation workflows, very soon we'll start seeing WordPress as an engine for high-powered augmented reality applications. [RC Lations'](http://wetpaint.io) talk at WordCamp US 2015 on [using WP as the platform for Internet of Things](http://wordpress.tv/2015/12/13/rc-lations-wordpress-the-internet-of-things/) has amazing examples of people doing incredible things with WP.

> "The plugin ecosystem & REST API push our creative limits for what we can imagine building with WordPress – and it's time we looked at powering physical devices using open source platforms like LittleBits and Arduino. This talk will examine use cases and methods for building real-time physical displays powered by WordPress.

I chose [Ionic](http://ionic.io/) for the app's platform. If you don't know the low-down on it, Ionic is the buttered toast of app making for web devs. You only need to write HTML, CSS, and AngularJS to make full-featured, cross-platform apps with a single codebase. It's the best. (Take a look at some of the apps made with Ionic and read about why these teams  chose it: [showcase.ionicframework.com](http://showcase.ionicframework.com)).

Services like [Apppresser](https://apppresser.com/) have figured out this perfect breakfast platform of bacon-data and toast and expanded on it, making a seamless connection between WordPress and its API. Here's a great article covering [the basics of Reactor](https://wordimpress.com/building-mobile-apps-with-wordpress-a-reactor-overview) (Apppresser's WordPress-ified take on a WYSIWYG-based app builder) and an example of how intuitive it is: 

I think it's great that there's already a builder tool for WP+Ionic. Check their blog out because they're constantly adding great Ionic resources and app concepts: [reactor.apppresser.com/blog](http://reactor.apppresser.com/blog/)

I still delight in seeing the shock and awe in other developers' faces when I tell the [Represent Me](http://representmenow.co) is a WP powered app. I see the gears turning as they come to turns with the idea that you can make an app with a LAMP stack CMS. It truly is an incredible tool for this kind of project. Not only is it the easiest CMS to add content to, but you have the massive plugin library and community at your disposal. There's nothing you cannot do in a WP website, and now all of that potential can be easily transferred to mobile and web apps.
