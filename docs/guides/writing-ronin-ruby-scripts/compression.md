---
layout: page
title: Writing Ronin Ruby Scripts - Compression
---

# Writing Ronin Ruby Scripts - Compression

## Table of Contents

* [Zlib](#zlib)
* [Gzip](#gzip)
* [Mixin module](#mixin-module)

## Zlib

[ronin-support][ronin-support-docs] also adds methods directly to Ruby's
[String] class for zlib compression:

```ruby
"hello".zlib_deflate
# => "x\x9C\xCBH\xCD\xC9\xC9\a\x00\x06,\x02\x15"

"x\x9C\xCBH\xCD\xC9\xC9\a\x00\x06,\x02\x15".zlib_inflate
# => "hello"
```

See the documentation for the [String] class for more detailed documentation.

## Gzip

[ronin-support][ronin-support-docs] also adds methods directly to Ruby's
[String] and [File] classes for zlib and gzip compression:

```ruby
"hello world\n".gzip
# => "\x1F\x8B\b\x00K\x05\x8Fb\x00\x03\xCBH\xCD\xC9\xC9W(\xCF/\xCAI\xE1\x02\x00-;\b\xAF\f\x00\x00\x00"

"\x1F\x8B\b\x00K\x05\x8Fb\x00\x03\xCBH\xCD\xC9\xC9W(\xCF/\xCAI\xE1\x02\x00-;\b\xAF\f\x00\x00\x00".gunzip
# => "hello world\n"

File.gzip('file.gz') do |gz|
  # gzip header info
  gz.mtime = Time.now
  gz.orig_name = 'file.txt'
  
  gz.write('Hello World!')
end

File.gunzip('wordlist.gz') do |gz|
  gz.each_line do |line|
    # ...
  end
end
```

See the documentation for [String] and [File] for more detailed documentation.

## Mixin module

If you prefer using functions instead of the [String] or [File] methods,
you can include the [Ronin::Support::Compression::Mixin] module.

[Ronin::Support::Compression::Mixin]: /docs/ronin-support/Ronin/Support/Compression/Mixin.html

```ruby
zlib_inflate("x\x9C\xCBH\xCD\xC9\xC9\a\x00\x06,\x02\x15")
# => "hello"
zlib_deflate("hello")
# => "x\x9C\xCBH\xCD\xC9\xC9\a\x00\x06,\x02\x15"

gz = gzip_stream(io)
gz = gzip_stream(io, mode: 'w')

gz = gzip_open(path)
gz = gzip_open(path, mode: 'w')

gz = gunzip(path) # alias for gzip_open(path, mode: 'w')
gz = gzip(path)   # alias for gzip_open(path)
```

<div class="level">
  <div class="level-left">
    <a class="button" href="text.html">
      &laquo; Text
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Writing Ronin Ruby Scripts
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="archives.html">
      Archives &raquo;
    </a>
  </div>
</div>

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-docs]: /docs/ronin-support/

[String]: /docs/ronin-support/String.html
[File]: /docs/ronin-support/File.html
