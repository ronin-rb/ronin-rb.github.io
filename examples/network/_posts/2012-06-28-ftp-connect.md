---
layout: nil
title: Connect to an FTP Server
---

Connecting to an FTP Server:

{% highlight ruby %}
ftp_connect('www.example.com', :user => 'joe', :password => 'secret')
# => #<Net::FTP:...>
{% endhighlight %}
