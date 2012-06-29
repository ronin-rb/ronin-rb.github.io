---
layout: nil
title: Create a FTP Session
---

Creating a FTP session which will automatically be closed:

{% highlight ruby %}
ftp_session('ftp.kernel.org') do |ftp|
  ftp.chdir('/pub')
  puts ftp.list
end
{% endhighlight %}
