---
layout: post
title: "Intro to Postman Mock Server"
date: 2018-08-19
categories: "development"
tags: ["postman", "api", "code", "mock server"]
---

Mock Server is an amazing feature of the Postman API documentation tool that allows you to create a fake API with predefined responses to specific endpoint calls. This article will go over creating a mock server, the benefits of this tool, and some of the pitfalls.

# What problem does this solve?

During development, it's important to be as close to your production environment as possible. Unfortunately, this is rarely the case. When working on frontends or integrated systems, it's better to actually hit an endpoint than leave an "add real functionality later" TODO in your code. But if your system is not configured to support your development, you'll end up only getting failed responses and you'll be unable to verify that you've been developing to your edge cases. The Postman Mock Server let's you mock your API so you can get consistent results without having to run your backend.

Even during API development, you can easily transform a proposed Postman Collection into a Mock Server, run your service against it, and see what unexpected bugs show up. This lets you see how much effort a new feature may take without having to actually create a new endpoint and all the environment configuration to deploy and access it.

# Getting setup

Setup is insanely easy: Find your Collection in Postman's desktop app or website, select "create mock server", wait for Postman to spin up a new service with a unique URL. 

Really. It's THAT easy.

# Other Benefits

I've explained how this tool lets you work on microservices quickly without waiting on external dependencies, but it's also a phenomenal tool for maintaining documentation.

Because the mocked endpoints are set up to provide specific responses to specific requests, you will instantly know if someone else’s work causes breaking changes. For example, if I’ve configured my microservice’s integration tests to expect a specific response when a specific mock user attempts an action, but a developer of the API my service is calling has updated this endpoint to return a 401 Unauthorized error, I should see that my service no longer works as expected. Because the whole team has maintained good hygiene in documentation, I'm able to iterate quickly, and hopefully prevent this breaking change from being deployed.

You can say the same thing for frontend developers. Again, I think you should empower your frontenders to run as much of the system as possible, but when you can't, this offers a great way to make sure your team is on the same page when developing multiple pieces of the system in parallel.

# Pitfalls

1) Isolated integration testing
Earlier, I mentioned using this tool for integration testing. I think you should avoid this if you can. Nothing beats real integration tests. But for the purpose of developing as fast as possible and maintaining good hygiene around documentation, this is a helpful tool. When you're working on a new feature, have your seed data work with the Mock Server’s predefined endpoints. Setup example responses so that you can easily develop and test against edge cases without having to go through every step of spinning up the entire system. This process is not perfect, but it facilitates fast development.

2) Stupid endpoints
The mock server acts as a dumb API. You must define every route to get specific endpoints. For example, if my API stores a list of favorite foods and I expect User A to have a different list than User B, I need to create specific endpoint Examples for each case. Make sure your data is organized so that the mock endpoints provide the most value possible and are easy to maintain.

3) Persistence
Mock Servers are static entities. As you modify your collection, you will have to re-publish a new mock. Make sure your team communicates clearly as changes are made.

4) Security
By using this service you're giving Postman the OK to publish a window into your API’s logic. If this can expose a door for hackers to get into your system, this may not be the solution for you. You can make the Mock Server private, but you will have to jump through a few hoops of authorization.
