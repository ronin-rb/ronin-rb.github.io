---
layout: default
title: Installing Ronin on Fedora
---

# Installing Ronin on Fedora

This guide will show you how to properly install Ruby, RubyGems and then
Ronin on a vanilla Fedora Linux system.

### Quick Install

    sudo yum install -y readline-devel libxml2 libxml2-devel libxslt libxslt-devel sqlite sqlite-devel && \
    sudo yum install -y ruby ruby-devel irb rubygems && \
    sudo gem install ronin

## Installing required Libraries

Dependencies of Ronin (such as [do_sqlite3] and [nokogiri]) require certain
libraries and their header files to be installed:

    sudo yum install -y libxml2 libxml2-devel libxslt libxslt-devel sqlite sqlite-devel

## Installing Ruby

If you already have not done so, we must fully install Ruby on the system.

    sudo yum install -y ruby ruby-devel irb rubygems

## Installing Ronin

Now that your Fedora system has been properly setup with Ruby and RubyGems,
we can finally install Ronin:

    sudo gem install ronin

[do_sqlite3]: http://rubygems.org/gems/do_sqlite3
[nokogiri]: http://rubygems.org/gems/nokogiri
