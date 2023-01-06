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

{% include description.md %}

## Install 

```shell
curl -o ronin-install.sh https://raw.githubusercontent.com/ronin-rb/scripts/main/ronin-install.sh && bash ronin-install.sh --pre
```

If you do not want to use the `ronin-install.sh` installation script, there are
also [manual installation instructions][manual-install] available.

[manual-install]: http://localhost:4000/install/#manual-instructions

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
