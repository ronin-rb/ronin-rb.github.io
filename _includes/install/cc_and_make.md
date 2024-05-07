### Build Dependencies

First we will need to install a C compiler ([gcc] or [clang]) and
[make][automake]. These are required to install gems which contain C extensions
(aka C bindings) to other C libraries, such as the [sqlite3 gem] which compiles
against [libsqlite3].

[gcc]: https://gcc.gnu.org/
[clang]: https://clang.llvm.org/
[automake]: https://www.gnu.org/software/automake/
[sqlite3 gem]: https://github.com/sparklemotion/sqlite3-ruby#readme
[libsqlite3]: https://www.sqlite.org/index.html
