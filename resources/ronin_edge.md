---
layout: default
title: Installing Ronin (Edge)
---

# Installing Ronin (Edge)

This guide covers how to install the development version of Ronin from
[GitHub](http://github.com/ronin-ruby/) and run it out of your
home directory.

# Installing Ruby

In order to run Ronin, you will need a recent version of Ruby and RubyGems
installed on your system. It is recommended that you use Ruby 1.8.7, 1.9.1
or 1.9.2 with Ronin.

The easiest and recommended way for developers to install Ruby, is by using
the [Ruby Version Manager](http://rvm.beginrescueend.com/).

# Checking Out the Source-Code

First, you will need to checkout the source-code from the main Ronin
repository using git:

    git clone git://github.com/ronin-ruby/ronin.git

This will pull down every commit made to Ronin. After the repository has
been cloned, you can update the Git repository to get the latest changes:

    cd ronin/
    git pull

# Installing dependencies

Before you can use Ronin, dependencies must be installed. Additionally, the
development version of Ronin may require edge versions of libraries
only available on GitHub. To make the management of dependencies easier for
developers, Ronin uses [Gem Bundler](http://gembundler.com/) to install
dependencies separately from RubyGems.

You will need to install bundler >= 1.0.0.rc.1:

    gem install bundler --pre

Install the dependencies:

    cd ronin/
    bundle install

# Running Ronin

At this point you should be able to run the `ronin` command-line utility
from the repository:

    ./bin/ronin

Additionally, you can add the `bin/` directory to your `$PATH`
environment variable in `~/.bashrc` or `~/.profile` file, so you can run
`ronin` as if it was installed:

    echo "export PATH=$PATH:~/src/ronin/bin" >> ~/.bashrc
    source ~/.bashrc

    $ ronin
    >>

Alternatively, if you just need to open an IRB Console to selectively load files from ronin, you can use the `console` rake task:

    $ rake console
    ruby-1.9.2-p0 > require 'ronin/environment'
     => true
    ruby-1.9.2-p0 > Ronin::VERSION
     => "0.4.0"

