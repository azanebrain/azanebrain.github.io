---
layout: post
title: "Relying on the Cloud"
date: 2017-06-09
categories: "tools"
tags: ["tools"]
---

Today marks the end of a 2-week transition Ive been making from Mac OS to Ubuntu. While making the transition, I noticed some interesting practices and concepts around what it means to have a primary machine and how to keep your work tools nimble enough to adapt to new spaces.

Before I start, I gotta tell you: Day 1 was rough. Keyboard shortcuts, drivers, monitor configiration, figuring out what all the default tool replacements are, wifi... It was a brutal start, but I ripped the band-aid off and haven't used my Mac machine except for 1 technical presentation. If I can give any suggestions on switching operating systems it is that - dive in and don't look back.

Before making the switch,  I took a tally of all the programs I use on a daily basis.  It turned out to be strikingly tiny:

* Terminal
* Chrome
* VS Code
* Slack
* Spotify
* Virtualbox
* Some kind of SQL database querying tool

That's it! Since I make web apps, the serious tooling all takes place in the command line through tools like node, npm, docker, git, and ssh. All work related things happen through Google Drive. 

Downloading and configuring these tools is a cinche. You gotta love 2017. No more CD drives and install keys. No multi-gig downloads that you have to wait overnight for. You just download the package (or install it through apt-get or brew), set up your config file, and bazinga! It's like nothing changed.

And that is the key to setting up machines today. Modern tools are meant to be used in a mobile, multi-device ecosystem. Whether its your IDE shorctuts, your spotify playlists, and vim config.. Things just _sync_. Setting up Chrome was the most amazing: I logged in, waited 15 seconds, and _everything_ (bookmarks, extensions, settings) was there.

This whole process makes me think of Ghost in the Shell. It used to be difficult to synce your work process, files, and assets between devices. Now, the devices and workflows are tuned to be modular. And it's not only in the sense of "remove the brain from this and put it in that," but rather, "replicate my setup across everything."

I had a bit of a head start. I track all of my setup steps and config files in a git repo called [System Setup](https://github.com/azanebrain/system-setup) so that I can (hypothetically) run a single bash script to setup my machine. I'm updating it to have a version for Ubuntu. Check it out and feel free to share your own setup process with me.