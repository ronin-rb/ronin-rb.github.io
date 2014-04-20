# ronin-ruby.github.io

* [Website](http://ronin-ruby.github.io)
* [Source](https://github.com/ronin-ruby/ronin-ruby.github.io)
* [Issues](https://github.com/ronin-ruby/ronin-ruby.github.io/issues)
* [Mailing List](http://groups.google.com/group/ronin-ruby)
* [irc.freenode.net #ronin](http://webchat.freenode.net/?channels=ronin&uio=Mj10cnVldd)

ronin-ruby.github.io is the Jekyll powered static website and blog for the
Ronin project.

## Directory Structure

* `_config.yml`: Configuration file used by the Rakefile and `jekyll`.
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
* [rdiscount] (for Markdown)

## Setup

    $ gem install jekyll rdiscount
    $ git clone https://github.com/ronin-ruby/ronin-ruby.github.io.git
    $ cd ronin-ruby.github.io/
    $ jekyll

## License

Copyright (c) 2006-2013 Hal Brodigan (postmodern.mod3 at gmail.com)

ronin-ruby.github.io is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

ronin-ruby.github.io is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with ronin-ruby.github.io.  If not, see
<http://www.gnu.org/licenses/>.

[Markdown]: http://en.wikipedia.org/wiki/Markdown
[syntax]: http://daringfireball.net/projects/markdown/basics

[jekyll]: https://github.com/mojombo/jekyll#readme
[rdiscount]: https://github.com/rtomayko/rdiscount#readme
