---
layout: post
title: "Upgrade an Angular App Using Git"
date: 2018-09-22
categories: "development"
tags: ["angular", "git", "upgrade", "webapp"]
---

Git is a wonderful tool for keeping things organized. People typically link git with team projects, but it has amazing applications for working on solo projects. Being able to see how things change, and statements of WHY the change occurred go a long way into helping present-you figure out what past-you was thinking.

In this article, I'm going to show how the diary-style aspects of git can help you update an Angular app.

NOTE: With the release of AngularCLI 1.7, updating has become a (mostly) minor task. However, I still think you can gain a lot of value stepping through an update, and I hope you'll be able to apply this technique to other projects.

# Starter Project

We're going to start with the Tour Of Heroes starter project, which (as of lately is at v1.2 of the CLI), and bring it up to the modern AngularCLI version:

```
git clone git@github.com:johnpapa/angular-tour-of-heroes.git
# Go back to the CLI 1.2 version
git checkout b9d2014
# Remove the git repo so we can differentiate our changes from the project’s
rm -rf .git
# start a new repo
git init
git add . && git commit -am "Initial commit"
```

# Delete Everything

Now delete EVERYTHING. 

Are you scared?

```
# Remove files
rm -rf ./*
# Remove hidden files, except hidden directories
rm ./.*
```


Since we’re using git, don’t worry about things seeming like they’re gone. Let’s take a look at the unstaged changes:

```
git status
```

OUTPUT RESULT:
```
 D .angular-cli.json
 D .editorconfig
 D .gitignore
 D LICENSE
 D README.md
 D e2e/app.e2e-spec.ts
 D e2e/app.po.ts
 D e2e/tsconfig.e2e.json
 D karma.conf.js
 D package-lock.json
 D package.json
 D protractor.conf.js
 D src/app/app-routing.module.ts
 D src/app/app.component.css
 D src/app/app.component.ts
 D src/app/app.module.ts
 D src/app/dashboard.component.css
 D src/app/dashboard.component.html
 D src/app/dashboard.component.ts
 D src/app/hero-detail.component.css
 D src/app/hero-detail.component.html
 D src/app/hero-detail.component.ts
 D src/app/hero-search.component.css
 D src/app/hero-search.component.html
 D src/app/hero-search.component.ts
 D src/app/hero-search.service.ts
 D src/app/hero.service.ts
 D src/app/hero.ts
 D src/app/heroes.component.css
 D src/app/heroes.component.html
 D src/app/heroes.component.ts
 D src/app/in-memory-data.service.ts
 D src/assets/.gitkeep
 D src/environments/environment.prod.ts
 D src/environments/environment.ts
 D src/favicon.ico
 D src/index.html
 D src/main.ts
 D src/polyfills.ts
 D src/styles.css
 D src/test.ts
 D src/tsconfig.app.json
 D src/tsconfig.spec.json
 D src/typings.d.ts
 D tsconfig.json
 D tslint.json
```

See how there's nothing to worry about? Git has tracked WHAT changed, so if we ever want it back, we can checkout this change, reset the branch, or add a revert.

Now let’s update our base Angular project.

# Start Over

Because each version of Angular CLI has significantly different project setups I’m not going to bother making all of the individual configuration changes. It's slow and prone to mistakes. Instead, I’m just going to start a brand new project.

Set our proper version of Angular CLI:

```
npm i -g @angular/cli
```

Create our new project:

```
ng new updatedproject
```

Once the new project is complete, move the contents back into the main directory:

```
mv updatedproject/* .
# Move the hidden files
mv updatedproject/.* .
```

Now that we have a new project, let’s see what has changed compared to our original:

```
git status
```

OUTPUT RESULT:
```
 D .angular-cli.json
 M .gitignore
 D LICENSE
 M README.md
 D e2e/app.e2e-spec.ts
 D e2e/app.po.ts
 M e2e/tsconfig.e2e.json
 D karma.conf.js
 M package-lock.json
 M package.json
 D protractor.conf.js
 D src/app/app-routing.module.ts
 M src/app/app.component.css
 M src/app/app.component.ts
 M src/app/app.module.ts
 D src/app/dashboard.component.css
 D src/app/dashboard.component.html
 D src/app/dashboard.component.ts
 D src/app/hero-detail.component.css
 D src/app/hero-detail.component.html
 D src/app/hero-detail.component.ts
 D src/app/hero-search.component.css
 D src/app/hero-search.component.html
 D src/app/hero-search.component.ts
 D src/app/hero-search.service.ts
 D src/app/hero.service.ts
 D src/app/hero.ts
 D src/app/heroes.component.css
 D src/app/heroes.component.html
 D src/app/heroes.component.ts
 D src/app/in-memory-data.service.ts
 M src/environments/environment.ts
 M src/index.html
 M src/main.ts
 M src/polyfills.ts
 M src/styles.css
 M src/test.ts
 M src/tsconfig.app.json
 M src/tsconfig.spec.json
 D src/typings.d.ts
 M tsconfig.json
 M tslint.json
?? angular.json
?? e2e/protractor.conf.js
?? e2e/src/
?? src/app/app.component.html
?? src/app/app.component.spec.ts
?? src/browserslist
?? src/karma.conf.js
?? src/tslint.json
```

Compare this to the previous status from right after we deleted everything.

Notice how there are less things that have been removed, but now there are also things that have _changed_. Instead of having to go through the individual changes of making our project work in with the new version of Angular CLI, we let the tools do the work for us.

Notice the new files (marked by `??`). Imagaine how much time it would have taken to realize you needed to add a new tslint or karma configuration? Again, we’ve let the computer do what it’s good at with as little human input as possible.

Also notice that the core Angular version has changed from v4 to (as of today) v6.1.x. Each CLI version is linked to a specific core version. This is why I love this update process. Instead of figuring out the correct versions of Angular and the CLI, I just have the CLI give me the version it was built to support.

# Bring Back My Project!

Before we get too far ahead of ourselves, let’s bring back our old project from the dead

```
git checkout src/app/
```

Now that we’ve overwritten the default Hello World app with our Tour Of Heroes, we can get started on the specific changes of getting our app working with the new version of Angular.

From here, go through each of your file’s diffs and make sure you have the correct configuration, extra packages, etc. At each point, you can run the app and tests and make sure everything’s working as you expect.

# Conclusion

At the top of the article I said this diary-style way of using git is applicable to more things than just an Angular project. Think about some of the projects you worked on where you had to make sweeping changes that impacted massive parts of your codebase. Using git as an intermediary change-tracking tool will help you manage big changes. You can also use this process in a micro-way, kind of as an extended Save and Undo. Once you understand squashing or rebasing commits, you can make as many small changes as you want, giving yourself the freedom to undo the havoc you’ll inevitably cause while working on a new feature :]
