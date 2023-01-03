---
layout: default
title: About
feed: /blog/atom.xml
css:
 - examples.css
js:
 - jquery.min.js
 - examples.js
---

# Ronin

[Ronin][ronin] is a [Ruby] toolkit for security research and development.
Ronin contains many different [CLI commands][Synopsis] and
[Ruby libraries][GitHub] for a variety of security tasks, such as
encoding/decoding data, filter IPs/hosts/URLs, querying ASNs, querying DNS,
HTTP, scanning for web vulnerabilities, spidering websites, install 3rd party
repositories of exploits and/or payloads, run exploits, generating new exploits,
managing local databases, fuzzing data, and much more.

## Install 

```shell
curl -o ronin-install.sh https://raw.githubusercontent.com/ronin-rb/scripts/main/ronin-install.sh && bash ronin-install.sh --pre
```

## Libraries

{% for library in site.libraries %}
* [{{ library[0] }}](https://github.com/ronin-rb/{{ library[0] }}#readme)
  [({{ library[1].version }})](https://rubygems.org/gems/{{ library[0] }}/versions/{{ library[1].version }}) - 
  {{ library[1].description }}
{% endfor %}

## Examples

A couple of [examples](/examples/) of things Ronin simplifies.

<ul id="examples">
  <!-- Random Examples -->
</ul>

[Ruby]: http://www.ruby-lang.org
[ronin]: https://github.com/ronin-rb/ronin#readme
[Synopsis]: https://github.com/ronin-rb/ronin#synopsis
[GitHub]: https://github.com/ronin-rb/
