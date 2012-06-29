---
layout: nil
title: Unpack a String
---

Unpacking a String:

{% highlight ruby %}
"\x00\x05hello\x00".unpack(:uint16_be, :string)
# => [5, "hello"]
{% endhighlight %}
