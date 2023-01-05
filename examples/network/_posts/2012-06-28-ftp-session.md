---
layout: null
title: Create a FTP Session
---

Creating a FTP session which will automatically be closed:

```ruby
ftp_connect('ftp.kernel.org') do |ftp|
  ftp.chdir('/pub')
  puts ftp.list
end
```
