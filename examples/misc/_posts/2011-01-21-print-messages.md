---
layout: null
title: Print Messages
---

Print diagnostic messages:

```ruby
print_info "Senting data ..."
# [*] Sending data ..."

print_success "Data sent!"
# [+] Data sent!

print_error "Received invalid input: #{data}"
# [!] Received invalid input: "USER \xff\xff\xff\0"
```
