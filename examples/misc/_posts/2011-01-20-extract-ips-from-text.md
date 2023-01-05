---
layout: null
title: Extract IP addresses from Text
---

Extract IP addresses from Text:

```ruby
Ronin::Support::Network::IP.extract("One two 10.1.1.2 three")
# => ["10.1.1.2"]
```
