---
layout: null
title: Import URLs
---

Import URLs from a text-file into the Database:

```ruby
File.each_line('urls.txt') do |url|
  Ronin::DB::URL.import(url)
end
```
