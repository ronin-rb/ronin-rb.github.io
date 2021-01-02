# ronin-rb.github.io

* [Website](http://ronin-rb.github.io)
* [Source](https://github.com/ronin-rb/ronin-rb.github.io)
* [Issues](https://github.com/ronin-rb/ronin-rb.github.io/issues)
* [Mailing List](http://groups.google.com/group/ronin-rb)
* [irc.freenode.net #ronin](http://webchat.freenode.net/?channels=ronin&uio=Mj10cnVldd)

ronin-rb.github.io is the Jekyll powered static website and blog for the
Ronin project.

## Directory Structure

* `_config.yml`: Configuration file used by [jekyll].
* `_layouts`: Top-level HTML/XML layout templates.
* `_includes`: Commonly included HTML content.
* `_includes/images/`: SVG images that are inlined into the HTML.
* `images`: Contains the static images to be published.
* `css`: Contains the CSS files to be published.
* `js`: Contains the static JavaScript files to be published.
* `static`: Contains static files provided by various Ronin libraries.
* `examples/*/_posts/`: Contains the random examples displayed on the
  front page.
* `blog/_posts`: Contains the posts for the Development Blog.

## A Word about Markdown

For ease of editing and proof-reading many of the files in this repository
are written as [Markdown] documents. Files containing Markdown [syntax] are
denoted by the `.md` file extension.

## Requirements

* [jekyll] >= 0.5.7
* [kramdown] (for Markdown)

## Setup

    $ gem install jekyll kramdown
    $ git clone https://github.com/ronin-rb/ronin-rb.github.io.git
    $ cd ronin-rb.github.io/
    $ jekyll serve

## License

Copyright (c) 2006-2020 Hal Brodigan (postmodern.mod3 at gmail.com)

ronin-rb.github.io is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

ronin-rb.github.io is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with ronin-rb.github.io.  If not, see
<http://www.gnu.org/licenses/>.

[Markdown]: http://en.wikipedia.org/wiki/Markdown
[syntax]: http://daringfireball.net/projects/markdown/basics

[jekyll]: https://github.com/mojombo/jekyll#readme
[kramdown]: https://kramdown.gettalong.org/
