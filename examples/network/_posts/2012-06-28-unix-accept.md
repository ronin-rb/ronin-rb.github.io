---
layout: nil
title: Accept one UNIX Socket
---

Opens a UNIX Socket and accepts one connection:

{% highlight ruby %}
unix_accept('/tmp/race_condition.socket') do |socket|
  sockets.puts(buffer)
end
{% endhighlight %}
