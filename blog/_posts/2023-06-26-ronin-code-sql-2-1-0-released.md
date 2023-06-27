---
layout: post
title: ronin-code-sql 2.1.0 released!
author: postmodern
tags:
  - ronin-code-sql
---

[ronin-code-sql][ronin-code-sql] [2.1.0] has been released!

## New Features

The `Ronin::Code::SQLI` constant alias was added:

```ruby
sqli = Ronin::Code::SQLI.new
sqli.or { 1 == 1 }
puts sqli
# 1 OR 1=1
```

The [Ronin::Code::SQL::Mixin] module was added that can add the `sql` and `sqli`
methods to any class.

```ruby
require 'ronin/code/sql/mixin'

class MyClass
  include Ronin::Code::SQL::Mixin

  def build_sqli
    sqli.or { 1 == 1 }
  end
end
```

Thanks to our newest contributor, [@lena64t], [ronin-code-sql] received two new
features:

Generating SQL injection with custom comments:

```ruby
sqli = Ronin::Code::SQLI.new
sqli.or { 1 == 1 }
puts sqli.to_sql(terminate: true, comment: '#')
# 1 OR 1=1 OR 1=1;#
```

Added support for the `ORDER BY` clause:

```ruby
sqli = Ronin::Code::SQLI.new
sqli.or { 1 == 1 }.order_by(10)
puts sqli
# 1 OR 1=1 ORDER BY (10)
```

## Updating

To update [ronin-code-sql], simply run:

```shell
sudo gem update ronin-code-sql
```

{% include docker_update.md %}

[ronin-code-sql]: https://github.com/ronin-rb/ronin-code-sql#readme
[2.1.0]: https://github.com/ronin-rb/ronin-code-sql/releases/tag/v2.1.0
[@lena64t]: https://github.com/lena64t
