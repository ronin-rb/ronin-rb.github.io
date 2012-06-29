---
layout: nil
title: Pack an Integer
---

Packing an Integer:

{% highlight ruby %}
0x1337.pack(:uint32_le)
# => "7\x13\0\0"
{% endhighlight %}
