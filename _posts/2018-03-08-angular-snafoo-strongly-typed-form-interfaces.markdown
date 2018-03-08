---
layout: post
title: "Angular Snafoos! Strongly-Typed Form Interfaces"
date: 2018-03-08
categories: "angular"
tags: ["angular", "angular forms", "angular snafoos", "typescript"]
---

Typescript is awesome but it doesn't cover all of the intricacies of creating custom Angular forms.

Given this example login form with username, password, and CAPTCHA fields, you will see that the control values aren't accessible through type checking:

```
this.myForm.group({
 captcha: 42,
 username: 'azanebrain',
 password: ''
})
this.myForm.controls.us // Your IDE will not suggest the 'username' property as you type
this.myForm.value.password // Your IDE won't know anything about this field's type
```

Without knowing about the controls, your IDE won't suggest properties, leaving you open to typos causing bugs. Similarly, you have no idea about what types the fields should be. Is the password a string, a number? Nobody knows!

{% gist 235434719a324bada0cf538763f21df1 %}

It's a little bit more work to set this up, but that's the point of TypeScript. With strongly typed values you'll make sure you and your team don't step on each other's toes are have facepalming typo bugs.
