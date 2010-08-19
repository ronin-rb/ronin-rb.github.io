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

## Installation Guides

* [Installing Ronin on Debian](ronin_on_debian.html) -
  A brief set of instructions describing how to install Ronin on a vanilla
  Debian system.

* [Installing Ronin (Edge)](ronin_edge.html) -
  Describes how to install and run the development version of Ronin into
  your home directory.

## Guides

* [Everyday Ronin](everyday_ronin.html) - 
  A somewhat lengthy guide covering the everyday usage of various
  convenience methods within the Ronin Ruby Console.
* [Using Ronin Web](using_ronin_web.html) -
  A brief guide showing basic usage of the Ronin Web library.
* [Using Ronin PHP](using_ronin_php.html) -
  A brief guide showing basic usage of the Ronin PHP library.

## Articles

* [Hack This Zine #8 - Ronin](hack_this_zine_8.html) -
  The [Hack This Zine #8](https://hackbloc.org/etc/zine/8/htz8_Print.pdf)
  article which gives an detailed introduction to Ronin.

## API Documentation

{% for library in site.libraries %}
* [{{ library.name }}](http://ronin-ruby.github.com/docs/{{ library.slug }}) -
  {{ library.description }}{% endfor %}

