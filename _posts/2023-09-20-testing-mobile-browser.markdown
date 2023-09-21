---
layout: post
title: "Using Ngrok to Develop on Android Devices"
date: 2023-09-20
categories: "Code"
tags: ["testing", "code", "code-trick", "ngrok", "mobile"]
---

This is how I test on mobile devices (Android phones) when developing.

It's based on the official guide for [remote debugging on Android devices](https://developer.chrome.com/docs/devtools/remote-debugging/) with some extra steps I add to work on any web application project:

1) Enable developer mode ([click the Build Number 7 times!](https://developer.android.com/studio/debug/dev-options))
2) Use [ngrok](https://ngrok.com/) to expose your local application
2a) Note that you'll need to [connect your agent to your ngrok authentication account](https://ngrok.com/docs/getting-started/#step-3-connect-your-agent-to-your-ngrok-account)
3) Navigate to the _.ngrok-free.dev_ URL from the device
4) Plug your phone into your computer
5) Open [chrome://inspect#devices](chrome://inspect#devices) in a Chrome tab to get a dev inspector synced to your phone

Now you can inspect, modify elements, debug, throttle, etc! Happy coding!

_Edit:_

On my Windows machine running Ubuntu in WSL, I had to install ngrok with `sudo` and get around an "invalid host header" error, so my full command to launch a project is:

```
sudo ngrok http --host-header=rewrite 8080
```
