# ronin-rb.github.io

* [Website][website]
* [Source](https://github.com/ronin-rb/ronin-rb.github.io)
* [Issues](https://github.com/ronin-rb/ronin-rb.github.io/issues)
* [Discord](https://discord.gg/6WAb3PsVX9) |
  [Mastodon](https://infosec.exchange/@ronin_rb)

[ronin-rb.github.io][website] is the [Jekyll][jekyll] powered static website
and blog for the Ronin project.

## Directory Structure

* `_config.yml`: Configuration file used by [jekyll].
* `_layouts`: Top-level HTML/XML layout templates.
* `_includes`: Commonly included HTML content.
* `_includes/images/`: SVG images that are inlined into the HTML.
* `images`: Contains the static images to be published.
* `stylesheet`: Contains the CSS files to be published.
* `javascript`: Contains the static JavaScript files to be published.
* `blog/_posts`: Contains the posts for the Development Blog.

## A Word about Markdown

For ease of editing and proof-reading many of the files in this repository
are written as [Markdown] documents. Files containing Markdown [syntax] are
denoted by the `.md` file extension.

## Requirements

* [ruby] >= 3.1.0
* [bundler] 2.x

## Development

1. [Fork It!](https://github.com/ronin-rb/ronin-rb.github.io/fork)
2. Clone It! `git clone https://github.com/your-user/ronin-rb.github.io.git`
3. `cd ronin-rb.github.io/`
4. Install It! `bundle install` (**Note:** this may take a while)
5. `git checkout -b my-changes`
6. Start It! `bundle exec jekyll serve`
7. Code It!
8. [Review It!](http://localhost:4000)
9. Push It! `git push origin my-changes`

## License

Copyright (c) 2006-2024 Hal Brodigan (postmodern.mod3 at gmail.com)

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

[website]: https://ronin-rb.dev/

[Markdown]: http://en.wikipedia.org/wiki/Markdown
[syntax]: http://daringfireball.net/projects/markdown/basics

[ruby]: https://www.ruby-lang.org/
[bundler]: https://bundler.io/
[jekyll]: https://jekyllrb.com/
[kramdown]: https://kramdown.gettalong.org/
