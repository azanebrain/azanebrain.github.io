---
layout: post
title: "Testing As Code Confidence"
date: 2023-09-03
categories: "Code"
tags: ["testing", "code"]
---

!["Aspiring to Pumpkin's Love, the Love in My Heart" by Yayoi Kusama, David Zwirner gallery, New York, 2023](/assets/kusama-yayoi-aspiring-to-pumpkins-love.png "&quot;Aspiring to Pumpkin's Love, the Love in My Heart&quot; by Yayoi Kusama, David Zwirner gallery, New York, 2023")

_"Aspiring to Pumpkin's Love, the Love in My Heart" by Yayoi Kusama, David Zwirner gallery, New York, 2023_

When it comes to testing, I see developers viewing it as a chore because tests are being used to confirm that code works. This misses the true essence of testing.

Testing is not merely about ensuring that a piece of code works as intended. I've seen tests validating a browser's "click" functionality – something that if it fails for you, the internet is going to have major problems. Tests also aren't about meeting an arbitrary code coverage percentage by littering the codebase with "test_foo" methods. Testing serves a more profound purpose – it operates as an abstracted layer that bridges the gap between business objectives and developer execution.

Whether you're testing JavaScript, C#, code for a dishwasher, the tests function as a safeguard, ensuring the software aligns with our intentions. They are the nexus point between business needs and code implementation. However, effective testing involves more than a numbers game. It's about testing the right aspects at the right time to serve business goals.

Imagine a user path that's tested using real data, passing through the system to verify the output. Does this need 100% frontend unit test coverage? Probably not since you now have a heightened level of confidence that the system works holistically. In fact, the testing infrastructure should reflect that. A diverse set of tests is essential, mixing unit and integration tests with tools that can monitor APIs and nightly end-to-end checks. This multifaceted testing approach is not just acceptable, it's commendable. It validates that the system functions correctly under realistic conditions, not just those you hone in on because you want to make sure a snazzy method you wrote handles a set of edge cases.

Contrary to a common misconception, tests are not there to prove your code is "good." After all, you are writing good code, right? _Right?_ Instead, tests serve as meta documentation. They translate the software's business objectives into a language that even robots understand, providing evidence that the code is fulfilling its purpose. As developers, tests offer confidence that our efforts are focused on the right business domains and that our systems will continue to perform as expected without constant manual intervention.

In conclusion, testing is not a mere box-checking exercise. It's a dynamic process that aligns code with business intentions, replaces manual verification with automated confidence, and communicates business requirements across the development team. By testing thoughtfully and comprehensively, developers create software that stands as a testament to their coding prowess while seamlessly fulfilling business needs.

The next time you're giving yourself a mental pep talk and shifting gears to write some tests, take a moment to focus on how much more confidence you have in the code you're shipping, not just the checkboxes you need to tick to get a pull request approved.
