---
layout: default
title: Installing Ronin on Mac OS X
---

# Installing Ronin on Mac OS X

This guide will show you how to properly install Ruby, RubyGems and then
Ronin on a vanilla Mac OS X system.

### Quick Install

    sudo ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)" && \
    sudo brew install libxml2 libxslt sqlite && \
    sudo gem install ronin

## Download X Code

Some RubyGems contain C extensions, which are compiled during installation.
In order to install these Gems, you will need to download
[X Code](http://developer.apple.com/xcode/).

## Install HomeBrew

In order to install the additional libraries, we must first install
[HomeBrew](http://mxcl.github.com/homebrew/):

    sudo ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"

## Installing required Libraries

Dependencies of Ronin (such as [do_sqlite3](http://rubygems.org/gems/do_sqlite3) and
[nokogiri](http://rubygems.org/gems/nokogiri)) require certain libraries and
their header files to be installed:

    sudo brew install libxml2 libxslt sqlite

## Installing Ronin

Now that your Mac OS X system has been properly setup with Ruby and RubyGems,
we can finally install Ronin:

    sudo gem install ronin

