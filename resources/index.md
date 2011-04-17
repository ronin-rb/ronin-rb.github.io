---
layout: default
title: Resources
---

# Resources

## Videos

* [Ronin: A Platform for Publishing and Mayhem](http://www.vimeo.com/7359548) - 
  A talk at ToorCamp 2009 discussing Ronin, how it can be used as a
  Platform for Publishing and Mayhem, given by Postmodern of Sophsec
  Intrusion Labs.
* [Intrusion via web application flaws](http://www.vimeo.com/14983596) -
  A demo illustrating the Exploitation Life Cycle by
  [Dan Guido](http://cryptocity.net/) for the [NYU: Poly Penetration Testing and Vulnerability Analysis](http://pentest.cryptocity.net/)
  class. Features the Ronin AJAX PHP-RPC Server being injected via a
  [Remote File Inclusion (RFI)](http://en.wikipedia.org/wiki/Remote_File_Inclusion).

## Installation Guides

* [Installing Ronin on Debian](install/debian.html) -
  A brief set of instructions describing how to install Ronin on a vanilla
  Debian system.
* [Installing Ronin (Edge)](/install/edge.html) -
  Describes how to install and run the development version of Ronin into
  your home directory.

## Guides

* [Everyday Ronin](/guides/everyday_ronin.html) - 
  A somewhat lengthy guide covering the everyday usage of various
  convenience methods within the Ronin Ruby Console.
* [Using Ronin Web](/guides/using_ronin_web.html) -
  A brief guide showing basic usage of the Ronin Web library.
* [Using Ronin PHP](/guides/using_ronin_php.html) -
  A brief guide showing basic usage of the Ronin PHP library.

## Articles

* [Hack This Zine #10 article - Delivering Weaponized Exploits with Ronin, 
  RVM, and Bundler with evoltech and postmodern"(hack_this_zine_10.html) -
  The [Hack This Zine #10](https://hackbloc.org/svn/htz/10/indesign_Files/htz10_Print.pdf) 
  Developing with the ronin platform using rvm and bundler to release a 
  weaponized exploit.

* [Hack This Zine #9 - Ronin: Badger! Badger! Badger!](hack_this_zine_9.html) -
  The [Hack This Zine #9](https://hackbloc.org/svn/htz/9/indesign_Files/htz9_Print.pdf)
  article which gives an update on Ronin development as well as new techniques 
  used in the [Smart Brute Force Word Press utility](https://hackbloc.org/svn/htz/8/smartBruteForceWP.rb).

* [Hack This Zine #8 - Ronin](hack_this_zine_8.html) -
  The [Hack This Zine #8](https://hackbloc.org/etc/zine/8/htz8_Print.pdf)
  article which gives an detailed introduction to Ronin.

## API Documentation

<ul>
{% for library in site.libraries %}
  <li>
{% if library.dev != true %}
    <a href="http://rubydoc.info/gems/{{ library.slug }}/{{ library.version }}/frames">{{ library.name }}</a>
{% else %}
    <span class="underlined">{{ library.name }}</span>
{% endif %}

    <a href="http://rubydoc.info/github/ronin-ruby/{{ library.slug }}/master/frames">[edge]</a> - {{ library.description }}
  </li>
{% endfor %}
</ul>
