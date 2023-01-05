---
layout: null
title: Create a SSL Session
---

Creating a SSL session which will be automatically closed:

```ruby
ssl_connect('github.com',443) do |socket|
  socket.write("GET /\r\n")
  puts socket.read
end
```
