# ronin.rubyforge.org

ronin.rubyforge.org is the Jekyll powered static website and blog for the
Ronin project.

## Directory Structure

* `Rakefile`: The top-level rake file which builds the HTML files.
* `_config.yml`: Configuration file used by the Rakefile and `jekyll`.
* `images`: Contains the original image files (XCFs or SVGs).
* `site`: Contains the site templates and other site data.
* `site/_layouts`: Top-level HTML/XML layout templates.
* `site/_includes`: Commonly included HTML content.
* `site/images`: Contains the static images to be published.
* `site/css`: Contains the CSS files to be published.
* `site/js`: Contains the static JavaScript files to be published.
* `site/static`: Contains static files provided by various Ronin libraries.
* `site/examples/*/_posts/`: Contains the random examples displayed on the
  front page.
* `site/blog/_posts`: Contains the posts for the Development Blog.
* `www`: Contains the files to be published.

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

## Synopsis

Building the website locally:

    $ rake

Run the site locally on `localhost:2222`:

    $ rake site:preview

Publishing the website:

    $ rake publish[user]

* Publishing to ronin.rubyforge.org requires ssh access.

Perform a publishing dry-run of the website:

    $ rake publish:dry_run[user]

## License

ronin.rubyforge.org.

Copyright (c) 2006-2010 Hal Brodigan (postmodern.mod3 at gmail.com)

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
