---
layout: nil
title: Zlib Inflate
---

Zlib inflate a String:

{% highlight ruby %}
"x\x9c+NM.J-\x01\0\b\xd1\x02\x87AAAAAAA".zlib_inflate
# => "secret"
{% endhighlight %}
