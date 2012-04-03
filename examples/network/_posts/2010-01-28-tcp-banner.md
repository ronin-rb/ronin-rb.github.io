---
layout: nil
title: Grabbing a Service banner
---

Grabbing the banner from a TCP service:

{% highlight ruby %}
tcp_banner('www.example.com',22)
# => "SSH-2.0-OpenSSH_4.3p2 Debian-8ubuntu1.4\n"
{% endhighlight %}
