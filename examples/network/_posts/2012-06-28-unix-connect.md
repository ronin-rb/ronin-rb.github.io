---
layout: nil
title: Connect to a UNIX Socket
---

Connecting to a UNIX Socket:

{% highlight ruby %}
unix_connect('/tmp/haproxy.stats.socket')
# => #<UNIXSocket:...>
{% endhighlight %}
