---
layout: nil
title: URL query params
---

Accessing the query parameters of a URL:

{% highlight ruby %}
url = URI('http://www.google.com/search?hl=en&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&hs=1HY&q=bob+ross&btnG=Search')
url.query_params
# => {"btnG"=>"Search", "hs"=>"1HY", "rls"=>"org.mozilla:en-US:official", "client"=>"firefox-a", "hl"=>"en", "q"=>"bob+ross"}
{% endhighlight %}
