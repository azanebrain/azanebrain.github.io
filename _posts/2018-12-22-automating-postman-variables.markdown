---
layout: post
title: "Automating Postman Variables"
date: 2018-12-23
categories: "code"
tags: ["code", "tools"]
---

# Variables in postman

Variables are one of the best features of Postman. Being able to easily define things like which environment you're testing against is great.

But what about when you want to automate setting these variables? For example, if you have a workflow that depends on the response of an initial request, you'll have to manually set that value each time you run through the workflow, right?


Not any more!

# Speeding up workflows through automation

Postman allows you to automate setting variables by adding scripts to your collections. Once you understand the Postman ecosystem, you'll be able to dynamically set the variables you send to endpoints, as well as the responses you get.

And the best part is that you can use  JavaScript to write these scripts 

# Prerequest scripts

Scripting is split into two patterns: Pre-request scripts and Test scripts. You'll use Pre scripts to dynamically set variables that you're sending, while Test scripts will set response variables.

Postman provides a really easy interface for setting these variables through the "Pre-request Script" tab on your endpoints.

For example, let's say that I have this endpoint that gets details about a specific company: `GET {{url}}/api/v1/company/{{company-id}}`. Now let's say I need to use the company ID on a subsequent update request: `PUT {{url}}/api/v1/company/{{company-id}}`.

In the Pre-request Script tab, I can enter the following code to set the company-id:

```
pm.globals.set("company-id",  "{{company-id}}");
```

However, this doesn't really help. Why would I set the company ID if I already have it in my environment variables? Well, for the case where I want to do the same collection workflow with a second company.

If I make multiple versions of that "Get Company" endpoint, I can have Postman automatically update the variable for me.

I'll update the collection to have two versions of the endpoint:

```
GET {{url}}/api/v1/company/{{company1-id}}
GET {{url}}/api/v1/company/{{company2-id}}
```

Next, I'll update the Pre-request Scripts:

```
// Company 1:
pm.globals.set("company-id",  "{{company1-id}}");
// Company 2:
pm.globals.set("company-id",  "{{company2-id}}");
```

Now, the rest of the endpoints in the collection can keep using the `{{company-id}}` variable, but they have been automatically configured to the company I care about right now.

# Reacting to responses

Setting variables based on the result of a request is not as simple as the Pre-request option.

* You need to use the Tests tab
* Data can change, making your workflows brittle
* Building them can be hard because you may have to rely on real responses which will change over time

However, once you have an endpoint that will work, setting variables is pretty easy.

For our example, let's say that companies have a number of products which we'll have to use in a subsequent request. We can pick this value from the response just as if it's normal JSON:

```
// Parse the response into JSON that we can use:
var jsonData = JSON.parse(responseBody);
// Set an environment variable:
pm.globals.set("company-product-count", jsonData.Products.length);
```

# Variable Hierarchy

In this example, I covered how to set Global Variables. Postman has a tiered system for it's variables, with Environment Variables taking precedence. Back to our example, if we have a default `{{company-id}}` in our environment configuration so that we can quickly run endpoints without having to hit the "Get Company" endpoint first, we'll need to overwrite the environment with `postman.setEnvironmentVariable(...)`. This is tricky because now when you run the "Get Company" endpoint, you'll be overwriting the environment for _everyone_.

I suggest reading [the Postman docs](http://blog.getpostman.com/2017/12/29/10-tips-for-working-with-postman-variables) for a full overview of the different levels of variables, how to work with them.

Before getting started, with this automation approach, sync with your team on how you all can work best within Postman's ecosystem.

# Conclusion

Once again, Postman proves that it does more than you ever thought you needed. The dynamic nature of scripting each endpoint in a collection opens up a ton of doors for helping you develop your endpoints fast. It also introduces the ability to test complex workflows that depend on the results of multiple endpoints.

Luckily, Postman has provided all of the tools to test workflows in non production environments and review logs. It's great that we now have a tool that is malleable enough for developers to get their work done, while also providing an easy interface for non technical teammates to explore your system's endpoints.

