---
layout: post
title:  "How to Setup the WordPress REST API"
date:   2015-11-17 07:18:13 -0800
categories: 
---

_(This is part of a series on [how I used WordPress to create a functional app prototype in a 54 hour startup weekend](/2015/11/15/startup-weekend-winter-2015/))_

All you need to open up the REST API is the plugin. There are over 362 results if you search “rest api” in the plugin repository (in late 2015) so make sure you install [WP REST API (WP API)](https://wordpress.org/plugins/json-rest-api/) by the WP REST API Team. Activate and BOOM. All done.

Being a WordPress project, the REST API is under constant development. Right now, version 2 of the API looks like it will offer a lot more power towards what you can access. For this project I went with v1 because it's stable. I want to be able to update the codebase for this project as easily as possible because contributors' time will be limited. V2 will offer a lot of cool features, but they might get axed on the next update and I can't risk losing time debugging errors caused by essential features that are no longer supported. Upgrading can be its own project later.

To make sure our site is set up OK, let's hit all of our posts. Open up a browser tab and go to yoursite.com/wp-json/posts. 

You'll get a page of JSON code that looks like text with a lot of braces, brackets, commas, and semi-colons. Welcome to the Neo-view of the internet:

```
[ { "ID":102,"title":"Don&#8217;t Vote Blindly","status":"publish","type":"post","author":{"ID":18,"username":"myuser","name":"User 1","first_name":"User","last_name":"One","nickname":"User One","slug":"user","URL":"","meta":{"links":{"self":"http:\/\/mysite\/wp-json\/users\/18","archives":"http:\/\/mysite\/wp-json\/users\/18\/posts"}}},"content":"<p>You vote for politicians, but\u00a0how often do they stick to their word? \u00a0Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non pulvinar urna. Nunc vel nibh at nunc auctor placerat. Cras malesuada sapien massa, sit amet viverra mauris vulputate ac...
```

JSON stands for JavaScript Object Notation and this text is actually code that the Ionic app can read. What's contained in this code is an array (a list) of post objects. Each post object contains data about the post such as its title, when it was posted, who the author is, the content, the thumbnail image and a ton more.

Reading this data in a jumbled mess of unformated text is pretty hard on the eyes. There are a lot of browser and OS-based tools that make the data pretty. My favorite is [Postman](https://www.getpostman.com) and I'll have another article up soon about how I use it to read WP-API data.

Luckily, we don't need to read it with our human eyes. We just need to know _how_ it's organized. Using the Represent Me mobile app as an example, I just care about the post's title and content. My app's code sifts through the JSON and grabs that data, letting me easily place it wherever I want (see the sections on Ionic for code samples).