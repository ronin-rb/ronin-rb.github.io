---
layout: page
title: Documentation
---

# Documentation

## Guides

* [Getting Started](guides/getting-started/index.md) -
  Explains how to install Ronin.

### CLI

* [Using the Ronin CLI](guides/using-the-ronin-cli/index.md) -
  Explains how to use Ronin's many commands and sub-commands.
* [Using ronin-db](guides/using-ronin-db/index.md) -
  Explains how to interact with Ronin's built-in database.
* [Using ronin-repos](guides/using-ronin-repos/index.md) -
  Explains how to install and manage 3rd-party git repositories that can contain
  exploits or payloads.

### Ruby

* [Using the Ronin Ruby Shell](guides/using-the-ronin-ruby-shell/index.md) -
  Explains how to use Ronin's interactive Ruby Shell.
* [Ruby Quick Ref](guides/ruby-quick-ref/index.md) -
  Provides a quick reference of Ruby's syntax.
* [Writing Ronin Ruby Scripts](guides/writing-ronin-ruby-scripts/index.md) -
  Explains how to write Ruby scripts using [ronin-support].

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme

## Porting

* [Porting Metasploit Exploits to Ronin Exploits](porting/metasploit-exploits-to-ronin-exploits/index.md) -
  A guide that explains how to convert Metasploit exploits into
  [Ronin exploits][ronin-exploits].
* [Porting Metasploit Payloads to Ronin Payloads](porting/metasploit-payloads-to-ronin-payloads/index.md) -
  A guide that explains how to convert Metasploit payloads into
  [Ronin payloads][ronin-payloads].
* [Porting Python to Ronin Quick Ref](porting/python-to-ronin-quick-ref/index.md) -
  Provides a quick references for converting Python code to Ronin.
* [Porting Pwnlib to Ronin Quick Ref](porting/pwnlib-to-ronin-quick-ref/index.md) -
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
