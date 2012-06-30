---
layout: nil
title: Accept a TCP connection
---

Listen on a port and accept the first TCP connection:

{% highlight ruby %}
tcp_accept(1337) do |client|
  client.write(buffer)
end
{% endhighlight %}
