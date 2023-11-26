---
layout: post
title: Solving HackThisSite Programming Level 11 with Ronin
author: postmodern
tags:
  - ctf
  - writeup
  - hackthissite
  - ruby
  - ronin-support
---

[HackThisSite Programming Level 11] involves decoding a string of randomly
generated numbers using another randomly generated `Shift` number.
This [HackThisSite] level is a bit more difficult than the first one. Unlike the
other levels, it has a five second timer, which makes it almost impossible to
copy/paste the randomly generated numbers into a script and then copy/paste the
answer back into the form.

Now we could do something complex like use the new [ronin-web-browser] library
to control an instance of Chrome, login to [HackThisSite], navigate to the
challenge webpage, scrape the randomly generated numbers, compute the answer,
enter the answer into the form, and click the submit button. Luckily for us
[HackThisSite] is designed like a classical PHP webapp. There's no CSRF tokens,
no JWT, no client-side JavaScript rendering, etc, just a session ID set in the
session cookie. All we have to do is send the same HTTP requests that the
browser would send.

First, We will need to extract the session ID from the cookie in the browser.
To extract the session ID simply login to [HackThisSite] in a web browser,
open the JavaScript console and evaluate `document.cookie`.
The session ID will be the random characters after `HackThisSite=`.

Next we will need to write the Ruby script which will send an HTTP `GET` request
with our session cookie to the challenge page at `/missions/prog/11/`,
scrape the randomly generated numbers, calculate the answer, and then send an
HTTP `POST` request also with our session cookie to the form end-point at
`/missions/prog/11/index.php`.

For the script, we will use the [ronin-support] library which adds a bunch of
helper methods and makes performing HTTP requests much easier. Note
[ronin-support] is a dependency of [ronin] and should already be installed.

The solution to the challenge is basically to subtract the random `Shift`
number from each of the randomly generated numbers, then convert each resulting 
number to an ASCII character, and join the ASCII characters into a String.
Note however that the randomly generated numbers are separated by a random
non-numeric deliminator character, such as `%`, `"`, `$`, etc. In order to
extract only the numbers from the randomly generated string of numbers,
we can use the [String#scan] method with the `/\d+/` regex to return an Array
containing only the numeric strings.

```ruby
#!/usr/bin/env ruby
require 'ronin/support'
include Ronin::Support

# build the session cookie
session_id     = ENV['SESSION_ID']
session_cookie = "HackThisSite=#{session_id}"

# create a persistent HTTP connection to www.hackthissite.org:443
http = http_connect_uri('https://www.hackthissite.org', cookie: session_cookie)

# get the challenge page
response = http.get('/missions/prog/11/')

# check the response
unless response.code == '200'
  print_error "could not request webpage: HTTP #{response.code}"
  exit -1
end

# find the randomly generated numbers after "Generated String: "
unless (match = response.body.match(/Generated String:\s+([^<]+)/))
  print_error "could not find 'Generated String:' in response body"
  exit -1
end

# extract the randomly generated numbers
generated_string  = match[1]
generated_numbers = generated_string.scan(/\d+/).map(&:to_i)

# find the random Shift number
unless (match = response.body.match(/Shift:\s+(-?\d+)/))
  print_error "could not find 'Generated Shift:' in response body"
  exit -1
end

# extract the Shift number
shift = match[1].to_i

# debugging
print_info "Generated Numbers: #{generated_numbers.join(' ')}"
print_info "Shift: #{shift}"

# subtract Shift from each number, convert each number to a ASCII char, and join
shifted_numbers = generated_numbers.map { |number| number - shift }
decoded_ascii   = shifted_numbers.map(&:chr).join

# debugging
print_info "Answer: #{decoded_ascii}"

# submit the answer!
response = http.post('/missions/prog/11/index.php', referer:   'https://www.hackthissite.org/missions/prog/11/',
                                                    form_data: {solution: decoded_ascii})

# check the response
unless response.code == '200'
  print_error "failed to successfully submit the form: HTTP #{response.code}"
  exit -1
end

if response.body.include?('Sorry:')
  print_error "incorrect solution!"
  exit -1
else
  print_success "Congratz!"
end
```

Also note that the [HackThisSite] form end-point also expects a `Referer`
header.

To run the Ruby script:

```shell
export SESSION_ID="..."
ruby solution.rb
```

Which should print the following output:

```
[*] Generated Numbers: 36 40 70 57 30 29 69 62 32 28
[*] Shift: -17
[*] Answer: 59WJ/.VO1-
[+] Congratz!
```

Now, if you check your profile page shows, it should show that you have solved
`Programming: (11)`.

[HackThisSite]: https://hackthissite.org
[HackThisSite Programming Level 11]: https://www.hackthissite.org/missions/prog/11/
[String#scan]: https://rubydoc.info/stdlib/core/String#scan-instance_method
[ronin-web-browser]: https://github.com/ronin-rb/ronin-web-browser#readme
[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin]: https://github.com/ronin-rb/ronin#readme
