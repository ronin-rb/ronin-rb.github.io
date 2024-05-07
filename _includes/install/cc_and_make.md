### Build Dependencies

First we will need to install a C compiler ([gcc] or [clang]) and
[make][automake]. These are required to install certain ruby gems, which
contain C extensions (aka C bindings) to other C libraries, such as the
[nokogiri], [sqlite3], and [nio4r] gems.

[gcc]: https://gcc.gnu.org/
[clang]: https://clang.llvm.org/
[automake]: https://www.gnu.org/software/automake/
[nokogiri]: https://github.com/sparklemotion/nokogiri#readme
[sqlite3]: https://github.com/sparklemotion/sqlite3-ruby#readme
[nio4r]: https://github.com/socketry/nio4r#readme
