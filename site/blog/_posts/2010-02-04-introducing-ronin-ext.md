---
layout: post
title: Introducing Ronin EXT
author: postmodern
---

One of the things that recently came up during the
[Spring Cleaning Campaign (2010)](/blog/2010/01/12/spring-cleaning.html)
was that the [ronin](http://github.com/ronin-ruby/ronin) repository had
become heavy with convenience methods. So it was decided to split the
convenience methods out of the ronin repository, and create a new
Ronin library just for support code.

Introducing [Ronin EXT](http://github.com/ronin-ruby/ronin-ext),
a support library for Ronin. Ronin EXT contains many of the convenience
methods used by Ronin and additional libraries. The Ronin EXT library
also allows other projects to leverage Ronin convenience methods, without
needing the other dependencies of Ronin.

