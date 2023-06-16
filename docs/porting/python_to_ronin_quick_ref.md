---
layout: page
title: Porting Python to Ronin Quick Ref
---

# Porting Python to Ronin Quick Ref

## Table of Contents

* [Literals](#literals)
* [Statements](#statements)
* [Exception Handling](#exception-handling)
* [Functions](#functions)
* [Classes](#classes)
* [Built-in Functions](#built-in-functions)
* [String Methods](#string-methods)
* [List Methods](#list-methods)
* [Dict Methods](#dict-methods)
* [Set Methods](#set-methods)
* [File Methods](#file-methods)
* [Datetime Methods](#datetime-methods)
* [Sockets](#sockets)
* [HTTP](#http)

## Literals

Python                                 | Ruby
---------------------------------------|----------------------------------------
`None`                                 | `nil`
`True`                                 | `true`
`False`                                | `false`
`123`                                  | `123`
`1_000`                                | `1_000`
`0b110` (binary)                       | `0b110`
`0o777` (octal)                        | `0777`
`0xff` (hexadecimal)                   | `0xff`
`"hello world"`                        | `"hello world"` / `'hello world'`
`f"x = {}".format(var)`                | `"x = #{var}"`
`b"\x41\x42\x43"`                      | `"\x41\x42\x43"` / `"\x41\x42\x43".b`
`"""hello world"""`                    | `%{hello world}`
`'''hello world'''`                    | `%{hello world}`
`r"[0-9a-f]+"`                         | `/[0-9a-f]+/`
`[1,2,3]`                              | `[1,2,3]`
`["a", "b", "c"]`                      | `['a', 'b', 'c']` / `%w[a b c]`
`(1,2,3)`                              | `[1,2,3]`
`{1, 2, 3}`                            | `Set[1,2,3]`
`{"a": 1}`                             | `{"a" => 1}` / `{a: 1}`
`x = lambda a : a + 10`                | `x = ->(a) { a + 10 }`

## Operators

### Boolean

Python                                 | Ruby
---------------------------------------|----------------------------------------
`condition1 and condition2`            | `condition1 && condition2`
`condition1 or condition2`             | `condition1 || condition2`
`not condition`                        | `!condition`

### Comparison

Python                                 | Ruby
---------------------------------------|----------------------------------------
`x == y`                               | `x == y`
`x != y`                               | `x != y`
`x > y`                                | `x > y`
`x >= y`                               | `x >= y`
`x < y`                                | `x < y`
`x <= y`                               | `x <= y`

### Arithmetic

Python                                 | Ruby
---------------------------------------|----------------------------------------
`x + y`                                | `x + y`
`x - y`                                | `x - y`
`x * y`                                | `x * y`
`x / y`                                | `x / y.to_f` / `x.fdiv(y)`
`x // y`                               | `x / y`
`x % y`                                | `x % y`
`x ** y`                               | `x ** y`
`x = y`                                | `x = y`
`x += y`                               | `x += y`
`x -= y`                               | `x -= y`
`x *= y`                               | `x *= y`
`x /= y`                               | `x /= y.to_f`
`x //= y`                              | `x /= y`
`x %= y`                               | `x %= y`
`x **= y`                              | `x **= y`

### Bitwise

Python                                 | Ruby
---------------------------------------|----------------------------------------
`x & y`                                | `x & y`
`x | y`                                | `x | y`
`x ^ y`                                | `x ^ y`
`~x`                                   | `~x`
`x &= y`                               | `x &= y`
`x |= y`                               | `x |= y`
`x ^= y`                               | `x ^= y`
`x <<= y`                              | `x <<= y`
`x >>= y`                              | `x >>= y`

### Indexing

Python                                 | Ruby
---------------------------------------|----------------------------------------
`indexable[1]`                         | `array[1]`
`indexable[-1]`                        | `array[-1]`
`indexable[1:3]`                       | `array[1,2]` / `array[1...3]`
`indexable[:2]`                        | `array[0,2]` / `array[...2]`
`indexable[1:5:2]`                     | `array[(1...5).step(2)]`

## Statements

<table>
  <thead>
    <tr>
      <td>Python</td>
      <td>Ruby</td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <pre>if condition:
    statement1
    statement2
</pre>
      </td>
      <td>
        <pre>if condition
  statement1
  statement2
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>if condition:
    statement1
    statement2
else:
    statement3
    statement4</pre>
      </td>
      <td>
        <pre>if condition
  statement1
  statement2
else
  statement3
  statement4
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>if condition:
    statement1
    statement2
elif:
    statement3
    statement4
else:
    statement5
    statement6</pre>
      </td>
      <td>
        <pre>if condition
  statement1
  statement2
elsif
  statement3
  statement4
else:
  statement5
  statement6
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>if "pattern" in string:
    # ...</pre>
      </td>
      <td>
        <pre>if string.include?("pattern")
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>for x in list:
    # ...</pre>
      </td>
      <td>
        <pre>list.each do |x|
  # ...</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>while True:
    statement1
    statement2</pre>
      </td>
      <td>
        <pre>loop do
  statement1
  statement2
end</pre>
      </td>
    </tr>
  </tbody>
</table>

## Exception Handling

<table>
  <thead>
    <tr>
      <td>Python</td>
      <td>Ruby</td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <pre>try:
    # ...
except:
    # ...</pre>
      </td>
      <td>
        <pre>begin
  # ...
rescue
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>try:
    # ...
except FooError as err:
    # ...</pre>
      </td>
      <td>
        <pre>begin
  # ...
rescue FooError => error
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>try:
    # ...
except FooError:
    # ...
except:
    # ...</pre>
      </td>
      <td>
        <pre>begin
  # ...
rescue FooError
  # ...
rescue
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>try:
    # ...
finally:
    # ...</pre>
      </td>
      <td>
        <pre>begin
  # ...
ensure
  # ...
end</pre>
      </td>
    </tr>
  </tbody>
</table>

## Functions

<table>
  <thead>
    <tr>
      <td>Python</td>
      <td>Ruby</td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <pre>def myfunc():
    # ...</pre>
      </td>
      <td>
        <pre>def myfunc
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>def myfunc(x):
    # ...</pre>
      </td>
      <td>
        <pre>def myfunc(x)
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>def myfunc(x, y):
    # ...</pre>
      </td>
      <td>
        <pre>def myfunc(x,y)
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>def myfunc(x, y = 1):
    # ...</pre>
      </td>
      <td>
        <pre>def myfunc(x,y=1)
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>def myfunc(*args):
    # ...</pre>
      </td>
      <td>
        <pre>def myfunc(*args)
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>def myfunc(**kwargs):
    # ...</pre>
      </td>
      <td>
        <pre>def myfunc(**kwargs)
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>def myfunc():
    pass</pre>
      </td>
      <td>
        <pre>def myfunc
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>def myfunc():
    return 42</pre>
      </td>
      <td>
        <pre>def myfunc
  42
end</pre>
      </td>
    </tr>
  </tbody>
</table>

## Functions

<table>
  <thead>
    <tr>
      <td>Python</td>
      <td>Ruby</td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <pre>class Foo:
    # ...</pre>
      </td>
      <td>
        <pre>class Foo
  # ...
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>class Foo:
    def myfunc(self)
        # ...</pre>
      </td>
      <td>
        <pre>class Foo
  def myfunc
    # ...
  end
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>class Foo:
    def __init__(self,name):
        self.name = name</pre>
      </td>
      <td>
        <pre>class Foo
  attr_reader :name
  def initialize(name)
    @name = name
  end
end</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>class Foo(SuperClass):
    # ...</pre>
      </td>
      <td>
        <pre>class Foo < SuperClass
  # ...
end</pre>
      </td>
    </tr>
  </tbody>
</table>

## Built-in Functions

Python                                 | Ruby
---------------------------------------|----------------------------------------
`abs(int)`                             | `int.abs`
`all(list)`                            | `array.all?`
`any(list)`                            | `array.any?`
`ascii(str)`                           | `string.dump`
`bin(int)`                             | `int.to_s(2)`
`chr(0x41)`                            | `0x41.chr`
`complex(n,i)`                         | `Complex(n,i)`
`datetime.datetime.now()`              | `DateTime.now`
`dict()`                               | `{}`
`dict(foo = "bar")`                    | `{foo: "bar"}`
`dict()`                               | `{}` / `Hash.new`
`divmod(i,j)`                          | `i % j`
`enum = enumerate(tuple)`              | `enum = array.each`
`filter(myFunc,list)`                  | `array.filter { |elem| ... }`
`input()`                              | `readline`
`int(n)`                               | `n.to_i` / `Integer(n)`
`isinstance(obj, MyClass)`             | `obj.kind_of?(MyClass)` / `obj.is_a?(MyClass)`
`issubclass(ClassA, ClassB)`           | `ClassA < ClassB`
`iter = iter(list)`                    | `enum = array.each`
`len(list)`                            | `array.length`
`list()`                               | `[]`
`list((1,2,3))`                        | `[1,2,3]`
`list()`                               | `[]` / `Array.new`
`list(var)`                            | `Array(var)`
`map(myFunc,list)`                     | `array.map { |elem| ... }`
`max(i,j)`                             | `[i,j].max`
`min(i,j)`                             | `[i,j].min`
`next(enum)`                           | `enum.next`
`object()`                             | `Object.new`
`oct(n)`                               | `n.to_s(8)`
`ord(string)`                          | `string.ord`
`pow(2,3)`                             | `2 ** 3`
`print("...")`                         | `puts "..."`
`print(var)`                           | `puts var`
`range(10)`                            | `0...10`
`range(1,10)`                          | `1...10`
`range(1,10,2)`                        | `(1...10).step(2)`
`reversed(list)`                       | `array.reverse`
`round(f,2)`                           | `f.round(2)`
`set((1,2,3))`                         | `Set[1,2,3]`
`set()`                                | `Set.new`
`set()`                                | `Set.new` / `Set[]`
`str(obj)`                             | `obj.to_s`
`sum(list)`                            | `array.sum`
`time.localtime()`                     | `Time.now`
`tuple((1,2,3))`                       | `[1,2,3]`
`tuple.slice(length)`                  | `array.slice(0,length)` / `array[0,length]`
`tuple.slice(start,length)`            | `array.slice(start,length)` / `array[start,length]`
`type(obj)`                            | `obj.class`
`zip(list1,list2)`                     | `array1.zip(array2)`

## String Methods

Python                                 | Ruby
---------------------------------------|----------------------------------------
`string.capitalize()`                  | `string.capitalize`
`string.center(20)`                    | `string.center(20)`
`string.encode(encoding="ascii")`      | `string.encode(Encoding::ASCII_8BIT)`
`string.endswith(suffix)`              | `string.end_with?(suffix)`
`string.expandtabs(n)`                 | `string.gsub("\t", ' ' * n)`
`string.find(substr)`                  | `string.index(substr)`
`string.format(...)`                   | `string % [...]` / `format(string, ...)`
`string.index(substr)`                 | `string.index(substr)`
`string.isalnum()`                     | `string.alpha_numeric?`
`string.isalpha()`                     | `string.alpha?`
`string.isascii()`                     | `string.ascii?`
`string.isdigit()`                     | `string.numeric?`
`string.islower()`                     | `string.lowercase_alpha?`
`string.isprintable()`                 | `string.printable?`
`string.isspace()`                     | `string.space?`
`string.isupper()`                     | `string.uppercase_alpha?`
`string.join(list)`                    | `array.join(string)`
`string.ljust(20)`                     | `string.ljust(20)`
`string.lower()`                       | `string.downcase`
`string.lstrip()`                      | `string.lstrip`
`string.replace(str1,str2)`            | `string.sub(str1,str2)`
`string.rfind(substr)`                 | `string.rindex(substr)`
`string.rindex(substr)`                | `string.rindex(substr)`
`string.rjust(20)`                     | `string.rjust(20)`
`string.rstrip()`                      | `string.rstrip`
`string.splitlines()`                  | `string.lines`
`string.startswith(prefix)`            | `string.start_with?(prefix)`
`string.strip()`                       | `string.strip`
`string.translate(charTable)`          | `string.tr("\x41\x42...", "\xXX\xXX...")` / `string.gsub(/[ABC]/, {'A' => 'X', 'B' => 'Y', 'C' => 'Z'})`
`string.upper()`                       | `string.upcase`
`string.zfill(20)`                     | `string.rjust(20,'0')`
`"x = %x" % var`                       | `"x = %x" % [var]` / `format("x = %x",var)`

See the documentation of [String] for more available methods.

[String]: https://rubydoc.info/stdlib/core/String

## RegEx Methods

Python                                 | Ruby
---------------------------------------|----------------------------------------
`import re`                            | N/A
`re.compile("[0-9a-f]+")`              | `/[0-9a-f]+/` / `Regexp.new("...")`
`re.search("[0-9a-f]+",string)`        | `string.match(/[0-9a-f]+/)`
`re.findall("[0-9a-f]+",string)`       | `string.scan(/[0-9a-f]+/)`
`re.split("\s",string)`                | `string.split(/\s/)`
`re.split("\s",string,2)`              | `string.split(/\s/,2)`
`re.sub("\s",'_',string)`              | `string.gsub(/\s/,'_')`

See the documentation of [String] and [Regexp] for more available methods.

[String]: https://rubydoc.info/stdlib/core/String
[Regexp]: https://rubydoc.info/stdlib/core/Regexp

## List Methods

Python                                 | Ruby
---------------------------------------|----------------------------------------
`list.append(value)`                   | `array.append(value)` / `array << value`
`list.clear()`                         | `array.clear`
`list.count(value)`                    | `array.count(value)`
`list.copy()`                          | `array.dup`
`list1.extend(list2)`                  | `array1.concat(array2)`
`list.index(value)`                    | `array.index(value)`
`list.pop(index)`                      | `array.delete_at(index)`
`list.remove(value)`                   | `array.delete(value)`
`list.reverse()`                       | `array.reverse`
`list.sort()`                          | `array.sort`

See the documentation of [Array] for more available methods.

[Array]: https://rubydoc.info/stdlib/core/Array

## Dict Methods

Python                                 | Ruby
---------------------------------------|----------------------------------------
`dict.clear()`                         | `hash.clear`
`dict.copy()`                          | `hash.dup`
`dict.get(key)`                        | `hash[key]`
`dict.items()`                         | `hash.to_a`
`dict.keys()`                          | `hash.keys`
`dict.pop(key)`                        | `hash.delete(key)`
`dict.setdefault(key,default)`         | `hash.fetch(key,default)`
`dict1.update(dict2)`                  | `hash1.merge!(hash2)`
`dict.values()`                        | `hash.values`

See the documentation of [Hash] for more available methods.

[Hash]: https://rubydoc.info/stdlib/core/Hash

## Set Methods

Python                                 | Ruby
---------------------------------------|----------------------------------------
`set.add(value)`                       | `set.add(value)` / `set << value`
`set.clear()`                          | `set.clear`
`set.copy()`                           | `set.dup`
`set1.difference(set2)`                | `set1.difference(set2)` / `set1 - set2`
`set1.difference_update(set2)`         | `set1 -= set2`
`set.discard(value)`                   | `set.subtract(value)`
`set1.intersection(set2)`              | `set1.intersection(set2)` / `set1 & set2`
`set.intersection_update(set2)`        | `set1 &= set2`
`set1.isdisjoint(set2)`                | `set1.disjoint?(set2)`
`set1.issubset(set2)`                  | `set1.subset?(set2)`
`set1.issuperset(set2)`                | `set1.superset?(set2)`
`set.remove(value)`                    | `set.delete(value)`
`set1.union(set2)`                     | `set1.union(set2)` / `set1 | set2`
`set1.update(set2)`                    | `set1.merge(set2)`

See the documentation of [Set] for more available methods.

[Set]: https://rubydoc.info/stdlib/set/Set

## File Methods

Python                                 | Ruby
---------------------------------------|----------------------------------------
`file.close()`                         | `file.close`
`file.fileno()`                        | `file.fileno`
`file.flush()`                         | `file.flush`
`file.isatty()`                        | `file.tty?` / `file.isatty`
`file.read()`                          | `file.read`
`file.readline()`                      | `file.readline`
`file.readlines()`                     | `file.readlines`
`file.seek(pos)`                       | `file.seek(pos)`
`file.tell()`                          | `file.tell` / `file.pos`
`file.truncate(20)`                    | `File.truncate(path,20)`
`file.write(string)`                   | `file.write(string)`
`file.writelines([...])`               | `file.puts(...)` / `file.puts(lines)`

See the documentation of [File] for more available methods.

[File]: https://rubydoc.info/stdlib/core/Hash

## Datetime Methods

Python                                 | Ruby
---------------------------------------|----------------------------------------
`import datetime`                      | `require 'time'` / `require 'date'`
`datetime.datetime.now()`              | `Time.now` / `DateTime.now`
`datetime.date.today()`                | `Date.today`
`datetime.strptime(string,fmt)`        | `Time.strptime(string,fmt)` / `DateTime.strptime(string, fmt)` / `Date.strptime(string,fmt)`
`datetime.strftime(fmt)`               | `time.strftime(fmt)` / `date_time.strftime(fmt)` / `date.strftime(fmt)`

See the documentation of [Time], [Date], and [DateTime] for more available
methods.

[Time]: https://rubydoc.info/stdlib/core/Time
[Date]: https://rubydoc.info/stdlib/date/Date
[DateTime]: https://rubydoc.info/stdlib/date/DateTime

## Sockets

<table>
  <thead>
    <tr>
      <td>Python</td>
      <td>Ruby</td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <code>import socket</code>
      </td>
      <td>
        <pre>require 'ronin/support/network/tcp/mixin'
include Ronin::Support::Network::TCP::Mixin</pre>
      </td>
    </tr>
    <tr>
      <td>
        <pre>s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((ip, port))</pre>
      </td>
      <td>
        <code>s = tcp_connect(host,port)</code>
      </td>
    </tr>
    <tr>
      <td>
        <pre>s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(("127.0.0.1",1337))
s.listen(4)
conn, addr = s.accept()</pre>
      </td>
      <td>
        <code>client = tcp_accept(host,port)</code>
      </td>
    </tr>
    <tr>
      <td>
        <code>s.recv(1024)</code>
      </td>
      <td>
        <code>s.recv(1024)</code>
      </td>
    </tr>
    <tr>
      <td>
        <code>s.send(b"...")</code>
      </td>
      <td>
        <code>s.send("...")</code>
      </td>
    </tr>
    <tr>
      <td>
        <code>s.close()</code>
      </td>
      <td>
        <code>s.close</code>
      </td>
    </tr>
  </tbody>
</table>

See the documentation of [Ronin::Support::Network::TCP::Mixin] and
[Ronin::Support::Network::UDP::Mixin] for more methods.

[Ronin::Support::Network::TCP::Mixin]: /docs/ronin-support/Ronin/Support/Network/TCP/Mixin.html
[Ronin::Support::Network::UDP::Mixin]: /docs/ronin-support/Ronin/Support/Network/UDP/Mixin.html

## HTTP

<table>
  <thead>
    <tr>
      <td>Python</td>
      <td>Ruby</td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <code>import requests</code>
      </td>
      <td>
        <pre>require 'ronin/support/network/http/mixin'
include Ronin::Support::Network::HTTP::Mixin</pre>
      </td>
    </tr>
    <tr>
      <td>
        <code>response = requests.get(url)</code>
      </td>
      <td>
        <code>response = http_get(url)</code>
      </td>
    </tr>
    <tr>
      <td>
        <code>response = requests.get(url, params=params)</code>
      </td>
      <td>
        <code>response = http_get(url, query_params: params)</code>
      </td>
    </tr>
    <tr>
      <td>
        <code>response = requests.get(url, data=data)</code>
      </td>
      <td>
        <code>response = http_get(url, form_data: data)</code>
      </td>
    </tr>
    <tr>
      <td>
        <code>response = requests.get(url, headers=headers)</code>
      </td>
      <td>
        <code>response = http_get(url, headers: headers)</code>
      </td>
    </tr>
    <tr>
      <td>
        <pre>sess = requests.Session()
response = sess.get(url)</pre>
      </td>
      <td>
        <pre>http = http_connect(host,port) # or http_connect_uri(base_uri)
response = http.get(path)</pre>
      </td>
    </tr>
  </tbody>
</table>

See the documentation for [Ronin::Support::Network::HTTP::Mixin] for more
methods.

[Ronin::Support::Network::HTTP::Mixin]: /docs/ronin-support/Ronin/Support/Network/HTTP/Mixin.html

<div class="level">
  <div class="level-left">
  </div>

  <div class="level-item">
    <a class="button" href="index.html">
      &#x2303; Porting
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="pwnlib_to_ronin_quick_ref.html">
      Porting Pwnlib to Ronin Quick Ref &raquo;
    </a>
  </div>
</div>
