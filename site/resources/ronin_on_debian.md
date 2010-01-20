---
layout: default
title: Installing Ronin on Debian
---

Installing Ronin on Debian
==========================

This guide will show you how to properly install Ruby, RubyGems and then
Ronin on a vanilla Debian Linux system.

Libraries
---------

dependencies of Ronin (such as do_sqlite3 and nokogiri) require certain
libraries and their header files to be installed:

    $ sudo apt-get install libxml2 libxml2-dev libxslt1-dev sqlite3 libsqlite3-dev

Installing Ruby
---------------

If you already have not done so, we must fully install Ruby on the system.

    $ sudo apt-get install ruby ruby-dev rdoc irb libyaml-ruby libjson-ruby libopenssl-ruby

Installing RubyGems
-------------------

Since the Debian packages for RubyGems are woofly out of date, we
must install the most recent RubyGems from source.

**Note:** This section can be skiped all together if you are using
Ruby 1.9.1 or above.

    $ wget http://rubyforge.org/frs/download.php/45905/rubygems-1.3.1.tgz
    $ tar -xzvf rubygems-1.3.1.tgz
    $ cd rubygems-1.3.1
    $ sudo ruby setup.rb

If you are using the Debian package for RubyGems, you must
add /var/lib/gems/1.8/bin/ to your `PATH` environment variable.

    echo 'export PATH="$PATH:/var/lib/gems/1.8/bin"' >> ~/.bashrc

For Ruby 1.8.x and earlier you will have to edit your `.bashrc` or
`.profile` file in order to have Ruby automatically load rubygems.

    $ echo 'export RUBYOPT="-r rubygems"' >> ~/.bashrc
    $ source ~/.bashrc

Installing Ronin
----------------

Now that your Debian system has been properly setup with Ruby and RubyGems,
we can finally install Ronin:

    $ sudo gem install ronin

Developers Only
---------------

If you plan on testing or contributing code to Ronin, you will need to
install a couple extra RubyGems.

    $ sudo gem install hoe rspec

