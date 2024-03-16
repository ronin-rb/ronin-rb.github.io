---
layout: post
title: Stop wasting your time on annoying CTF challenges!
author: postmodern
tags:
  - ctf
  - ronin
  - cryptography
  - base64
  - xor
  - spoilers
---

The other day I spotted someone in [nahamsec]'s Discord server struggling with
a CTF challenge that involved decoding an encrypted string. They had already
tried [CyberChef], but no luck. Other users encouraged them to
"try harder".

They were trying to decrypt the following string:

```
pai1nYPe3tLR1IOH1YKH14XegtCDgtSH1oKAgNGF34eH19bSmw==
```

Clearly it looks base64 encoded, but if you base64 decode the string you get
binary data. The user said that the challenge hinted that the string was
XOR encrypted and the plain-text was of the form `CNS{md5hash}`.

Using the `ronin irb` console I was able to easily solve this in *one line of
Ruby*:

```ruby
Chars.ascii.map { |key| "pai1nYPe3tLR1IOH1YKH14XegtCDgtSH1oKAgNGF34eH19bSmw==".
base64_decode.xor(key) }.find { |text| text.start_with?('CNS{') }
```

Starting with the assumption that the CTF challenge probably used an XOR
encryption key of a single ASCII character, all we have to do is bruteforce
decrypt the base64 decoded string using every possible character in the ASCII
character set, then find the decrypted string that starts with `CNS{`.

Running the above code gives us the answer:

```
CNS{e88472ea3da1c8d6ed2a0dff7c9aa104}
```

That's it!

You don't have to "try harder", just use [Ronin](/install/)!

[nahamsec]: https://nahamsec.com/
[CyberChef]: https://cyberchef.org/
