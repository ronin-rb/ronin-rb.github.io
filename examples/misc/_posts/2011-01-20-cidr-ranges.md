---
layout: nil
title: CIDR Ranges
---

Enumerate through CIDR IP Ranges:

{% highlight ruby %}
IPAddr.new('10.1.1.1/24').each do |ip|
  # ...
end
{% endhighlight %}
