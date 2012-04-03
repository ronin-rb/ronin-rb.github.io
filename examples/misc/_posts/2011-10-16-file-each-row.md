---
layout: nil
title: File.each_row
---

Process rows of data from a text file:

{% highlight ruby %}
File.each_row('passwords.txt', ',') do |user,password|
  # ...
end
{% endhighlight %}
