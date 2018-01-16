---
layout: post
date: 2018-01-15
categories: "angular"
tags: ["angular", "angular forms", "angular snafoos"]
title: "Angular Snafoos! form.value vs form.getRawValues()"
---

This is a tricky one that's bit me in the butt more tikes than I'd like to admit.

Angular's FormGroup component is incredibly powerful but can get overly complicated. One example is finding the value of each control in the form. The obvious solution would be to grab the control property from `myform.value` but that won't provide the values of disabled controls. To get **all** of the values, you'll have to use the `getRawValues()` method.

{% gist be36cbd57f4fcc6d915d6e93b3861db8 %}