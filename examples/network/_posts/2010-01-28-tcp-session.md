---
layout: nil
title: Create a TCP Session
---

Creating a TCP session which will be automatically closed:

{% highlight ruby %}
tcp_session('www.example.com',1212) do |socket|
  socket.write("this is just a test\n")
  puts socket.readline
end
{% endhighlight %}
