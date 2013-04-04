---
layout: default
title: Installing Ronin (Edge)
---

# Installing Ronin (Edge)

This guide covers how to install the development version of Ronin from
[GitHub](https://github.com/ronin-ruby/ronin/) and run it out of your
home directory.

### Quick Install

    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm) && \
    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bash_profile && \
    source ~/.bash_profile && \
    rvm install 1.9.2 && \
    rvm use 1.9.2 --default && \
    git clone https://github.com/ronin-ruby/ronin.git ~/ronin && \
    gem install bundler && \
    cd ~/ronin && \
    bundle install && \
    echo 'export PATH=$PATH:$HOME/ronin/bin' >> ~/.bashrc

## Installing Ruby

In order to run Ronin, you will need a recent version of
[Ruby](http://www.ruby-lang.org/) and [RubyGems](http://rubygems.org/)
installed on your system. It is recommended that you use Ruby 1.8.7, 1.9.1
or 1.9.2 with Ronin.

The easiest and recommended way for developers to install Ruby and RubyGems,
is by using the [Ruby Version Manager (RVM)](http://rvm.beginrescueend.com/).

To install RVM:

    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bash_profile
    source ~/.bash_profile
    
Then install Ruby:

    rvm install 1.9.2
    rvm use 1.9.2 --default

## Checking Out the Source-Code

First, you will need to checkout the source-code from the main Ronin
repository using git:

    git clone https://github.com/ronin-ruby/ronin.git ~/ronin

This will pull down every commit made to Ronin, giving you a complete copy of
the repository. After the repository has been cloned, you can update the Git
repository to get the latest changes:

    cd ronin/
    bundle install

## Installing dependencies

Before you can use Ronin, all dependencies must be installed. Additionally, the
development version of Ronin may require edge versions of libraries
only available on GitHub.

To make the management of dependencies easier for developers, Ronin uses
[Gem Bundler](http://gembundler.com/) to install dependencies separately from
RubyGems.

You will need to install bundler ~> 1.0.0:

    gem install bundler

<div class="warning">
  <p>
    <b>Warning:</b> In order to safely use the development version of Ronin
    with Bundler, you must first uninstall any previous Ronin gems:
  </p>

  <pre>gem uninstall ronin-asm ronin-dorks ronin-exploits ronin-gen ronin-php ronin-scanners ronin-sql ronin-web ronin</pre>
</div>

Install the dependencies:

    cd ronin/
    bundle install

## Running Ronin

At this point you should be able to run the `ronin` command-line utility
from the repository:

    ./bin/ronin

Additionally, you can add the `bin/` directory to the `$PATH`
environment variable in your `~/.bashrc` or `~/.profile` file, so you can run
`ronin` as if it were installed on the system:

    echo "export PATH=$PATH:$HOME/path/to/ronin/bin" >> ~/.bashrc
    source ~/.bashrc

    $ ronin
    >>

Alternatively, if you just need to open an Interactive Ruby Shell (IRB) to
selectively load files from Ronin, you can run the `console` rake task
from the repository:

    $ cd ronin/
    $ rake console
    ruby-1.9.2-p0 > require 'ronin/environment'
     => true
    ruby-1.9.2-p0 > Ronin::VERSION
     => "1.0.1"

