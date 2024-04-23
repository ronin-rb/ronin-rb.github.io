---
layout: post
title: Updated Docker Images
author: postmodern
tags:
  - docker
---

The [ronin docker images] have been updated to version 2.0.5.2 to fix issues
with missing dependencies.

* The missing `man-db` package was installed in all docker images to
  ensure that command's man-pages are properly displayed by the `help`
  command or a command's `--help` option.
* The missing `git` package was installed in all docker images for the
  `ronin-repos install` and `ronin-repos update` commands, which use `git`.
* The missing `zip` package was installed in all docker images for
  [Ronin::Support::Archive::Zip], which uses the `zip` and `unzip` commands to
  create and read `.zip` files.

To update the [ronin docker images], simply run:

```shell
docker pull roninrb/ronin
```

Enjoy!

[ronin docker images]: https://hub.docker.com/r/roninrb/ronin
[Ronin::Support::Archive::Zip]: https://ronin-rb.dev/docs/ronin-support/Ronin/Support/Archive/Zip.html
