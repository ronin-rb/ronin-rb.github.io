---
layout: post
title: Installing Ronin on BackTrack Linux 5r2
author: postmodern
---

[BackTrack Linux][1] 5r2 was [released][2] on March 1st, and ships with
newer versions of just about everything. So I thought it was high time that
we did a blog post on howto install Ronin on BackTrack Linux (BT) 5.

What is particularly nice about BT 5, is it ships with Ruby 1.9.2 and a few
common RubyGems (`bundler`, `rails`, etc). Also, the few libraries/header-files
which Ronin needs for installation (particularly `libsqlite3`)
were already installed. This made installing Ronin on BT 5 as simple as:

    gem install ronin

This will install Ronin and drop the `ronin` executable into
`/etc/alternatives/gem-bin/`. Now you should be able to start the Ronin console:

    # ronin
    >> VERSION
    => "1.4.1"
    >> !uname -a
    Linux bt 3.2.6 #1 SMP Fri Feb 17 10:40:05 EST 2012 i686 GNU/Linux
    => true

[1]: http://www.backtrack-linux.org/
[2]: http://www.backtrack-linux.org/backtrack/backtrack-5-r2-released/
