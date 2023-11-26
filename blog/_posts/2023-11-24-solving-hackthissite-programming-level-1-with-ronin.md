---
layout: post
title: Solving HackThisSite Programming Level 1 with Ronin
author: postmodern
tags:
  - ctf
  - writeup
  - hackthissite
  - wordlist
  - ruby
---

[HackThisSite Programming Level 1] gives you a link to a [wordlist.zip] file
and a list of scrambled words. Your task is to translate the scrambled words
back into their original words from the wordlist.

```
This level is about unscrambling words.

Find the original (unscrambled) words, which were randomly taken from a wordlist.<--
Send a comma separated list of the original words, in the same order as in the list below.


You have 30 seconds time to send the solution.
List of scrambled words:   	
* onraold
* sxwzqa
* rynoelsd
* rtokenw
* reauli
* yekuslb
* sfufyrc
* pa1yph
* mnyrila
* ppeenoel
```

First we must download the [wordlist.zip] file.

Next we will write a Ruby script that reads the wordlists, build a lookup table,
read in the scrambled words, translate them, and print the correctly formatted
answer. To read the wordlist file, we will use [wordlist][wordlist.rb] Ruby
library which can read compressed wordlist zip archives directly. Note that
[wordlist][wordlist.rb] is a dependency of [ronin], so it should already be
installed.

```ruby
#!/usr/bin/env ruby

require 'wordlist'

#
# Takes a word and sorts it's characters.
#
def sorted(word)
  word.chars.sort.join
end

wordlist = Wordlist.open('wordlist.zip')
sorted_words = {}

# build the lookup table
wordlist.each do |word|
  sorted_words[sorted(word)] = word
end

# read input until EOF
input = readlines(chomp: true)

# translate the input
answer = input.map { |scrambled_word|
  sorted_words[sorted(scrambled_word)]
}.join(',')

# print the answer
puts answer
```

Running the script and copy/pasting the random scrambled words gives us the
answer:

```
$ ruby unsort_words.rb 
onraold
sxwzqa
rynoelsd
rtokenw
reauli
yekuslb
sfufyrc
pa1yph
mnyrila
ppeenoel
^D
orlando,qwaszx,reynolds,network,laurie,bluesky,scruffy,happy1,marilyn,penelope
```

Finally, copy/paste the answer into the text box and click Submit.

[ronin]: https://github.com/ronin-rb/ronin#readme
[HackThisSite]: https://hackthissite.org/
[HackThisSite Programming Level 1]: https://www.hackthissite.org/missions/prog/1/
[wordlist.rb]: https://github.com/postmodern/wordlist.rb#readme
[wordlist.zip]: https://www.hackthissite.org/missions/prog/1/wordlist.zip
