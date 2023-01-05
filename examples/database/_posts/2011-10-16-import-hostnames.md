---
layout: null
title: Import HostNames
---

Import host name from a text-file into the database:

```ruby
File.each_line('hosts.txt') do |host|
  Ronin::DB::HostName.import(host)
end
# => [...]
```
