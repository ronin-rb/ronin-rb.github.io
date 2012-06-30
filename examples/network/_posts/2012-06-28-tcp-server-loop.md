---
layout: nil
title: Accept TCP connections, infinitely
---

Listen on a TCP port and accept connections, infinitely:

{% highlight ruby %}
tcp_server_loop(1337) do |client|
  client.write(buffer)
end
{% endhighlight %}
