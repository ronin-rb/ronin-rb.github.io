---
layout: page
title: Writing Ronin Ruby Scripts - Binary
---

# Writing Ronin Ruby Scripts - Binary

## Table of Contents

* [Packing / Unpacking](#packing-unpacking)
* [Bit Flipping](#bit-flipping)
* [Buffer](#buffer)
* [Stream](#stream)
* [CString](#cstring)
* [Array](#array)
* [Struct](#struct)
* [Union](#union)
* [Packet](#packet)
* [Stack](#stack)

## Packing / Upacking

[ronin-support][ronin-support-docs] adds special `pack` methods to Ruby's
built-in [Integer][Integer#pack], [Float][Float#pack], and [Array][Array#pack]
classes which can pack data using C types:

[Integer#pack]: /docs/ronin-support/Integer.html#pack-instance_method
[Float#pack]: /docs/ronin-support/Float.html#pack-instance_method
[Array#pack]: /docs/ronin-support/Array.html#pack-instance_method

```ruby
0xfffe.pack(:uint32_le)
# => "\xFE\xFF\x00\x00"

0.1234.pack(:float64_le)
# => "\xF3\x8ESt$\x97\xBF?"

[0x1234, "hello"].pack(:uint16_le, :string)
# => "\x05\x00hello\x00"
```

[ronin-support][ronin-support-docs] adds a special [unpack][String#unpack]
and [unpack1][String#unpack1] methods to Ruby's built-in [String] that can
unpack binary data using C types:

[String#unpack]: /docs/ronin-support/String.html#unpack-instance_method
[String#unpack1]: /docs/ronin-support/String.html#unpack1-instance_method

```ruby
"\x00\x10\x00\x00".unpack1(:uint32_le)
# => 4096

"\x05\x00hello\x00".unpack(:uint16_le, :string)
# => [5, "hello"]
```

## Bit Flipping

[ronin-support][ronin-support-docs] adds methods for bit-flipping [String]s
and [Integer]s:

```ruby
require 'ronin/support/binary/bit_flip'

0x41.each_bit_flip(8) do |int|
  # ...
end

flipped_ints = 0xffff.bit_flips(8...16)


"foo".each_bit_flip do |string|
  # ...
end

flipped_strings = "foo".bit_flips
```

See the documentation for [String] and [Integer] for more detailed documentation
information.

## Buffer

[ronin-support][ronin-support-docs] provides a [Binary::Buffer] class for
representing a buffer of binary data:

[Binary::Buffer]: /docs/ronin-support/Ronin/Support/Binary/Buffer.html

```ruby
require 'ronin/support/binary/buffer'
include Ronin::Support

buffer = Binary::Buffer.new(16)
# => #<Ronin::Support::Binary::Buffer: "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00">
buffer.put_uint32(0,0x11223344)
buffer.put_int32(4,-1)
buffer.put_string(8,"ABC")
buffer.put_float32(12,0.5)
buffer.to_s
# => "D3\"\x11\xFF\xFF\xFF\xFFABC\x00\x00\x00\x00?"
```

## Stream

[ronin-support][ronin-support-docs] provides a [Binary::Stream] class for
working with streams of binary data.

[Binary::Stream]: /docs/ronin-support/Ronin/Support/Binary/Stream.html

```ruby
require 'ronin/support/binary/stream'
require 'socket'
include Ronin::Support

socket = TCPSocket.new('example.com',1337)
stream = Binary::Stream.new(socket)
stream.read_uint32
# => 1234
stream.write_uint32(0xffffffff)
```

See the [Binary::Stream] documentation for more methods and examples.

## CString

[ronin-support][ronin-support-docs] provides a [Binary::CString] class for
representing C strings:

[Binary::CString]: /docs/ronin-support/Ronin/Support/Binary/CString.html

```ruby
require 'ronin/support/binary/cstring'
include Ronin::Support

str1 = Binary::CString.new("hello ")
str2 = Binary::CString.new("world\0")

str = str1 + str2
# => #<Ronin::Support::Binary::CString:0x00007fc94b9e1af8 @string="hello world\u0000">
str.length
# => 11
str[0]
# => "h"
str[0] = 'X'
str.to_s
# => "Xello world"
```

See the [Binary::CString] documentation for more examples.

## Array

[ronin-support][ronin-support-docs] provides a [Binary::Array] class for
representing a C array:

[Binary::Array]: /docs/ronin-support/Ronin/Support/Binary/Array.html

```ruby
require 'ronin/support/binary/array'
include Ronin::Support

array = Binary::Array.new(:int32, 4)
# => #<Ronin::Support::Binary::Binary::Array: "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00">
array[0] = 0x11111111
array[1] = 0x22222222
array[2] = 0x33333333
array[3] = -1
array.to_s
# => "\x11\x11\x11\x11\"\"\"\"3333\xFF\xFF\xFF\xFF"
```

See the [Binary::Array] documentation for more methods and examples.

## Struct

[ronin-support][ronin-support-docs] provides a [Binary::Struct] class for
defining C structs:

[Binary::Struct]: /docs/ronin-support/Ronin/Support/Binary/Struct.html

```ruby
require 'ronin/support/binary/struct'

class Point < Ronin::Support::Binary::Struct

  member :x, :int32
  member :y, :int32

end

point = Point.new(x: 10, y: -1)
point.pack
# => "\n\x00\x00\x00\xFF\xFF\xFF\xFF"

point = Point.unpack("\x00\x00\x00\x01\xFF\xFF\xFF\xFF")
point.x
# => 1
point.y
# => -1
```

See the [Binary::Struct] documentation for more examples.

## Union

[ronin-support][ronin-support-docs] provides a [Binary::Union] class for
defining C unions:

[Binary::Union]: /docs/ronin-support/Ronin/Support/Binary/Union.html

```ruby
require 'ronin/support/binary/union'

class MyUnion < Ronin::Support::Binary::Union

  member :c, :char
  member :i, :int16
  member :u, :uint32

end

union = MyUnion.new
union.u = 0x11111111
union.i = -1
union.pack
# => "\xFF\xFF\x11\x11"

union = MyUnion.unpack("\xFF\xFF\x11\x11")
union.c
# => "\xFF"
union.i
# => -1
union.u
# => 286392319
```

See the [Binary::Union] documentation for more examples.

## Packet

[ronin-support][ronin-support-docs] provides a [Binary::Packet] class for
defining network packet headers.

[Binary::Packet]: /docs/ronin-support/Ronin/Support/Binary/Packet.html

```ruby
require 'ronin/support/binary/packet'

class Packet < Ronin::Support::Binary::Packet

  member :flags,  :uint8
  member :src,    :uint32
  member :dst,    :uint32
  member :length, :uint32

end

packet = Packet.new(
  flags:  0x0c,
  src:    IPAddr.new('1.2.3.4').to_i,
  dst:    IPAddr.new('5.6.7.8').to_i,
  length: 1024
)
packet.pack
# => "\f\x01\x02\x03\x04\x05\x06\a\b\x00\x00\x04\x00"

packet = Packet.unpack("\f\x01\x02\x03\x04\x05\x06\a\b\x00\x00\x04\x00")
packet.flags
# => 12
packet.src
# => 16909060
packet.dst
# => 84281096
packet.length
# => 1024
```

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
[Binary::Packet] is essentially the same as [Binary::Struct], but uses
network endianness and without any struct alignment.

[Binary::Packet]: /docs/ronin-support/Ronin/Support/Binary/Packet.html
[Binary::Struct]: /docs/ronin-support/Ronin/Support/Binary/Struct.html
  </div>
</article>

## Stack

[ronin-support][ronin-support-docs] provides a [Binary::Stack] class for
representing stack data.

[Binary::Stack]: /docs/ronin-support/Ronin/Support/Binary/Stack.html

```ruby
require 'ronin/support/binary/stack'
include Ronin::Support

stack = Binary::Stack.new("\x41\x00\x00\x00\x00\x00\x00\x00\x42\x00\x00\x00\x00\x00\x00\x00")
stack[0]
# => 65
stack[8]
# => 66

stack = Binary::Stack.new
stack.push(0xffffff10)
stack.push(0x100)
stack.to_s
=> "\x00\x01\x00\x00\x00\x00\x00\x00\x10\xFF\xFF\xFF\x00\x00\x00\x00"
```

See [Binary::Stack] documentation for more methods and examples.

[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-support-docs]: /docs/ronin-support/

[String]: /docs/ronin-support/String.html
[Integer]: /docs/ronin-support/Integer.html

<div class="level">
  <div class="level-left">
    <a class="button" href="encoding.html">
      &laquo; Encoding
    </a>
  </div>

  <div class="level-item has-text-centered">
    <a class="button" href="index.html">
      &#x2303; Writing Ronin Ruby Scripts
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="text.html">
      Text &raquo;
    </a>
  </div>
</div>
