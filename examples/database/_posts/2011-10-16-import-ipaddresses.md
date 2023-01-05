---
layout: null
title: Import IPAddresses
---

Import IP address from a text-file into the database:

```ruby
File.each_line('ips.txt') do |ip|
  Ronin::DB::IPAddress.import(ip)
end
```
