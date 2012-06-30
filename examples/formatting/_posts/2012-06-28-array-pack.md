---
layout: nil
title: Pack an Array
---

Packing an Array:

{% highlight ruby %}
[0x05, "hello"].pack(:uint16_be, :string)
# => "\x00\x05hello\x00"
{% endhighlight %}
