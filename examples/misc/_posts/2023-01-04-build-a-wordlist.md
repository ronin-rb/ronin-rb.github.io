---
layout: null
title: Directory Traversal
---

Build a wordlist:

```ruby
Wordlist::Builder.open('path/to/file.txt.gz') do |builder|
  builder.add(word)
  builder.append(words)
  builder.parse(text)
  builder.parse_file('path/to/text.txt')
end
```
