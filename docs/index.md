---
layout: page
title: Documentation
---

# Documentation

## Guides

* [Getting Started](guides/getting-started/) -
  Explains how to install Ronin.
* [Using the Ronin CLI](guides/using-the-ronin-cli/) -
  Explains how to use Ronin's many commands and sub-commands.
* [Using the Ronin Ruby Shell](guides/using-the-ronin-ruby-shell/) - 
  Explains how to use Ronin's interactive Ruby Shell.
* [Using ronin-repos](guides/using-ronin-repos/) -
  Explains how to install and manage 3rd-party git repositories that can contain
  exploits or payloads.
* [Using ronin-db](guides/using-ronin-db/) -
  Explains how to interact with Ronin's built-in database.
* [Ruby Quick Ref](guides/ruby-quick-ref/) - 
  Provides a quick reference of Ruby's syntax.
* [Writing Ronin Ruby Scripts](guides/writing-ronin-ruby-scripts/) -
  Explains how to write Ruby scripts using [ronin-support].

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme

## Porting

* [Porting Metasploit Exploits to Ronin Exploits](porting/metasploit_exploits_to_ronin_exploits.html) -
  A guide that explains how to convert Metasploit exploits into
  [Ronin exploits][ronin-exploits].
* [Porting Metasploit Payloads to Ronin Payloads](porting/metasploit_payloads_to_ronin_payloads.html) -
  A guide that explains how to convert Metasploit payloads into
  [Ronin payloads][ronin-payloads].
* [Porting Python to Ronin Quick Ref](porting/python_to_ronin_quick_ref.html) - 
  Provides a quick references for converting Python code to Ronin.
* [Porting Pwnlib to Ronin Quick Ref](porting/pwnlib_to_ronin_quick_ref.html) -
  Provides a quick references for converting Pwnlib code to Ronin.

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
