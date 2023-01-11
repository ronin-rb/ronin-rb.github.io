---
layout: post
title: ronin-db 0.1.0.beta2 and ronin 2.0.0.beta3 released
author: postmodern
tags:
  - beta
  - ronin
  - ronin-db
  - sqlite3
---

[ronin-db][ronin-db] [0.1.0.beta2][ronin-db-0.1.0.beta2] and
[ronin][ronin] [2.0.0.beta3][ronin-2.0.0.beta3] have been released. These new
beta versions fix a dependency issue with [ronin-db] which prevented it from
connecting to the default [sqlite3] database.

To update the installed beta gems, simply run:

```shell
gem update ronin --pre
```

The [docker images] have also been updated. To update the docker images,
simply run:

```shell
docker pull roninrb/ronin
```

Keep beta testing!

[ronin]: https://github.com/ronin-rb/ronin#readme
[ronin-db]: https://github.com/ronin-rb/ronin-db#readme

[ronin-2.0.0.beta3]: https://rubygems.org/gems/ronin/versions/2.0.0.beta3
[ronin-db-0.1.0.beta2]: https://rubygems.org/gems/ronin-db/versions/0.1.0.beta2

[sqlite3]: https://www.sqlite.org/index.html
