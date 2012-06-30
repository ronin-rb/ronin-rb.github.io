---
layout: nil
title: Receive UDP messages, infinitely
---

Listen on a port and receive UDP messages, infinitely:

{% highlight ruby %}
udp_server_loop(1337) do |server,(host,port),mesg|
  print_info "#{host}:#{port}"
  mesg.hexdump
end
{% endhighlight %}
