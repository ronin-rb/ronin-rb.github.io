---
layout: page
title: Writing Ronin Ruby Scripts - Archives
---

# Writing Ronin Ruby Scripts - Archives

## Table of Contents

* [Tar](#tar)
* [Zip](#zip)
* [Mixin module](#mixin-module)

## Tar

[ronin-support][ronin-support-docs] provides methods for reading and writing
`.tar` archives:

```ruby
File.untar('file.tar') do |tar|
  tar.each do |entry|
    puts entry.full_name
    puts '-' * 80
    puts entry.read
    puts '-' * 80
  end
end

File.tar('output.tar') do |tar|
  tar.mkdir('foo')
  tar.add_file('foo/bar.txt','Hello World!')
end
```

See the documentation for [File] for a complete list of available methods.

## Zip

[ronin-support][ronin-support-docs] provides methods for reading and writing
`.zip` archives:

```ruby
File.unzip('file.zip') do |zip|
  zip.each do |entry|
    puts entry.name
    puts '-' * 80
    puts entry.read
    puts '-' * 80
  end
end

File.zip('output.zip') do |zip|
  zip.add_file('foo/bar.txt','Hello World!')
end
```

See the documentation for [File] for a complete list of available methods.

## Mixin module

If you prefer using functions instead of the [String] or [File] methods,
you can include the [Ronin::Support::Archive::Mixin] module.

[Ronin::Support::Archive::Mixin]: /docs/ronin-support/Ronin/Support/Archive/Mixin.html

```ruby
require 'ronin/support/archive/mixin'
include Ronin::Support::Archive::Mixin

tar = tar_stream(io)
tar = tar_stream(io, mode: 'w')

tar = tar_open(path)
tar = tar_open(path, mode: 'w')

tar = untar('file.tar') # alias for tar_open(path)
tar = tar('output.tar') # alias for tar_open(path, mode: 'w')

zip = zip_open(path)
zip = zip_open(path, mode: 'w')

zip = unzip('file.zip') # alias for zip_open(path)
zip = zip('output.zip') # alias for zip_open(path, mode: 'w')
```

<div class="level">
  <div class="level-left">
    <a class="button" href="compression.html">
      &laquo; Compression
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Writing Ronin Ruby Scripts
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="cryptography.html">
      Cryptography &raquo;
    </a>
  </div>
</div>

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-docs]: /docs/ronin-support/

[String]: /docs/ronin-support/String.html
[File]: /docs/ronin-support/File.html
