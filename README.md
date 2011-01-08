# ronin-ruby.github.com

ronin-ruby.github.com is the Jekyll powered static website and blog for the
Ronin project.

## Directory Structure

* `_config.yml`: Configuration file used by the Rakefile and `jekyll`.
* `_layouts`: Top-level HTML/XML layout templates.
* `_includes`: Commonly included HTML content.
* `images`: Contains the static images to be published.
* `css`: Contains the CSS files to be published.
* `js`: Contains the static JavaScript files to be published.
* `static`: Contains static files provided by various Ronin libraries.
* `examples/*/_posts/`: Contains the random examples displayed on the
  front page.
* `blog/_posts`: Contains the posts for the Development Blog.

## A Word about Markdown

For ease of editing and proof-reading many of the files in this repository
are written as [Markdown](http://en.wikipedia.org/wiki/Markdown) documents.
Files containing
[Markdown syntax](http://daringfireball.net/projects/markdown/basics)
are denoted by the `.md` file extension.

## Requirements

* [jekyll](http://github.com/mojombo/jekyll) >= 0.5.7
* [rdiscount](http://github.com/rtomayko/rdiscount) (for markdown)
* [watchr](http://github.com/mynyml/watchr/) (for previewing)

## License

Copyright (c) 2006-2011 Hal Brodigan (postmodern.mod3 at gmail.com)

ronin-ruby.github.com is free software: you can redistribute it and/or
modify it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

ronin-ruby.github.com is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with ronin-ruby.github.com.  If not, see
<http://www.gnu.org/licenses/>.
