---
layout: default
title: Contribute
---

# Contribute

## Git and GitHub

Since Ronin makes extensive use of [Git](http://git-scm.com/) and
[GitHub](http://github.com/), having a [github.com](https://github.com/login)
account and understanding Git workflow is crucial to contributors.

Not to worry, we have a good overview of
[Git and GitHub](git_and_github.html).

## Style

Inorder to keep the source-code of Ronin clean and readable,
those who wish to contribute code to Ronin should review the project
[coding style guide-lines](style.html).


## Dive right in

Once your familiar with Ronins coding style, and setup with
[Git](http://git-scm.com/) and [GitHub](http://www.github.com/),
you can dive right into Ronin. Just pick a repository, fork it and dive in:

{% for library in site.libraries %}
* [{{ library.name }}](http://github.com/ronin-ruby/{{ library.slug }}/) -
  {{ library.description }}{% endfor %}
* [ronin-ruby.github.com](http://github.com/ronin-ruby/ronin-ruby.github.com) - 
  This website.

