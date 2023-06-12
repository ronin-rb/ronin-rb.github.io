---
layout: page
title: Using the Ronin CLI - Misc
---

# Using the Ronin CLI - Misc

## Table of Contents

* [irb](#irb)
* [tips](#tips)
* [new](#new)

## irb

To start an interactive Ruby Shell with Ronin's libraries pre-loaded, run
`ronin irb`:

```ruby
$ ronin irb
irb(ronin)> "hello".base64_encode
=> "aGVsbG8=\n"
irb(ronin)> "hello".md5
=> "5d41402abc4b2a76b9719d911017c592"
```

For more information about using `ronin irb`, see the
[Using the Ronin Ruby Shell](../using-the-ronin-ruby-shell/) guide.

## tips

To get a random tip on how to use `ronin`, run `ronin tips`:

```
$ ronin tips
Load a SSL/TLS certificate from a file:

    key  = Ronin::Support::Crypto::Key.load_file('cert.key')
    cert = Ronin::Support::Crypto::Cert.load_file('cert.pem')

```

To list all available tip categories, run `ronin tips --list-categories`:

```
$ ronin tips --list-categories
cli
ruby
scripting
```

To get a random tip from a specific category, use the `-c` or `--category`
option:

```
$ ronin tips -c ruby
Read a binary file:

    data = File.binread('/bin/ls')

```

To search the tips for a specific keyword, use the `-s` or `--search` keyword:

```
$ ronin tips -s ssl
Get the SSL certificate from a port:

    cert = ssl_cert('example.com',443)
    # => #<Ronin::Support::Crypto::Cert
    #     subject=#<Ronin::Support::Crypto::Cert::Name CN=www.example.org,O=Internet\C2\A0Corporation\C2\A0for\C2\A0Assigned\C2\A0Names\C2\A0and\C2\A0Numbers,L=Los Angeles,ST=California,C=US>,                                           
    #     issuer=#<Ronin::Support::Crypto::Cert::Name CN=DigiCert TLS RSA SHA256 2020 CA1,O=DigiCert Inc,C=US>,                                 
    #     serial=#<OpenSSL::BN 20823119674429668393338028820299337114>,
    #     not_before=2022-03-14 00:00:00 UTC,        
    #     not_after=2023-03-14 23:59:59 UTC>         

Create a SSL Socket to a specified host and port:

    socket = ssl_connect('github.com',443)
    # => #<OpenSSL::SSL::SSLSocket:0x00000002f60458>

Or create a temporary SSL Socket that automatically closes:

    ssl_socket('github.com',443) do |socket|
      socket.write("GET /\r\n")
      puts socket.read
    end

```

## new

To generate a boilerplate new Ruby script with [ronin-support] preloaded, use
the `ronin new script` command:

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme

```
$ ronin new script foo.rb
	erb	script.rb.erb	foo.rb
	chmod	foo.rb
```

This will create the `foo.rb` file:

```ruby
#!/usr/bin/env ruby

require 'ronin/support'
include Ronin::Support

# code goes here
```

To generate a new Ruby project with a `Gemfile` to manage dependencies:

```
$ ronin new project foo
	mkdir	foo
	mkdir	foo/lib
	erb	.ruby-version.erb	foo/.ruby-version
	erb	Gemfile.erb	foo/Gemfile
	erb	project.rb.erb	foo/foo.rb
	chmod	foo/foo.rb
```

This will create the `foo/` directory, with a `.ruby-version` file
(supported by [chruby], [rbenv], and [RVM]) for specifying the desired
ruby version , `Gemfile` for [bundler], and a `foo.rb` file for your code.

[chruby]: https://github.com/postmodern/chruby#readme
[rbenv]: https://github.com/rbenv/rbenv#readme
[RVM]: https://rvm.io/
[bundler]: https://bundler.io

As you can see, the `Gemfile` is already configured for you:

```ruby
source 'https://rubygems.org'

gem 'ronin-support',         '~> 1.0' # , github: 'ronin-rb/ronin-support'

# gem 'ronin-code-asm',        '~> 0.3' # , github: 'ronin-rb/ronin-code-asm'
# gem 'ronin-code-sql',        '~> 1.2' # , github: 'ronin-rb/ronin-code-sql'
# gem 'ronin-db',              '~> 0.1' # , github: 'ronin-rb/ronin-db'
# gem 'ronin-web-server',      '~> 0.1' # , github: 'ronin-rb/ronin-web-server'
# gem 'ronin-web-spider',      '~> 0.1' # , github: 'ronin-rb/ronin-web-spider'
# gem 'ronin-web-user_agents', '~> 0.1' # , github: 'ronin-rb/ronin-web-user_agents'
# gem 'ronin-payloads',        '~> 0.1' # , github: 'ronin-rb/ronin-payloads'
# gem 'ronin-exploits',        '~> 1.0' # , github: 'ronin-rb/ronin-exploits'
```

For more information about how to use [ronin-support] in Ruby scripts,
see the [Writing Ronin Ruby Scripts](../writing-ronin-ruby-scripts/) guide.

<div class="level">
  <div class="level-left">
    <a class="button" href="text.html">
      &laquo; Text
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Using the Ronin CLI
    </a>
  </div>

  <div class="level-right">
  </div>
</div>

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-docs]: /docs/ronin-support/
