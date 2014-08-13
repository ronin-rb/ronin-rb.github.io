---
layout: default
title: Installing Ronin on Ubuntu
---

# Installing Ronin on Ubuntu

This guide will show you how to properly install Ruby, RubyGems and then
Ronin on a vanilla Ubuntu Linux system.

### Quick Install

    sudo apt-get install -y libreadline-dev libxml2 libxml2-dev libxslt1-dev sqlite3 libsqlite3-dev && \
    sudo apt-get install -y ruby1.9.1-full && \
    sudo update-alternatives --set ruby /usr/bin/ruby1.9.1 && \
    sudo gem install ronin

## Installing required Libraries

Dependencies of Ronin (such as [do_sqlite3] and [nokogiri]) require certain
libraries and their header files to be installed:

    sudo apt-get install -y libxml2 libxml2-dev libxslt1-dev sqlite3 libsqlite3-dev

## Installing Ruby

If you already have not done so, we must fully install Ruby on the system.

    sudo apt-get install -y ruby1.9.1
    sudo update-alternatives --set ruby /usr/bin/ruby1.9.1

## Installing Ronin

Now that your Ubuntu system has been properly setup with Ruby and RubyGems,
we can finally install Ronin:

    sudo gem install ronin

[do_sqlite3]: http://rubygems.org/gems/do_sqlite3
[nokogiri]: http://rubygems.org/gems/nokogiri
