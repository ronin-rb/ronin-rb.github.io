---
layout: nil
title: Connect to a SSL Socket
---

Create a SSL Socket to a specified host and port:

{% highlight ruby %}
socket = ssl_connect('github.com',443)
# => #<OpenSSL::SSL::SSLSocket:0x00000002f60458>
{% endhighlight %}
