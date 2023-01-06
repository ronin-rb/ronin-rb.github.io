---
layout: default
title: Using ronin-web
---

# Using ronin-web

The [Ronin Web](/docs/ronin-web/) library provides
support for Web Scraping and Spidering functionality in Ronin.

Before we can use this library in the Ronin Ruby Console, we must first
install the library. To install the Ronin Web library used in this guide,
simply run the following command:

```shell
$ sudo gem install ronin-web
```

To start the Ronin Ruby Console, with ronin-web pre-loaded, simply run the
`ronin-web` command:

```shell
$ ronin-web irb
```

## Parsing HTML

Parse HTML:

```ruby
HTML.parse(open('some_file.html'))
# => <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
# <html>
#   <head>
#     <script type="text/javascript" src="redirect.js"></script>
#   </head>
# </html>
```

## Building HTML

Build a HTML document:

```ruby
doc = HTML.build do
  html {
    head {
      script(:type => 'text/javascript', :src => 'redirect.js')
    }
  }
end

puts doc.to_html
# <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
# <html><head><script src="redirect.js" type="text/javascript"></script></head></html>
```

## Parsing XML

Parse XML:

```ruby
XML.parse(some_text)
# => <?xml version="1.0"?>
# <users>
#   <user>
#     <name>admin</name>
#     <password>0mni</password>
#   </user>
# </users>
```

## Building XML

Build a XML document:

```ruby
doc = XML.build do
  playlist {
    mp3 {
      file { text('02 THE WAIT.mp3') }
      artist { text('Evil Nine') }
      track { text('The Wait feat David Autokratz') }
      duration { text('1000000000') }
    }
  }
end

puts doc.to_xml
# <?xml version="1.0"?>
# <playlist>
#   <mp3>
#     <file>02 THE WAIT.mp3</file>
#     <artist>Evil Nine</artist>
#     <track>The Wait feat David Autokratz</track>
#     <duration>1000000000</duration>
#   </mp3>
# </playlist>
```

## Mechanize

Getting a persistent [Mechanize] agent:

```ruby
agent = Web.agent(:user_agent_alias => 'iPhone')
# => #<WWW::Mechanize:...>

agent.get('http://news.ycombinator.net/')
# => #<WWW::Mechanize::Page:...>
```

Getting a [page][Mechanize::Page]:

```ruby
Web.get('http://www.rubyinside.com/')
# => #<WWW::Mechanize::Page:...>
```

Return the body of a [page][Mechanize::Page]:

```ruby
Web.get_body('http://www.rubyinside.com/')
# => "..."
```

Posting with a [page][Mechanize::Page]:

```ruby
Web.post('http://www.example.com/login.php', :query => {:user => 'meowmix', :password => 'delivers'})
# => #<WWW::Mechanize::Page:...>
```

Return the body of a posted [page][Mechanize::Page]:

```ruby
Web.post_body('http://www.example.com/login.php', :query => {:user => 'meowmix', :password => 'delivers'})
# => "..."
```

Opening a web-page as a temporary file:

```ruby
Web.open('http://www.example.com/users.php')
# => #<StringIO: ...>
```

[Mechanize]: https://www.rubydoc.info/gems/mechanize/ 
[Mechanize::Page]: https://www.rubydoc.info/gems/mechanize/Mechanize/Page
