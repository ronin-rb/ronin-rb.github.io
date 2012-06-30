---
layout: nil
title: Create a UDP Session
---

Creating a UDP session which will be automatically closed:

{% highlight ruby %}
udp_session('example.com',1212) do |socket|
  socket.write("PING")
  mesg, _ = socket.recv(1024)
  mesg.hexdump
end
{% endhighlight %}
