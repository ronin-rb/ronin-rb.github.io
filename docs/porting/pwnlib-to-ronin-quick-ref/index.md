---
layout: page
title: Porting Pwnlib to Ronin
---

# Porting Pwnlib to Ronin

## Table of Contents

* [pwnlib.tubes.buffer](#pwnlibtubesbuffer)
* [pwnlib.tubes.process](#pwnlibtubesprocess)
* [pwnlib.tubes.remote](#pwnlibtubesremote)
* [pwnlib.tubes.listen](#pwnlibtubeslisten)
* [pwnlib.tubes.ssh](#pwnlibtubesssh)
* [pwnlib.tubes.crc](#pwnlibtubescrc)
* [pwnlib.util.useragents](#pwnlibutiluseragents)
* [pwnlib.util.fiddling](#pwnlibutilfiddling)
* [pwnlib.util.hashes](#pwnlibutilhashes)
* [pwnlib.util.iters](#pwnlibutiliters)
* [pwnlib.util.list](#pwnlibutillist)
* [pwnlib.util.misc](#pwnlibutilmisc)
* [pwnlib.util.packing](#pwnlibutilpacking)

## pwnlib.tubes.buffer

Python                                 | Ruby
---------------------------------------|----------------------------------------
`Buffer()`                             | `StringIO.new`

See the documentation for [StringIO] for available methods.

[StringIO]: https://rubydoc.info/stdlib/stringio/StringIO

## pwnlib.tubes.process

Python                                 | Ruby
---------------------------------------|----------------------------------------
`process("command")`                   | `IO.popen('command','w')` / `IO.popen('command','w')` / `stdout, stdin, wait_thr = Open3.popen2('command')`

See the documentation for [IO.popen] and [Open3] for more detailed
documentation.

[IO.popen]: https://rubydoc.info/stdlib/core/IO#popen-class_method
[Open3]: https://rubydoc.info/gems/open3/Open3

## pwnlib.tubes.remote

Python                                 | Ruby
---------------------------------------|----------------------------------------
`remote('example.com', 80)`            | `tcp_connect('example.com',80)`
`remote('example.com', 443, ssl=True)` | `ssl_connect('example.com',443)`
`remote('host', 1234, typ='udp')`      | `udp_connect('host',1234)`
`socket.sendline(b"hello world")`      | `socket.puts("hello world")`

See the documentation of [the network mixin][Ronin::Support::Network::Mixin]
for more methods.

[Ronin::Support::Network::Mixin]: https://ronin-rb.dev/docs/ronin-support/Ronin/Support/Network/Mixin.html

## pwnlib.tubes.listen

Python                                 | Ruby
---------------------------------------|----------------------------------------
`s = listen(1234)`                     | `server = tcp_server(1234)`
`s.wait_for_connection()`              | `client = server.accept`
`s = server(1234)`                     | `server = tcp_server(1234)`
`s.next_connection()`                  | `client = server.accept`

See the documentation of [the network mixin][Ronin::Support::Network::Mixin]
for more methods.

[Ronin::Support::Network::Mixin]: https://ronin-rb.dev/docs/ronin-support/Ronin/Support/Network/Mixin.html

## pwnlib.tubes.ssh

Python                                 | Ruby
---------------------------------------|----------------------------------------
`ssh(host='ssh.example.com', user='user', password='password')` | `Net::SSH.start('host', 'user', password: 'password')`

## pwnlib.tubes.crc

Python                                 | Ruby
---------------------------------------|----------------------------------------
`import pwnlib.tubes.crc`              | `require 'digest/crc'`
`crc_16_dnp(data)`                     | `Digest::CRC16DNP.checksum(data)`
`crc_16_genibus(data)`                 | `Digest::CRC16Genibus.checksum(data)`
`crc_16_kermit(data)`                  | `Digest::CRC16Kermit.checksum(data)`
`crc_16_modbus(data)`                  | `Digest::CRC16Modbus.checksum(data)`
`crc_16_usb(data)`                     | `Digest::CRC16USB.checksum(data)`
`crc_16_xmodem(data)`                  | `Digest::CRC16XModem.checksum(data)`
`crc_32_cksum(data)`                   | `Digest::CRC32.checksum(data)`
`crc_32_bzip2(data)`                   | `Digest::CRC32BZip2.checksum(data)`
`crc_32_jamcrc(data)`                  | `Digest::CRC32Jam.checksum(data)`
`crc_32_mpeg_2(data)`                  | `Digest::CRC32MPEG.checksum(data)`
`crc_32_xfer(data)`                    | `Digest::CRC32XFER.checksum(data)`
`crc_64_xz(data)`                      | `Digest::CRC64XZ.checksum(data)`

See the documentation for [digest-crc] for more detailed documentation.

[digest-crc]: https://rubydoc.info/gems/digest-crc

## pwnlib.useragents

Python                                 | Ruby
---------------------------------------|----------------------------------------
`getall()`                             | `Ronin::Support::Network::HTTP::UserAgents::ALIASES.values`
`random()`                             | `Ronin::Support::Network::HTTP::UserAgents[:random]`

<article class="message is-dark">
  <div class="message-header">Note:</div>
  <div class="message-body" markdown="1">
All `http_*` methods accept a user_agent:` keyword argument that can accept 
`:random`, `:chrome`, or `:linux`, to select a random `User-Agent` string
from [Ronin::Support::Network::HTTP::UserAgents].

[Ronin::Support::Network::HTTP::UserAgents]: /docs/ronin-support/Ronin/Support/Network/HTTP/UserAgents.html
  </div>
</article>

## pwnlib.util.fiddling

Python                                 | Ruby
---------------------------------------|----------------------------------------
`bits_str(42)`                         | `42.to_s(2)`
`b64d('dGVzdA==')`                     | `"dGVzdA==".base64_decode`
`b64e(b"test")`                        | `"test".base64_encode`
`enhex(b"test")`                       | `"test".hex_encode`
`print(hexdump(b"abc"))`               | "abc".hexdump`
`print('\n'.join(hexdump_iter(data)))` | `Hexdump::Hexdump.new.each_line(data)`
`isprint(string)`                      | `string.printable?` / `Chars::PRINTABLE =~ string`
`js_escape(b'\xde\xad\xbe\xef')`       | `"\xde\xad\xbe\xef".js_escape`
`js_unescape('%uadde%uefbe')`          | `"%uadde%uefbe".js_unescape`
`unhex("74657374")`                    | `"74657374".hex_unescape` / `"74657374".hex_decode`
`urldecode("test%20%41")`              | `"test%20%41".uri_decode`
`urlencode("test A")`                  | `"test A".uri_encode`
`xor(b'lol', b'hello')`                | `"hello".xor("lol")`

## pwnlib.util.hashes

Python                                 | Ruby
---------------------------------------|----------------------------------------
`md5filehex(path)`                     | `File.md5(path)`
`md5sumhex(string)`                    | `string.md5`
`sha1filehex(path)`                    | `File.sha1(path)`
`sha1sumhex(string)`                   | `string.sha1`
`sha256filehex(path)`                  | `File.sha256(path)`
`sha256sumhex(string)`                 | `string.sha256`
`sha512filehex(path)`                  | `File.sha512(path)`
`sha512sumhex(string)`                 | `string.sha512`

## pwnlib.util.iters

Python                                 | Ruby
---------------------------------------|----------------------------------------
`@chained`                             | `return enum_for(__method__,...) unless block_given?`
`cycles(list)`                         | `array.cycle`
`bruteforce(lambda x: x == '...', string.ascii_lowercase, length=5)` | `Chars.lowercase_alpha.strings_of_length(5).find { |str| ... }`
`flatten(list)`                        | `array.flatten`
`group(n,list)`                        | `array.each_slice(n)`
`iter_except(func,ErrorClass)`         | `array.each`
`lookahead(n,list)`                    | `enum.take(n)`
`pairwise(list)`                       | `array.each_cons(2)`
`powerset(list)`                       | `require 'combinatorics/power_set'` + `array.power_set`
`quantify(list, lambda x: ...)`        | `array.count { |x| ... }`
`random_combination(list,n)`           | `array.combination(2).to_a.sample`
`random_permutation(list)`             | `array.permutation.to_a.sample`
`random_product(list1,list2)`          | `array1.product(array2).sample`
`repeat_func(func,...)`                | `Array.new(n) { |i| func(...) }`
`take(5, tabulate(lambda x: ..., start = 1))` | `(1..5).map { |x| ... }` / `(1..5).map(&method(:func))`
`take(n,iter)`                         | `enum.take(n)`
`unique_everseen(iter)`                | `enum.uniq`

## pwnlib.util.list

Python                                 | Ruby
---------------------------------------|----------------------------------------
`concat([list1, list2])`               | `list1.concat(list2)`
`concat_all([list1, [list2, list3]])`  | `[list1, [list2, list3]].flatten`
`group(n, list)`                       | `array.each_slice(n)`
`ordlist(string)`                      | `string.bytes`
`unordlist([...])`                     | `[...].map(&:chr).join`

## pwnlib.util.misc

Python                                 | Ruby
---------------------------------------|----------------------------------------
`binary_ip(ip)`                        | `IPAddr.new(ip).hton`
`mkdir_p(path)`                        | `FileUtils.mkdir_p(path)`
`read(path)`                           | `File.read(path)` / `File.binread(path)`
`write(path,data)`                     | `File.write(path,data)` / `File.binwrite(path,data)`

## pwnlib.util.packing

Python                                 | Ruby
---------------------------------------|----------------------------------------
`pack(0x414141, 4, 'little')`          | `0x414141.pack(:uint32_le)`
`pack(0x414141, 4, 'little', True)`    | `0x414141.pack(:int32_le)`
`pack(0x414141, 4, 'big')`             | `0x414141.pack(:uint32_be)`
`pack(0x414141, 4, 'big', True)`       | `0x414141.pack(:int32_be)`
`p8(0x41, 'signed', 'little')`         | `0x41.pack(:int8)` / `0x41.pack(:byte)` / `0x41.chr`
`p8(0x41, 'unsigned', 'little')`       | `0x41.pack(:uint8)` / `0x41.pack(:byte)` / `0x41.chr`
`p16(0x1234, 'signed', 'little')`      | `0x1234.pack(:int16_le)`
`p16(0x1234, 'signed', 'big')`         | `0x1234.pack(:int16_be)`
`p16(0x1234, 'unsigned', 'little')`    | `0x1234.pack(:uint16_le)`
`p16(0x1234, 'unsigned', 'big')`       | `0x1234.pack(:uint16_be)`
`p32(0x12345678, 'signed', 'little')`  | `0x12345678.pack(:int32_le)`
`p32(0x12345678, 'signed', 'big')`     | `0x12345678.pack(:int32_be)`
`p32(0x12345678, 'unsigned', 'little')`| `0x12345678.pack(:uint32_le)`
`p32(0x12345678, 'unsigned', 'big')`   | `0x12345678.pack(:uint32_be)`
`p64(0x123456789abcdef0, 'signed', 'little')`    | `0x123456789abcdef0.pack(:int64_le)`
`p64(0x123456789abcdef0, 'signed', 'big')`       | `0x123456789abcdef0.pack(:int64_be)`
`p64(0x123456789abcdef0, 'unsigned', 'little')`  | `0x123456789abcdef0.pack(:uint64_le)`
`p64(0x123456789abcdef0, 'unsigned', 'big')`     | `0x123456789abcdef0.pack(:uint64_be)`
`u8(data, 'signed', 'little')`         | `data.unpack1(:int8)`
`u8(data, 'unsigned', 'little')`       | `data.unpack1(:uint8)` / `data.ord`
`u16(data, 'signed', 'little')`        | `data.unpack1(:int16_le)`
`u16(data, 'signed', 'big')`           | `data.unpack1(:int16_be)`
`u16(data, 'unsigned', 'little')`      | `data.unpack1(:uint16_le)`
`u16(data, 'unsigned', 'big')`         | `data.unpack1(:uint16_be)`
`u32(data, 'signed', 'little')`        | `data.unpack1(:int32_le)`
`u32(data, 'signed', 'big')`           | `data.unpack1(:int32_be)`
`u32(data, 'unsigned', 'little')`      | `data.unpack1(:uint32_le)`
`u32(data, 'unsigned', 'big')`         | `data.unpack1(:uint32_be)`
`u64(data, 'signed', 'little')`        | `data.unpack1(:int64_le)`
`u64(data, 'signed', 'big')`           | `data.unpack1(:int64_be)`
`u64(data, 'unsigned', 'little')`      | `data.unpack1(:uint64_le)`
`u64(data, 'unsigned', 'big')`         | `data.unpack1(:uint64_be)`
`unpack(data, 32, endian='little', sign=False)` | `data.unpack1(:uint32_le)`
`unpack(data, 32, endian='big', sign=False)` | `data.unpack1(:uint32_be)`
`unpack(data, 32, endian='little', sign=True)` | `data.unpack1(:int32_le)`
`unpack(data, 32, endian='big', sign=True)` | `data.unpack1(:int32_be)`
`unpack_many(data, 32, endian='little', sign=False)` | `data.unpack(:uint23_le)`
`unpack_many(data, 32, endian='big', sign=False)` | `data.unpack(:uint23_be)`
`unpack_many(data, 32, endian='little', sign=True)` | `data.unpack(:int23_le)`
`unpack_many(data, 32, endian='big', sign=True)` | `data.unpack(:int23_be)`

See the documentation for [Integer#pack] and [String#unpack] for more examples.

[Integer#pack]: https://ronin-rb.dev/docs/ronin-support/Integer.html#pack-instance_method
[String#unpack1]: https://ronin-rb.dev/docs/ronin-support/String.html#unpack1-instance_method
[String#unpack]: https://ronin-rb.dev/docs/ronin-support/String.html#unpack-instance_method

<div class="level">
  <div class="level-left">
    <a class="button" href="../python_to_ruby_ronin_ref/">
      &laquo; Porting Python to Ronin Quick Ref
    </a>
  </div>

  <div class="level-item">
    <a class="button" href="../">
      &#x2303; Porting
    </a>
  </div>

  <div class="level-right">
  </div>
</div>
