---
layout: page
title: Documentation
---

# Documentation

## Tutorials

* [Everyday Ronin](tutorials/everyday_ronin.html) - 
  A somewhat lengthy guide covering the everyday usage of various
  convenience methods within the Ronin Ruby Console.
* [Using ronin-web](tutorials/using_ronin_web.html) -
  A brief guide showing basic usage of the [ronin-web] library.

[ronin-web]: https://github.com/ronin-rb/ronin-web#readme

## Porting

* [Porting Metasploit Exploits to Ronin Exploits](porting/metasploit_exploits_to_ronin_exploits.html) -
  A guide that explains how to convert Metasploit exploits into
  [Ronin exploits][ronin-exploits].

[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme

## API

<table class="table">
  <tbody>
  {% for library in site.libraries %}
    <tr>
      <td>
        <a href="/docs/{{ library[0] }}/">{{ library[0] }}</a>
      </td>
      <td>{{ library[1].version }}</td>
      <td>{{ library[1].description }}</td>
    </tr>
  {% endfor %}
  </tbody>
</table>
