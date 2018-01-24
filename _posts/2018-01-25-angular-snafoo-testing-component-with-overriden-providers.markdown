---
layout: post
date: 2018-01-25
categories: "angular"
tags: ["angular", "angular snafoos", "testing", "karma", "jasmine", "angular testing module"]
title: "Angular Snafoos! Testing a componemt with overriden providers"
---

Angular's module system gives you layers of control over dependency injection, which is usually good, but can sometimes be a pain. 

Take service singletons as an example. You can have multiple modules provide the same service, but Angular is smart enough to only use one instance of the service. For cases where you want non-singleton instances, you can have your component define its own list of providers:

```
@Component({
  selector: 'my-comp',
  templateUrl: './my-comp.component.html',
  styleUrls: ['./my-comp.component.sass'],
  // Each instance of MyComp gets its own version of the service
  providers: [NonSingletonService]
})
```

This works fine until you want to mock NonSingletonService in a test. Instead of mocking the service in the `providers` list when you configure the testing module, you need to override the component's providers:

{% gist 76e7ca8b3c7b493483198c510bb9c80a %}
