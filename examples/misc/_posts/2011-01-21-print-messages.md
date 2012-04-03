---
layout: nil
title: Print Messages
---

Print diagnostic messages:

    >> print_info "Successfully sent data."
    [-] Successfully send data.

    >> print_error "Received invalid input: %p", input
    [!] Received invalid input: "USER \xff\xff\xff\0"

