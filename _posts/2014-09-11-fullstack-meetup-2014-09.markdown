---
layout: post
title: "My CSS Presentation at Full Stack Talks"
date: 2014-9-15
categories: "meetup"
tags: ["fullstack", "frontend", "css", ""]
excerpt: "An overview on my CSS presentation and workshop at Full Stack Talks"
---

Last Thursday I had the honor of presenting at the [Full Stack Talks](http://fullstacktalks.com) meetup.

It’s an amazing meetup hosted by The Planning Center with an incredible group of regulars that make it one of highlights of each month. I’m really glad I was able to contribute back. _So big thanks at Mike Chan and Kevin Thompson!_

I also got to take part in the new Full Stack Labs. An ongoing series of related lectures and workshops. The first being on the basics of web development.

I can already tell that the FullStack Labs series, even though it just started, is going to be an incredibly important addition to our community. 

## Raising general knowledge and awareness of web development is very important to me.

This is why I take an active part in the Advanced WordPress group and started the Front End Dev meetup.
What the organizers are doing with Full Stack is great and I hope to see the Labs continue to grow.

# Teaching CSS to a crowd of Full Stack devs is kind of like teaching Godzilla how to break a building.
 
Since I knew my audience has a wide range of experiences and technical backgrounds, I knew my talk had to balance concept and execution.

I setup my talk to present the ideology behind CSS and why it was invented. Even as a Front End dev, it is easy to forget that presentation and content should be separated. I knew if I could find a good example of this, those in the audience who have never worked with HTML, to those who write machine code would be able to establish the same foundation, and hopefully spur ongoing conversations. 

Ultimately, I was able to use this opportunity to reference the SpaceJam website (my favorite place on the internet).

I had a great time presenting and leading the workshop. You can find my slides, the workshop code, and my transcript below:

[Slides](http://slides.com/azanebrain/fullstack-css)

[The workshop code on CodePen](http://codepen.io/azanebrain/pen/axJkw)

# The Transcript

As you learned in the last session, HTML provides content hierarchy to documents and links pages to each other.
It’s utilitarian, it’s simple, and back in the day it was not flashy, nor presentational.
But that doesn’t mean it was impossible to create visually engaging, interactive experiences.
Now I want to prepare you guys for the website I’m about to show you. It was developed in 1996, the same year that the CSS1 recommendation was released. It’s a marketing campaign site for a movie starring Michael Jordan, and the Looney Tunes, called SpaceJam. 

And it’s still online.

The spacejam site uses repeating backgrounds, tables, image maps, animations, and style elements to create, for the time, a really visually engaging, interactive experience.
Just like the movie’s effects, it pretty much encapsulated all of the most advanced technologies of 1996.

Now, if we look at the code, you’ll see that these customizations came at the cost of the markup. You can NOT reuse the spacejam code as a boilerplate for your next project. The design is completely bound to the HTML elements.
You can see that the landing page looks the way it does only because there is an excessive use of break tags and element attributes and all this junk that makes sure each piece of the design ends up in its specific place on the page.
So: CSS was developed to separate content from presentation. Just like these movie posters, you cab make the exact same copy look competent lay different.
CSS Zen Garden is a proof of concept for this. 
Its a huge library of micro sites all based on the same HTML, but different CSS
Each of these three sites are the exact same markup, with totally different styles (the first has nothing)
In a way, CSS goes back to the origins of hyper text. Since the appearance and interactivity of the web page is separate from the actual content, either one can change without totally messing up the other. 

> ALL HEADING 1 ELEMENTS SHOULD BE BOLD.
> THEREFORE, NO FORMATTING MARKUP SUCH AS BOLD TAGS (<B></B>) IS NEEDED WITHIN THE CONTENT;
> WHAT IS NEEDED IS SIMPLY SEMANTIC MARKUP SAYING,
> THIS TEXT IS A LEVEL 1 HEADING.

Like this quote, markup isn’t formatting. It’s just semantic.

If we were to remake the spacejam site today, all of the semantic styling becomes irrelevant. 
Stripping out excess markup makes redesigns very easy. It makes maintenance very easy. And it helps the site as a whole evolve with design trends and business goals.

...Which is really important so we can keep our jobs

## HOW

Lets get into how to actually create CSS
Writing CSS code boils down to two concepts: PROPERTIES & ATTRIBUTES
Properties define what you’re changing. For example: “the color of text”ttributes define how you change the property. For example: “the text color will be green”
Each property expects a specific kind of attribute

Because developers are lazy, there is some shorthand you can use.

The most basic way to apply styles to your elements is making them inline.

If we take our normal paragraph element, we add the style attribute, and then we add our CSS

If we look back at the spacejam site, we start to strip out a lot of the HTML cruft, but you can see how it’s still difficult to maintain. That’s because inlining styles isn’t actually separating content from presentation. It’s still all tied together
nd this is where the ‘sheet’ part of CSS comes in.
The syntax is pretty straightforward. An element is just the text of the element, IDs are denoted with a pound symbol, and classes begin with a period.
I suggest to keep it simple and only use classes. 

If you target elements, you hit EVERYTHING and that’s not maintainable
IDs aren’t too good because an element can only have a single ID, which means you’d have to set the styles for each individual element across your entire site. There’s also some issues with the cascade so just.. dont mess with them
Classes are the way to go because you can apply as many as you want to any element, which lets you reuse your code. We’ll get more into classes during the workshop

## WHERE

You include your CSS into your page by adding _style_ tags to the head.

You can actually put style tags anywhere, but that’s a secret so don’t tell anyone.nd you seriously shouldn’t do it. It’s bad practice.

Unfortunately, _style_ blocks still aren’t maintainable. As you make changes to your site, you’ll have to duplicate that code to every page. Just imagine having to redesign a 500 page site. 


So we get the almighty _link_ tag which lets us import external CSS files
s you can see here, we pull out the CSS that would have been in a _style_ block, put it into one stylesheet file. Now we can link to that sheet from any of our HTML pages.
Linking to external stylesheets fully separates your content and presentation giving you maintainable, visuaully engaging, interactive experiences.

Finally the cascade: Cascade simply means that attributes defined later override previous attributes. 

## Resources et cetera

