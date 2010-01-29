---
layout: nil
title: Create a TCP Session
---

Creating a TCP session which will be automatically closed:

    Net.tcp_session('www.example.com', 1212) do |sock|
      sock.write("this is just a test\n")
      puts sock.readline
    end

