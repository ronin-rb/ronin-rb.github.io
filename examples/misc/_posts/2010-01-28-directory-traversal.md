---
layout: nil
title: Directory Traversal
---

Traverse directories outside of a root directory:

{% highlight ruby %}
Path.up(7) / 'etc' / 'passwd'
# => #<Ronin::Path:../../../../../../../etc/passwd>
{% endhighlight %}
