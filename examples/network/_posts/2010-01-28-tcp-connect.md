---
layout: nil
title: Connect to a TCP Socket
---

Creating a TCP Socket to a specified host and port:

{% highlight ruby %}
socket = tcp_connect('www.example.com',25)
# => #<TCPSocket:0xb7bbde6c>
{% endhighlight %}
