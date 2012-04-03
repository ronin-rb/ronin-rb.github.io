---
layout: nil
title: Create a SSL Session
---

Creating a SSL session which will be automatically closed:

{% highlight ruby %}
ssl_session('github.com',443) do |socket|
  socket.write("GET /\r\n")
  puts socket.read
end
{% endhighlight %}
