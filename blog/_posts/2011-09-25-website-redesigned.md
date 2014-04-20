---
layout: post
title: Website Redesigned
author: postmodern
---

It has been a while since the Ronin website saw major changes. I finally
got around to doing a minor redesign, with the goals of maximizing screen
real estate and better organization of content. Here are the major changes.

## SVGs FTW

The first thing you will notice is the improved [logo][1]. I converted the
original PNG logo (created with [Gimp][2]!) into a [Scalable Vector Graphic (SVG)][3]
using [Inkscape][4]. The menu was also recreated as a SVG, complete with
embedded links for the menu items.

Now the website should properly scale without pixelation. The SVGs should
render correctly in:

* [Firefox][5] >= 4
* [Chrome][6] >= 11
* [IE][7] 9

Opera has known issues with rendering inline SVGs. It goes without saying, the
website will not render correctly in IE 6. :)

## Blueprint CSS

I also added [Blueprint CSS][8] to the website, which should fix any
cross-browser CSS bugs and improve Typography. Blueprint also assumes the
maximum page width of 960 pixels, which allows for more content to be
displayed.

## Page Moves

Finally, the content was regrouped into four main sections:

* [blog](/blog/) - Project Blog.
* [faq](/faq/) - Frequently Asked Questions.
* [docs](/docs/) - Information for Users.
* [code](https://github.com/ronin-ruby/) - Ronin repositories on GitHub.

Not to worry, the [sitemap](/sitemap.xml) was updated and JavaScript redirects
were added to the old pages.

## Bugs

If the site is not rendering correctly for you, or maybe you found a typo,
you can [submit a bug][9] or [fork/edit the site][10] on [GitHub][11].

[1]: http://cloud.github.com/downloads/ronin-ruby/art/logo.svg
[2]: http://www.gimp.org/
[3]: http://en.wikipedia.org/wiki/Scalable_Vector_Graphics
[4]: http://inkscape.org/
[5]: http://www.mozilla.org/en-US/firefox/fx/
[6]: http://www.google.com/chrome
[7]: http://windows.microsoft.com/en-US/internet-explorer/products/ie/home
[8]: http://www.blueprintcss.org/
[9]: https://github.com/ronin-ruby/ronin-ruby.github.io/issues
[10]: https://github.com/ronin-ruby/ronin-ruby.github.io
[11]: https://github.com/signup/free
