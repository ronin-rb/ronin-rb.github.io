---
layout: null
title: Fuzzing a file
---

Fuzzing a file:

```shell
$ ronin-fuzzer fuzz -i request.txt -o bad.txt -r unix_path:bad_strings
```
