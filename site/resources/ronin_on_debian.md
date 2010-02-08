---
layout: default
title: Installing Ronin on Debian
---

# Installing Ronin on Debian

This guide will show you how to properly install Ruby, RubyGems and then
Ronin on a vanilla Debian Linux system.

## Installing required Libraries

dependencies of Ronin (such as do_sqlite3 and nokogiri) require certain
libraries and their header files to be installed:

    $ sudo apt-get install libxml2 libxml2-dev libxslt1-dev sqlite3 libsqlite3-dev

## Installing Ruby

If you already have not done so, we must fully install Ruby on the system.

    $ sudo apt-get install ruby1.9.1-full rubygems1.9.1

## Installing Ronin

Now that your Debian system has been properly setup with Ruby and RubyGems,
we can finally install Ronin:

    $ sudo gem install ronin

## Developers Only

If you plan on testing or contributing code to Ronin, you will need to
install a couple extra RubyGems.

    $ sudo gem install rspec

## For the Inpatient

Copy and paste this into the terminal to install Ronin on Debian:

    echo "[-] Installing required libraries" && \
    sudo apt-get install libxml2 libxml2-dev libxslt1-dev sqlite3 libsqlite3-dev && \
    echo "[-] Installing Ruby 1.9.1" && \
    sudo apt-get install ruby1.9.1-full rubygems1.9.1 && \
    echo "[-] Installing Ronin" && \
    sudo gem install ronin

