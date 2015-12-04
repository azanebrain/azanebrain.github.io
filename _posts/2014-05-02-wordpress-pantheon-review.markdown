---
layout: post
title: "WordPress on Pantheon Review"
date: 2014-5-2
categories: "news"
tags: ["wordpress", "pantheon", "review"]
---

## Overview (tl;dr): 

Pantheon is awesome for projects that have a lot of development going on. Probably overkill for a simple install-and-launch.

## Goals

I was introduced to Pantheon at the San Diego drupal event Sand Camp 2013 where I talked with Josh Koenig for a bit about their system of providing super fast drupal sites that can scale and replicate like a super advanced space-robot zombie horde. 

The Pantheon team has finally sunk their teeth into WordPress.

I signed up for the early adopter trial and just setup a site to kick it around and see if the WP version has all the cool bells and whistles as the drupal one. If you're a WordPress developer who's ever dreamed you could streamline the management of your development, testing, and production environments then wake up and [check it out](https://dashboard.getpantheon.com/register). 

## Background

I'm very friendly with my terminal. We get along great. I pop him open, ask him to connect me to my server, or push my git repo, or back up my WordPress db. He never throws a fuss.

Point and click interfaces kind of annoy me. Why enter your credentials into a login screen, wait for the dashboard to load, find the correct panel to modify your setting, and wait for the request to complete to see if it worked or not?

I have a little experience with Pantheon for drupal sites and it made pushing a site from dev to stage to prod a cinch, but I was never convinced that it was necessary for me, as a terminal-using developer, to use it compared to `git push dev master`.

## Experience:

When you setup a new site you can either start a fresh site, or import a current one. You can import with either a big ‘ol zip package, or separate your uploads into the codebase, database, and files (which probably works better). I decided to see how quickly I could get up and running and went with the fresh install. 

A typical WordPress site gets setup in a few seconds (yeah, *seconds*). The upstream git repo is https://github.com/pantheon-systems/WordPress so you can see the code you're working with, and recent changes.

A straight forward Pingdom speed test of just the twentyfourteen theme with only Hello Dolly activated showed 609ms page speed and 260.5kB page size vs 2.18s page load and 327.0kB size on your standard $6/month grid server. Pantheon’s install also got 13 points higher on the overall performance grade, which is pretty cool because I didn't do anything special.

For some reason you need to setup your environments. You start off with ‘dev-yoursite.gotpantheon.com’. From there, you clone your dev to your testing environment (test-yoursite), then from test to live (live-yoursite). I don't see why these aren't setup right when you start, but they're super easy to setup.

Git pushes show up instantly in the dashboard’s dev section and the actual dev environment. When you switch over to the Test section of the dashboard, you get a super clean interface where you can pull in the code changes from Dev, and the database from Live. Not only can a single click pull in your live DB and fresh dev code, but you can pull/push the DB or files from any environment to any environment at any time. This is great when you have those gigs where you need to revisit a website after weeks (or months) of inaction to fix a code bug on some kind of new content (like a pre tag that needs new styling) without having to pay for a service like WP DB Migrate Pro, or run some series of mysql dumps and search-replaces through terminal.

There are some very cool settings such as 

- Dashboard notifications for when tasks finish.
- Easily secure an environment with htaccess credentials
- Export the DB and files
- Convert the site over to your client to manage payment

It looks like there’s some basic PHP error logging, but the real hook is 2 weeks of New Relic’s pro plan.

You can easily add remotes to other repositories. I was able to create a new github repository and add it as a remote. Although there’s no point-and-click for this, it’s safe to say the developer who is looking for Pantheon’s level of service has no problem running a `git remote add` command from the terminal.

### Pain points

All of the docs and guides are still focused on drupal. Drush (a drupal command line tool) shows up a lot so hopefully we’ll see wp-cli integration in the future.

Adding an SSH key threw me for a loop. I noticed a little button to add it when I first set up my site, but ignored it as I tried to grokk the rest of the interface. When I went to clone my repo, I couldn’t remember how to and spent about a minute clicking around trying to find an ‘add ssh key’ section (the security tab didn’t help). Eventually a quick Google search brought me straight to the Pantheon support docs showing that you put your key onto your account, not your website (duh).

## Future 

[Multi dev](https://www.getpantheon.com/multidev) looks awesome. You can get (possibly) and infinite number of personal sandbox environments. This is great if you have a team working on multiple features at the same time which might have different code and data base changes. Unfortunately you need the business package for this, but if you’re working on develoment at that level, you’ll probably have it anyway.

## Wrap-up

I was very impressed by Pantheon's UX and tools. The easy access to features like pushing a codebase and pulling a database to the testing environment are *essential* workflow tasks often overlooked by other managed hosts. 

However, throughout the entire process I never felt like this was a "managed WordPress solution." It is literally an interface that speeds up your workflow by doing everything you are doing slower already. Then piles on some awesome caching. Just cuz, you know?