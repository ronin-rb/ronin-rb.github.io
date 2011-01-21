---
layout: nil
title: Characters
---

Work with Character Classes:

{% highlight ruby %}
Chars.hexadecimal
# => #<Chars::CharSet: {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "a", "b", "c", "d", "e", "f"}>

(Chars.printable - Chars.alpha_numeric).bytes
# => [32, 33, 34, 39, 40, 41, 44, 45, 46, 58, 59, 63, 91, 93, 96, 123, 125, 126, 35, 36, 37, 38, 42, 43, 47, 60, 61, 62, 64, 92, 94, 95, 124, 9, 10, 11, 12, 13]
{% endhighlight %}
