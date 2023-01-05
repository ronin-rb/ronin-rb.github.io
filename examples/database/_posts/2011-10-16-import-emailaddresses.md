---
layout: null
title: Import EmailAddresses
---

Import email addresses from a text-file into the database:

```ruby
File.each_line('emails.txt') do |email|
  Ronin::DB::EmailAddress.import(email)
end
# => [...]
```
