---
layout: nil
title: Extract IP addresses from Text
---

Extract IP addresses from Text:

{% highlight ruby %}
IPAddr.extract("One two 10.1.1.2 three")
# => ["10.1.1.2"]
{% endhighlight %}
