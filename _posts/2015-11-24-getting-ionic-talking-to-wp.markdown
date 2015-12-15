---
layout: post
title:  "Getting Ionic Talking to WordPress"
date:   2015-11-24 07:18:13 -0800
categories: 
---

_(This is part of a series on [how I used WordPress to create a functional app prototype in a 54 hour startup weekend](/news/startup-weekend-winter-2015/). There are references in this article to code samples and concepts mentioned in previous articles so take a look at those if something here doesn't make sense)_

This article is going to cover how to get the data from your WordPress site into your [Ionic](http://Ionic.io/) app. There are already a lot of good resources or there for connecting the two, so I'm going to cover essential concepts for quickly getting a WP-powered app running and tips that would have helped me when I got started

**Good Resources:**

- WP JSON REST API Documentation: [wp-api.org](http://wp-api.org/#posts)
- Angular documentation about the Resource Service: [docs.angularjs.org/api/ngResource/service/$resource](https://docs.angularjs.org/api/ngResource/service/$resource). This documentation can be a lot to digest if you've never looked at the Angular docs before. In terms of Ionic, the "Returns" section is the most important to us because it explains the core actions we'll be doing to get our data: get, save, query, remove, and delete.

A tricky concept about getting your app taking with WP is understanding that the app functions just like a website. Under the hood, Ionic is basically running a browser window to the website "your app" which is running on the [AngularJS MVC framework](https://angularjs.org). Your app is able to requests assets and ping other servers just like any other website hosted from any .com domain.

The WP JSON REST API has a set of special endpoints (basically pages) which will return nothing but JSON data.

Let's look at the example from before: `http://mysite.dev/wp-json/posts`

This endpoint returns an array of post objects. Each object contains aspects of the post like the title, author, published date, content, etc. Angular has a really basic and easy way of pulling these JSON blobs from the WP site. It's called the $http service and this is how it works:

_(NOTE: I'm gonna introduce two Angular topics in this article. The $http service is pretty lame, but it's important. Don't use the following example in your real code, but get the general gist of how it works)_

```js
$http({
    method: 'GET',
    url: 'http://mysite.dev/wp-json/posts',
  }).then(
    //Do something in here, like $scope.posts = result;
  );
```

> NOTE: Make sure you use .then() because .success() and .error() are deprecated

Angular eats this stuff up and makes it really easy to use the WP site data in your views. In this example since the data has been set to the $scope.posts variable, we can iterate over it:

```html
{% raw %}<div ng-repeat="post in posts">
  <h1>{{post.title}}</h1>
  <p>{{post.content}}</p>
</div>
{% endraw %}```
	
That's all easy and good, but that's not enough for us. We've mastered making WP sites using custom-defined post query terms and getting just the data we want. We can do a title/post query in our sleep. That's why we're getting into JS frameworks and hybrid mobile apps, right?

So let's  add some filters:

```js
$http({
  method: 'GET',
  url: 'http://mysite.dev/wp-json/posts?filter[author]=2',
}).then(...);
```

Well... That works but it's UGLY. I don't even know why we have the option to use that because it's just... so… Blggkh!

We're going to use ngResource so we can send an object of query parameters. This will keep our code clean, legible, and easier to make dynamic. 

Here are the steps for getting it into our Ionic app. I'll be diving into each step for the rest of this article:

1: Add the angular-resource JavaScript file to our app
2: Update the angular app module to inject the resource
3: Create a factory so we can reuse as much code as possible
4: inject the factory into the controller  

## 1) Add the resource file to our app

Open up `www/index.html` and add the angular-resource file after Ionic.bundle.js:

From:

```html
<script src="lib/ionic/js/ionic.bundle.js"></script>

<!-- cordova script (this will be a 404 during development) -->
<script src="cordova.js"></script>
```

To:

```html
<script src="lib/ionic/js/ionic.bundle.js"></script>
<script src="lib/Ionic/js/angular/angular-resource.min.js"></script>
<!-- cordova script (this will be a 404 during development) -->
<script src="cordova.js"></script>
```

## 2) Inject the resource into our app

In `www/js/app.js`, Inject the **ngResource** dependency into our app module definition:

```js
angular.module('starter', ['Ionic', 'starter.controllers', 'ngResource'])
```

## 3) Create a factory for the resource

We'll utilize ngResource in an angular factory so that we can hit our WP REST endpoints like they're methods of a class.
In `www/js/app.js` add the following snippet:

```js
.factory('resources', function($resource) {
  return {
    'posts': $resource('http://mysite.dev/wp-json/posts'),
  };
})
```

When we use this, we'll access the endpoint by using something similar to `resources.posts`. I like organizing my resources in this object-y structure because it becomes nearly semantic. 

For example, if we had two endpoints that we used (let's say: one for posts that are published, and one for posts that are drafts), we could access them with a structure like: **resources.publishedPosts** and **resources.draftPosts**. You could continually expand this structure into covering pages, custom post types, user data, etc. Or we could setup different factories like postResources and userResources that divide the different functionality. 

Since there is no limit to what you can request from your WP engine, make sure the lexicon behind your commands is sensical.

## 4) Get the factory into the controller

Similar to how we injected the factory into the app, we need to inject it into our controller to have access to the logic. In `www/js/controllers.js`:

```js
.controller('LegislationCtrl', function($scope, $stateParams, $state, resources) {
  // All the controller logic goes here
})
```

Now that we're in our controller and we have a system for querying, we're going to get all of the legislation. Each piece of legislation is in a custom post type, so the filters are very important. We also only want those that have been published, and we want them in descending order.

We're going to make an asynchronous call to get the data, then apply it to the angular scope. Eventually I'll add an article about serving a loading animation so your users know the app is thinking, but for now we'll keep it simple. 

Altogether our controller will look like this:

```js
.controller('LegislationCtrl', function($scope, $stateParams, $state, resources) {
    resources.posts.query({
      'type[]': 'legislation',
      'filter[status]': 'publish',
      'filter[order]': 'DESC',
    },
    function(posts) {
      // This is the success callback that runs when the WP site responds with the data
      // Output the data to the console so we can examine it from the browser. This line should be removed in production
      console.log('posts: ', posts);
      // Apply the data to our scope
      $scope.posts = posts;
    },
    function(error) {
      // Error callback. This only runs if something goes wrong with the WP site
      console.warn('An error occurred:',error);
      $scope.posts = [{
        title: 'Error',
        content: error.data[0].message,
      }];
    });
})
```

Now in our view, we can loop through all of the legislation items, showing the title and content (similar to the example from before, but more Ionic-y):

```html
<ion-list>
  <ion-item ng-repeat="post in posts">
    <span ng-bind-html="post.title"></span>: 
    <span ng-bind-html="post.content"></span>
  </ion-item>
</ion-list>
```

## Conclusion 

As you can see, there are a bunch of steps to getting all of this setup. Luckily, it's one of those things that is hard to setup the groundwork the first time, but once you have it done, it's really easy every other time. The really important concepts to remember are that you need to create a factory that Ionic will use to talk to the WP site, then inject all of your functional dependencies into your app and into the controllers that will use them.