---
layout: null
title: Create a UDP Session
---

Creating a UDP session which will be automatically closed:

```ruby
udp_connect('example.com',1212) do |socket|
  socket.write("PING")
  mesg, _ = socket.recv(1024)
  mesg.hexdump
end
```
