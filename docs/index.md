---
layout: page
title: Documentation
---

# Documentation

## Guides

* [Getting Started](guides/getting-started/) -
  Explains how to install Ronin.

### CLI

* [Using the Ronin CLI](guides/using-the-ronin-cli/) -
  Explains how to use Ronin's many commands and sub-commands.
* [Using ronin-db](guides/using-ronin-db/) -
  Explains how to interact with Ronin's built-in database.
* [Using ronin-repos](guides/using-ronin-repos/) -
  Explains how to install and manage 3rd-party git repositories that can contain
  exploits or payloads.

### Ruby

* [Using the Ronin Ruby Shell](guides/using-the-ronin-ruby-shell/) -
  Explains how to use Ronin's interactive Ruby Shell.
* [Ruby Quick Ref](guides/ruby-quick-ref/) -
  Provides a quick reference of Ruby's syntax.
* [Writing Ronin Ruby Scripts](guides/writing-ronin-ruby-scripts/) -
  Explains how to write Ruby scripts using [ronin-support].

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme

## Porting

* [Porting Metasploit Exploits to Ronin Exploits](porting/metasploit-exploits-to-ronin-exploits/) -
  A guide that explains how to convert Metasploit exploits into
  [Ronin exploits][ronin-exploits].
* [Porting Metasploit Payloads to Ronin Payloads](porting/metasploit-payloads-to-ronin-payloads/) -
  A guide that explains how to convert Metasploit payloads into
  [Ronin payloads][ronin-payloads].
* [Porting Python to Ronin Quick Ref](porting/python-to-ronin-quick-ref/) -
  Provides a quick references for converting Python code to Ronin.
* [Porting Pwnlib to Ronin Quick Ref](porting/pwnlib-to-ronin-quick-ref/) -
  Provides a quick references for converting Pwnlib code to Ronin.

[ronin-exploits]: https://github.com/ronin-rb/ronin-exploits#readme
[ronin-payloads]: https://github.com/ronin-rb/ronin-payloads#readme

## Dev

* [Setting up a Ruby Development Environment](dev/setting-up-a-ruby-dev-environment/) - 
  A guide on how to setup a Ruby Development Environment to contribute to Ronin.

## Man Pages

* [ronin](man#ronin)
* [ronin-app](man#ronin-app)
* [ronin-db](man#ronin-db)
* [ronin-exploits](man#ronin-exploits)
* [ronin-fuzzer](man#ronin-fuzzer)
* [ronin-listener](man#ronin-listener)
* [ronin-masscan](man#ronin-masscan)
* [ronin-nmap](man#ronin-nmap)
* [ronin-payloads](man#ronin-payloads)
* [ronin-recon](man#ronin-recon)
* [ronin-repos](man#ronin-repos)
* [ronin-vulns](man#ronin-vulns)
* [ronin-web](man#ronin-web)
* [ronin-wordlists](man#ronin-wordlists)

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
