---
layout: nil
title: Creating a UNIX Socket Session
---

Creating a UNIX Socket session, that will automatically be closed:

{% highlight ruby %}
unix_session('/tmp/haproxy.stats.socket') do |socket|
  socket.puts("show stat")
  puts socket.readlines
end
{% endhighlight %}
