---
layout: post
title: Introducing ronin-support
author: postmodern
---

One of the things that recently came up during the
[Spring Cleaning Campaign (2010)][1] was that the [ronin] repository had
become heavy with convenience methods. So it was decided to split the
convenience methods out of the ronin repository, and create a new
Ronin library just for support code.

Introducing [ronin-support], a support library for Ronin. ronin-support
contains many of the convenience methods used by Ronin and additional libraries.
The ronin-support library also allows other projects to leverage Ronin
convenience methods, without needing the other dependencies of Ronin.

[1]: /blog/2010/01/12/spring-cleaning.html

[ronin]: https://github.com/ronin-ruby/ronin#readme
[ronin-support]: https://github.com/ronin-ruby/ronin-support#readme
