---
layout: post
title: "When and how to delay a promise in JavaScript"
date: 2018-12-10
categories: "code"
tags: ["code", "javascript"]
---

Delaying a promise is a useful pattern when you have multiple features that rely on the same result of an asynchronous action. For example, let’s say I have a small ecommerce shop that sells shirts. All of my shirts have the same sizes (small, medium, and large), but the size list is being retrieved from an endpoint so I can dynamically handle more sizes in the future.

Now let’s say that I have a component for each shirt in my store. Each of these components needs to show the size options to the user. One option I could take is to have each component make a request to the backend for the sizes. However, this adds unnecessary load on my backend, and if the endpoint has a wide performance variance, this could result in a really weird  user experience with each shirt loading the sizes randomly.

Instead, I’ll make a single request to the backend, and when my endpoint resolves, I’ll update each component that requested the data at the same time.

You can see a working example of this [shared on codepen](https://codepen.io/azanebrain/pen/QJzBzJ?editors=1010).

First, let’s start with the UI:

```
<!-- Each shirt "component" has an empty select for the size options -->
<div id="shirt1">
  Shirt 1
  <select class="shirt-sizes">
  </select>
</div>

…

<!-- Finally, there is a load button -->
<div>
  <button onClick="getShirtSizes()">Load Shirt Sizes</button>
</div>
```

Now let’s setup the GET method with some basic properties:

```
function getShirtSizes() {
  // We’ll use a boolean value to toggle when the endpoint’s been hit
  var hasRequestedShirtSizes = false
  // We’ll set the result of the endpoint call to a promise that each component will use
  var myPromise = null
  // Finally, we’ll get the DOM element so we can iterate through it
  var shirtSizeSelectElements = document.getElementsByClassName('shirt-sizes')

  // Next: Iterate through the shirt components
}
```

Next, we’ll iterate through the shirt components and actually request the data:

```
function getShirtSizes() {
  …
  // We’ll loop through each shirt component, but only make a single request:
  for(var i = 0; i < shirtSizeSelectElements.length; i++) { 
    log(`Retrieving shirt sizes for Select #${i}...`)
    if(!hasRequestedShirtSizes) {
      log('First time shirt sizes have been requested')
      var myPromise = fakeEndpointCall(i)
      hasRequestedShirtSizes = true
    } else {
      log('Shirt sizes are still being requested...')
    }
    // Call another method so the index can be maintained
    populateShirtSelects(myPromise, shirtSizeSelectElements, i)
  }
}
```

There are two important things happening here:

```
var myPromise = fakeEndpointCall(i)
...
populateShirtSelects(myPromise, ...)
```

First, we’re setting the result of our endpoint call to a promise. This way, we can control what will happen when the call resolves. To handle the resolution, we’re passing the promise into a new method that also takes which index we’re on so we can update the correct component. Depending on your requirements, you may not need to add an extra method, or the index of the requester.

Now let’s see what happens when the endpoint call resolves:

```
function populateShirtSelects(myPromise, shirtSizeSelectElements, index) {
  myPromise.then(result => {
    // Normally, `result` would be the sizes, but we're faking it for this example
    log(`Loaded shirts for Shirt #${index}`)
    shirtSizeSelectElements[index].options.add(new Option('Small', 'sm')) 
    shirtSizeSelectElements[index].options.add(new Option('Medium', 'md')) 
    shirtSizeSelectElements[index].options.add(new Option('Large', 'lg'))
  })
}
```

As you can see, this call simply waits for the promise to resolve, then acts. Since the promise _is_ the endpoint call, the action happens for all of the components as soon as the endpoint gives us back some data.

Once we put it all together, here is the output log for three shirt components:

* Retrieving shirt sizes for Select #0...
* First time shirt sizes have been requested
* Endpoint request will take 2000ms...
* Retrieving shirt sizes for Select #1...
* Shirt sizes are still being requested...
* Retrieving shirt sizes for Select #2...
* Shirt sizes are still being requested...
* Loaded shirts for Shirt #0
* Loaded shirts for Shirt #1
* Loaded shirts for Shirt #2

As you can see, only one request to the endpoint is made, but all of the components are updated simultaneously (well… nearly simultaneously).

# Conclusion

This is a great pattern that’s helped me a bunch of times when I needed a simple solution for things like dictionaries that are shared between features. Libraries like RXJS and Redux provide similar solutions, but sometimes it’s nice to go with a lightweight, vanilla JavaScript solution.

