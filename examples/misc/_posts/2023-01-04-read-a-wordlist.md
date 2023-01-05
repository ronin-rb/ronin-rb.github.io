---
layout: null
title: Directory Traversal
---

Read a wordlist:

```ruby
wordlist = Wordlist.open('path/to/wordlist.txt')
wordlist.each do |word|
  # ...
end
```
