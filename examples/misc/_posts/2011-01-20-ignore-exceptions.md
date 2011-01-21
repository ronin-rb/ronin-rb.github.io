---
layout: nil
title: Ignore Exceptions
---

Run a block of Ruby code, and ignore any exceptions:

{% highlight ruby %}
attempt do
  Resolv.getaddress(readline)
end
{% endhighlight %}
