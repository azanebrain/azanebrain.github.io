---
title: "AWP 8/20 - Image Effects"
layout: "default"
name: "AWP Meetup 8/20/2014"
date: 2014-8-20
url: "/news/awp-meetup-august014"
isPage: true
category: "awp meetup"
tags: ["meetup", "awp", "wordpress", "image effects"]
---

# Problem: 

- I need interactive FX when the user hovers over an image.
- CSS `filters` are the easiest to add, but they lack FireFox support.
- It needs to be usable with simple JPGs for greatest compatibility

# Solution:

Simply enqueue a jquery plugin [jQuery.BlackAndWhite](http://gianlucaguarini.github.io/jQuery.BlackAndWhite/) and add the markup.

# Issues:

The solution lacks back-end maintainability. Different effects will require other jquery plugins and developer maintenance.

## New Solutions:

**Use SVG?**

- SVG supports filters
- SVG filter hack for non-svg images
- Can you rely on people importing .svg
- Device support?
- FooGallery? ;)

**Find a plugin:**

Broken and not-quite-there plugins that supposedly do this:

- [Image effects generator](https://wordpress.org/plugins/image-effects-generator/) : Only works when you upload an image by creating new versions of that image with the predefined filters.
- [CSS Thumbnail sprites](https://wordpress.org/plugins/css-thumbnail-sprites/) : Lets you define sprites on an image. Not sure how it works
- [RoundIt Plugin](https://wordpress.org/plugins/roundit/) | [Screenshot](http://s-plugins.wordpress.org/roundit/assets/screenshot-2.jpg?rev=778168): Has an interesting interface which lets you add CSS Border effects when you insert an image. Unfortunately to modify those effects you have to remove the image and re-add it.
- [Pieces](http://www.megalocode.com/pieces-wordpress) Intense animation effects on load
- [Anyhover Image Effects](http://codecanyon.net/item/anyhover-image-effects/3651269) | [Demo](http://codecanyon.net/item/anyhover-image-effects/full_screen_preview/3651269) Slightly less intense animation effects on hover

# ...

Why isn't there a tool that does this simple effect already?

Is this cross some kind of difficulty line? Where since it's so easy to plug something in on the theme layer, developers will do that instead of providing an interface? Or is the audience who wants these kind of effects looking for a mega-solution?