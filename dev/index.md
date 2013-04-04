---
layout: default
title: Development
---

# Development

## Git and GitHub

Since Ronin makes extensive use of [Git] and [GitHub], having a [github.com]
account and understanding Git workflow is crucial to contributors.

Not to worry, we have a good overview of [Git and GitHub][1].

## Style

Inorder to keep the source-code of Ronin clean and readable,
those who wish to contribute code to Ronin should review the project
[coding style guide-lines][2].


## Repositories

Once your familiar with Ronins coding style, and setup with [Git] and [GitHub],
you can dive right into Ronin.

### Libraries

<ul>
{% for library in site.libraries %}
  <li>
    <a href="http://github.com/ronin-ruby/{{ library[0] }}/">{{ library[1].name }}</a> -
    {{ library[1].description }}
  </li>
{% endfor %}
</ul>

### Misc

* [ronin-ruby.github.com](http://github.com/ronin-ruby/ronin-ruby.github.com) -
  This website.
* [art](http://github.com/ronin-ruby/art) - Original Ronin artwork.

[Git]: http://git-scm.com/
[GitHub]: https://github.com/
[github.com]: https://github.com/login

[1]: git_and_github.html
[2]: style.html
