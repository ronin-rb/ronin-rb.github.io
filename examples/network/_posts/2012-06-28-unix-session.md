---
layout: null
title: Creating a UNIX Socket Session
---

Creating a UNIX Socket session, that will automatically be closed:

```ruby
unix_connect('/tmp/haproxy.stats.socket') do |socket|
  socket.puts("show stat")
  puts socket.readlines
end
```
