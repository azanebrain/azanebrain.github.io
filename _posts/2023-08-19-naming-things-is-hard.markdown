---
layout: post
title: "The Power of 'foo_*': The Art of Balancing Flow and Clarity when Naming Things"
date: 2023-08-19
categories: "Coding Tips"
tags: ["code", "code-techniques", "patterns-and-practices"]
—

![Picture of a dirty tactile pavement](/assets/texture-dirtytactilepaintingnewyork.png "")

Naming things is hard.

When writing code there’s a constant balancing act between maintaining your flow and ensuring your code is readable and maintainable in the long run. In this article, I’m going to propose a practical approach to tackling this challenge – an incremental naming method. This method encourages you to start with temporary, functional names ("foo_*") and gradually refine them as your understanding of the system evolves without sacrificing code quality.

*Problems With Names*

At the heart of coding lies the challenge of naming variables, functions, classes, services, slack channel names, the list goes on.. It's easy to get bogged down by trying to find the perfect name from the start. This will disrupt your coding flow and hinder progress.

We have a limited number of mental cycles available so we need to focus them on what matters. To overcome this challenge, we need a method that preserves our flow while ensuring our code remains clear and understandable at the time of writing it, while delaying larger implementation decisions for when they matter. 

Picture this: You're building a payment processing module, and you decide to name a class "CreditCardObject." However, during development, you realize that the solution might involve wire transfers or blockchain transactions. Naming the class prematurely will lead you down the wrong mental path, hindering creative problem-solving. To avoid this, we need a strategy that allows us to focus on functionality before committing to a design.

*Solution*

Instead of striving for perfection upfront, embrace an incremental naming method. The technique I’ve come to adopt is the "foo_*" method. Start by giving components functional, temporary names like "foo_payment" or "foo_processing." These names act as placeholders so you can stay in the pocket of your coding flow state. The key is to not linger over naming decisions at this stage. Focus on functionality, get your code up and running, and maintain your momentum.

*Transitioning To Meaningful Names*

As your codebase takes shape, you'll naturally gain a deeper understanding of the system's architecture and components. Now, it's time to transition from temporary to meaningful names. To guide this transition, ask yourself a few key questions:

* What is the core purpose of this component?
* How does this component fit into the overall system?
* Is the current name descriptive enough for someone encountering it for the first time (including future you)?
* Does the name reflect the true essence of the functionality it represents?

One of my favorite parts of an incremental naming strategy is that these temporary names serve as indicators when refactoring. When I revisit code after a mental break, I find these temporary names often trigger me to look at the codebase more holistically. Performing a global search for "foo_" at this stage will help you uncover cases where code sections could be streamlined, merged, or indicate that more detailed documentation is required.

*Conclusion*

Naming things is challenging, but with an incremental naming method, you can strike a balance between maintaining flow and ensuring code quality. By starting with functional temporary names, you keep your momentum and creativity intact. As your understanding deepens, transitioning to meaningful names becomes natural, enhancing code readability and collaboration. Remember: The goal is not to let the pursuit of perfection hinder progress – "Good Enough" in the moment can lead to "Great" in the long run.
