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
* [Porting Metasploit Payloads to Ronin Payloads](porting/metasploit_payloads_to_ronin_payloads.html) -
  A guide that explains how to convert Metasploit payloads into
  [Ronin payloads][ronin-payloads].

[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme

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

## Archive

* [Ronin: A Platform for Publishing and Mayhem][1] - 
  A talk at ToorCamp 2009 discussing Ronin, how it can be used as a
  Platform for Publishing and Mayhem, given by Postmodern of Sophsec
  Intrusion Labs.
* [Intrusion via web application flaws][2] - A demo illustrating the
  Exploitation Life Cycle by [Dan Guido][3] for the
  [NYU: Poly Penetration Testing and Vulnerability Analysis][4] course.
  Features the Ronin AJAX PHP-RPC Server being injected via a
  [Remote File Inclusion (RFI)][5].
* [Hack This Zine #10 article - Delivering Weaponized Exploits with Ronin, RVM,
  and Bundler][6] - The [Hack This Zine #10][7] Developing with the ronin
  platform using rvm and bundler to release a weaponized exploit.
* [Hack This Zine #9 - Ronin: Badger! Badger! Badger!][8] -
  The [Hack This Zine #9][9] article which gives an update on Ronin development
  as well as new techniques used in the
  [Smart Brute Force Word Press utility][10].
* [Hack This Zine #8 - Ronin][11] - The [Hack This Zine #8][12] article which
  gives an detailed introduction to Ronin.

[1]: http://www.vimeo.com/7359548
[2]: http://www.vimeo.com/14983596
[3]: http://cryptocity.net/
[4]: http://pentest.cryptocity.net/
[5]: http://en.wikipedia.org/wiki/Remote_File_Inclusion
[6]: articles/hack_this_zine_10.html
[7]: https://hackbloc.org/svn/htz/10/indesign_Files/htz10_Print.pdf
[8]: articles/hack_this_zine_9.html
[9]: https://hackbloc.org/svn/htz/9/indesign_Files/htz9_Print.pdf
[10]: https://hackbloc.org/svn/htz/8/smart
[11]: articles/hack_this_zine_8.html
[12]: https://hackbloc.org/etc/zine/8/htz8_Print.pdf
