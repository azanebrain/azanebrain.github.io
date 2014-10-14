---
title: "Modifying the WordPress Admin Bar"
layout: "news"
name: "Modifying the WordPress Admin Bar"
date: 2014-9-21
url: "/code/modifying-wp-admin-bar"
isPage: true
category: "code"
tags: ["meetup", "awp", "wordpress", "admin bar"]
---

**It's super easy!**

But before I get into it, I was inspired at the last AWP meetup at some of the WordPress tricks my peers use and wanted to share them:

[Chris Perryman](http://revelationconcept.com/) shared [wp_check_filetype()](http://codex.wordpress.org/Function_Reference/wp_check_filetype) which returns the file type of a string. This can let you easily modify your logic without complex string position queries that waste processing time figuring out if the last three characters are gif, jpg, or wtf.

[Christina Hills](http://www.christinahills.com/) has a genius method of leaving secret notes by simply using the custom fields meta in core. I've always viewed this feature as an annoyance and use a trick of starting custom fields I create with an underscore (such as: `_customfield`) to hide it from this menu. 

But it's a very functional and simple way of organizing your team without excess plugins and custom scripts. 


[Devin Walker](http://wordimpress.com/) shared the [Media Modal Demo](https://github.com/ocean90/media-modal-demo) which shows you the meta fields of media content in a really nice interface. I usually do a var_dump() when I need to get all the fields so this is a major luxury. 

It can also help you work with difficult themes that make their own way of dealing with attached media.

<div style="text-align:center">
  <img src="/img/awp-custom-notes-trick.jpg">
</div>

# WordPress Admin Bar Customization

Before I introduce my plugin, there's already a really good resource out there. The [Custom Admin Bar](http://wordpress.org/plugins/custom-admin-bar/) let's you modify the logo, links, and color in the admin bar all from a point and click interface in the backend. 

My favorite implementation of this tool is using a different color for the admin bar in each environment (prod, stage, local). Before I started doing this, I'd often make changes to a development environment and wonder why the changes weren't taking effect. ... Realizing as I slammed my face through another keyboard that I was making the changes in production... Oops

## This plugin's approach works great until you need to push and pull your database between environments.

Since the environment specific data is stored in the database, you'll have to log in and change the the settings **every time.**

Just the thought of that was enough inspiration for me to make this plugin: The [ZWP Admin Bar](https://github.com/azanebrain/zwp-admin-bar). 

**Instead of storing settings in the database, this uses a customizeable and extendable variable unique to each environment.**

This is for developers who are comfortable opening up a wp-config file. Since you're dealing with multiple environments, I think it's a safe bet that a PHP file doesn't scare you. 

Although it doesn't do much out of the box, with a few simple modifications you can configure each environment with a different colored bar, quick links to other environments, and relevant theme info like the documentation.

You set it up be simply defining the WP_ENV variable in wp-config.php

```
define('WP_ENV', 'dev');
```

This tells the plugin to grab the dev.css file to style the admin bar. 

You can customize this with your own CSS file because it just pulls in the name of the WP_ENV variable. You can add dev2, stage-siteground, .. Call it megazord.  It don't care.

# Add image menu items

I kept the menu item structure simple. Not only because I promote using WordPress' strengths, but also because I'm lazy. To add the menu items, you simply add the WordPress core function: [add_menu()](http://codex.wordpress.org/Class_Reference/WP_Admin_Bar/add_menu). The docs are kinda lame, but if you follow the structure in the `zwp_add_admin_bar_link()` function, you'll be set.

# Now you see it...

ZWP Admin Bar hides itself so clients don't deactivate it.

I could have added a check to make it only visible to administrators, or users with a certain capability, but I just hid it once it's activated. Maybe that'll come in 

```
hide_zwp_admin_bar_from_plugin_list()
```

# Good enough is enough good.

I never finished this plugin and I haven't modified the code since December 2013.

As I started using it in projects, I realized the need for making it child-pluggable. The  architecture should remain the same and support the fact that every site is going to have different environments. 

So there's a long way to go, but hopefully it'll help you a little bit!