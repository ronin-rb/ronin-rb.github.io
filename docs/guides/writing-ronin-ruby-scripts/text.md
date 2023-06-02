---
layout: page
title: Writing Ronin Ruby Scripts - Text
---

# Writing Ronin Ruby Scripts - Text

## Table of Contents

* [Random](#random)
* [ERB](#erb)
* [Typos](#typos)
* [Homoglyphs](#homoglyphs)

## Random

[ronin-support][ronin-support-docs] provides a
[Ronin::Support::Text::Random::Mixin] module which adds `random_` methods
for generating random text from different character sets:

```ruby
require 'ronin/support/text/random'
include Ronin::Support::Text::Random::Mixin

random_alpha
# => "J"

random_alpha(10)
# => "kTNATXBYvW"

random_alpha_numeric(10)
# => "l5BOZws4KP"
```

See the documentation for [Ronin::Support::Text::Random::Mixin] for a complete
list of available methods.

[Ronin::Support::Text::Random::Mixin]: /docs/ronin-support/Ronin/Support/Text/Random/Mixin.html

## ERB

[ronin-support][ronin-support-docs] provides a
[Ronin::Support::Text::ERB::Mixin] module which adds a [erb] method which
renders ERB template files. ERB is a dynamic template file language for Ruby,
which allows embedding and rendering Ruby code within text.

[erb]: /docs/ronin-support/Ronin/Support/Text/ERB/Mixin.html#erb-instance_method
[Ronin::Support::Text::ERB::Mixin]: /docs/ronin-support/Ronin/Support/Text/ERB/Mixin.html

`template.erb` file:

```erb
<html>
  <script type="text/javascript">
    var payload = <%= @payload.js_string -%>;
    // ...
  </script>
</html>
```

```ruby
@payload = "PAYLOAD HERE"

html = erb('template.erb')
```

## Typos

[ronin-support][ronin-support-docs] adds methods to Ruby's built-in [String]
class for generating or enumerating over typos of a String.

```ruby
require 'ronin/support/text/typo'

"microsoft".typo
# => "microssoft"

"consciousness".each_typo do |typo|
  # ...
end

"consciousness".typos
# => 
# ["consciusness",
#  "consciosness",
#  "conscuosness",
#  "consciosness",
#  "coonsciousness",
#  "conscioousness",
#  "conssciousness",
#  "conscioussness",
#  "consciousnesss",
#  "consciuosness",
#  "consciousnes"]
```

## Homoglyphs

[ronin-support][ronin-support-docs] adds methods to Ruby's built-in [String]
class for generating or enumerating over typos of a String.

```ruby
require 'ronin/support/text/homoglyph'

"microsoft".homoglyph
# => "mｉcrosoft"

"microsoft".each_homoglyph do |homoglyph|
  # ...
end

"microsoft".homoglyphs
# => 
# ["ⅿicrosoft",
#  "ｍicrosoft",
#  "mіcrosoft",
#  "mⅰcrosoft",
#  "mｉcrosoft",
#  "miϲrosoft",
#  "miсrosoft",
#  "miⅽrosoft",
#  "miｃrosoft",
#  "micｒosoft",
#  "micrοsoft",
#  "microsοft",
#  "micrоsoft",
#  "microsоft",
#  "micrｏsoft",
#  "microsｏft",
#  "microѕoft",
#  "microｓoft",
#  "microsoｆt",
#  "microsofｔ"]
```

<div class="level">
  <div class="level-left">
    <a class="button" href="binary.html">
      &laquo; Binary
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Writing Ronin Ruby Scripts
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="compression.html">
      Compression &raquo;
    </a>
  </div>
</div>

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-docs]: /docs/ronin-support/

[String]: /docs/ronin-support/String.html
