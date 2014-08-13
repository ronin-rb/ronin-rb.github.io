---
layout: default
title: Installing Ronin on Mac OS X
---

# Installing Ronin on Mac OS X

This guide will show you how to properly install Ruby, RubyGems and then
Ronin on a vanilla Mac OS X system.

### Quick Install

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)" && \
    brew install libxml2 libxslt sqlite && \
    gem install ronin

## Install Command Line Tools

Some RubyGems contain C extensions, which are compiled during installation.
In order to install these Gems, you will need to install [Command Line Tools].

## Install HomeBrew

In order to install the additional libraries, we must first install [Homebrew]:

    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

## Installing required Libraries

Dependencies of Ronin (such as [do_sqlite3] and [nokogiri]) require certain
libraries and their header files to be installed:

    brew install libxml2 libxslt sqlite

## Installing Ronin

Now that your Mac OS X system has been properly setup with Ruby and RubyGems,
we can finally install Ronin:

    gem install ronin

[Command Line Tools]: https://developer.apple.com/downloads/index.action
[Homebrew]: http://mxcl.github.com/homebrew/
[do_sqlite3]: http://rubygems.org/gems/do_sqlite3#readme
[nokogiri]: http://nokogiri.org/
