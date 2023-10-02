---
layout: page
title: Ruby Quick Ref
---

# Ruby Quick Ref

## Table of Contents

* [Literal Values](#literal-values)
* [Variables](#variables)
* [Operators](#operators)
  * [Boolean](#boolean)
  * [Comparison](#comparison)
  * [Arithmetic](#arithmetic)
  * [Bitwise](#bitwise)
* [Printing](#printing)
* [Statements](#statements)
* [Exception Handling](#exception-handling)
* [Conversion Methods](#conversion-methods)
* [Coercion Methods](#coercion-methods)
* [String Methods](#string-methods)
* [Array Methods](#array-methods)
* [Enumerable Methods](#enumerable-methods)
* [Classes](#classes)
* [Methods](#methods)
* [See Also](#see-also)

## Literal Values

----------------------------------------|---------------------------------------
`nil`                                   | Null object
`true`                                  | Boolean true object
`false`                                 | Boolean false object
`42`                                    | decimal Integer literal
`0x41`                                  | hexadecimal Integer literal
`0777`                                  | octal Integer literal
`0b1000`                                | binary Integer literal
`:foo`                                  | Symbol literal
`'foo'`                                 | plain String literal
`"foo\n"`                               | String literal with escape characters
`"foo #{var}"`                          | String interpolation
`%{foo "bar"}`                          | String literal with quote characters
`/[a-z][a-z0-9]*/`                      | Regular expression literal
`[1, 2, 'a', 'b']`                      | Array literal
`%w[foo bar baz]`                       | same as ["foo", "bar", "baz"]
`1..100`                                | Range literal
`{'a' => 1, 'b' => 2}`                  | Hash literal
`{a: 1, b: 2}`                          | Symbol Hash literal

## Variables

----------------------------------------|---------------------------------------
`var = 42`                              | assign a local variable
`var`                                   | reads a local variable
`@var = 42`                             | assign an instance variable
`@var`                                  | reads an instance variable

## Operators

### Boolean

----------------------------------------|---------------------------------------
`var`          | is `true` or another Object besides `false` or `nil`
`!var`         | is `nil` or `false`

### Comparison

---------------|----------------------------------------------------------------
`var1 == var2` | equal to
`var1 != var2` | not equal
`var1 > var2`  | greater than
`var1 >= var2` | greater than or equal to
`var1 < var2`  | less than
`var1 <= var2` | less than or equal to

### Arithmetic

-----------|--------------------------------------------------------------------
`int + 1`  | addition
`int - 1`  | subtraction
`int * 2`  | multiplication
`int / 2`  | division
`int % 2`  | modulus
`int ** 2` | power

### Bitwise

---------------|----------------------------------------------------------------
`int & 0xff`   | bitwise AND
`int | 0xff`   | bitwise OR
`int ^ 0xff`   | bitwise XOR
`int << 8`     | bitwise logical shift left (also often an alias for append)
`int >> 8`     | bitwise logical shift right
`int &= 0xff`  | bitwise AND and assign
`int |= 0xff`  | bitwise OR and assign
`int ^= 0xff`  | bitwise XOR and assign
`int <<= 8`    | bitwise logical shift left and assign
`int >>= 8`    | bitwise logical shift right and assign
`~int`         | bitwise invert

## Printing

--------------------|-----------------------------------------------------------
`puts "Hello World" | Prints the string to stdout with a newline
`print "prompt> "`  | Prints the string to stdout *without* a newline
`puts obj`          | Converts the object to a String then prints it to stdout
`p obj`             | Prints the inspected object to stdout
`pp obj`            | Pretty-prints the object to stdout

## Statements

<table>
  <tbody>
    <tr>
      <td width="50%">
        <pre>if condition
  # ...
end</pre>
        <code>single_line_statement if condition</code>
      </td>
      <td width="50%">
        Standard <code>if</code> statement.
      </td>
    </tr>
    <tr>
      <td>
        <pre>if condition
  # ...
else
  # ...
end</pre>
      </td>
      <td>
        Standard <code>if</code> / <code>else</code> statement.
      </td>
    </tr>
    <tr>
      <td>
        <pre>if condition
  # ...
eslif other_condition1
  # ...
eslif other_condition2
  # ...
else
  # ...
end</pre>
      </td>
      <td>
        Standard <code>if</code> / <code>else if</code> / <code>else</code>
        statement.
      </td>
    </tr>
    <tr>
      <td>
        <pre>unless condition
  # ...
end</pre>
        <code>single_line_statement unless condition</code>
      </td>
      <td>
        Shorthand for <code>if !condition</code>
      </td>
    </tr>
    <tr>
      <td>
        <pre>case value
when 42
  # ...
when 90..100
  # ...
when 'X'
  # ...
when /[ABC]/
  # ...
when String
  # ...
else
  # ...
end</pre>
      </td>
      <td>
        Standard <code>case</code> statement, but can match by value or by
        Class. <strong>Note:</strong> Does not support C-style "fall through".
      </td>
    </tr>
    <tr>
      <pre>while condition
  # ...
end</pre>
      </td>
      <td>
        Standard while loop.
      </td>
    </tr>
    <tr>
      <pre>until condition
  # ...
end</pre>
      </td>
      <td>
        Shorthand for <code>while !condition</code>
      </td>
    </tr>
    <tr>
      <td>
        <pre>loop do
  # ...
end</pre>
      </td>
      <td>
        Infinite loop. Can be broken with <code>break</code>, or
        <code>return</code> if in a method.
      </td>
    </tr>
  </tbody>
</table>

## Exception Handling

<table>
  <tbody>
    <tr>
      <td>
        <pre>begin
  # ...
rescue
  # ...
end</pre>
      </td>
      <td>
        Catch all <code>RuntimeError</code> exceptions.
      </td>
    </tr>
    <tr>
      <td>
        <pre>begin
  # ...
rescue ExceptionClass
  # ...
end</pre>
      </td>
      <td>
        Catch any <code>ExceptionClass</code> exception.
      </td>
    </tr>
    <tr>
      <td>
        <pre>begin
  # ...
rescue ExceptionClass => error
  # ...
end</pre>
      </td>
      <td>
        Catch any <code>ExceptionClass</code> exception and save it to the local
        variable <code>error</code>.
      </td>
    </tr>
    <tr>
      <td>
        <pre>begin
  # ...
rescue ExceptionClass1
  # ...
rescue ExceptionClass1, ExceptionClass2
  # ...
end</pre>
      </td>
      <td>
        Catch different exception classes and handle them differently.
      </td>
    </tr>
  </tbody>
</table>

## Conversion Methods

------------------|-------------------------------------------------------------
`obj.to_s`        | convert an Object to a String
`int.to_s(16)`    | convert an Integer into a hexadecimal String
`int.to_s(7)`     | convert an Integer into an octal String
`int.to_s(2)`     | convert an Integer into a binary String
`string.to_i`     | convert a String to an Integer
`string.to_i(16)` | convert a hexadecimal String into an Integer
`string.to_i(7)`  | convert an octal String into an Integer
`string.to_i(2)`  | convert a binary String into an Integer
`array.to_set`    | convert an Array into a Set
`enum.to_a`       | convert an Enumerator into an Array of elements

## Coercion Methods

---------------|----------------------------------------------------------------
`Integer(obj)` | convert to an Integer, if `obj` is not already an Integer
`String(obj)`  | convert to a String, if `obj` is not already a String
`Array(obj)`   | convert to an Array, if `obj` is not already an Array
`URI(obj)`     | parse as a URI, if `obj` is not already a URI object

## String Methods

-----------------------------|--------------------------------------------------
`string * 100`               | repeat the String a hundred times
`string << "foo"`            | append directly to the String
`string += "foo"`            | create a new String by appending the other String
`string[0]`                  | return the first character
`string[1]`                  | return the second character
`string[-1]`                 | return the last character
`string[-2]`                 | return the second to last character
`string[i,j]`                | get a substring within the String starting at `i` of length `j`
`string[i..j]`               | get a substring within the String between indexes `i` and `j`
`string[0] = 'A'`            | sets the first character
`string[1,3] = 'AAA'`        | sets multiple characters
`string[1..4] = 'AAA'`       | sets multiple characters, using a Range
`string.chars`               | return all characters
`string.each_char { |c| ... }` | enumerates over each char in the String
`string.each_char`           | return an Enumerator for each char
`string.bytes`               | return all bytes
`string.each_byte { |b| ... }` | enumerates over each byte in the String
`string.each_byte`           | return an Enumerator for each byte
`string.getbyte(0)`          | return the first byte
`string.putbyte(0,0x41)`     | sets the first byte
`string.strip`               | strips leading and tailing whitespace
`string.split`               | splits a String by whitespace
`string.split(':')`          | splits a String by a character
`string.split(':',2)`        | splits a String, but only returns two elements
`string =~ /regex-here/`     | test if the String matches the Regex
`string.match(/regex-here/)` | get the Regex MatchData back
`string.scan(/regex-here/)`  | get an Array of all matching substrings
`string.sub('A','X')`                 | replace the first occurrance of `A` with `X`
`string.sub(/[ABC]/,'X')`             | replace the first occurrance of the Regex with `X`
`string.sub(/[ABC]/) { |match| ... }` | replace the first occurrance of the Regex with whatever the block returns
`string.gsub('A','X')`                | replace all occurrances of `A` with `X`
`string.gsub(/[ABC]/,'X')`            | replace all occurrances of the Regex with `X`
`string.gsub(/[ABC]/) { |match| ... }`| replace all occurrances of the Regex with whatever the block returns

See the documentation of [String] for more methods.

[String]: https://rubydoc.info/stdlib/core/String

## Array Methods

-----------------------------|--------------------------------------------------
`array[0]`                              | get the first element from an Array
`array.first`                           | get the first element from an Array
`array[1]`                              | get the second element from an Array
`array[-1]`                             | gets the last element in the Array
`array[-2]`                             | gets the second to last element in the Array
`array[0..2]`                           | gets the first two elements in the Array
`array[-2..]`                           | gets the last two elements in the Array
`array[0] = 'A'`                        | sets the first element in the Array
`array[1] = 'B'`                        | sets the second element in the Array
`array[0,2] = ['A', 'B']`               | sets the first and second element in the Array
`array[0..2] = ['A', 'B']`              | sets the first and second element in the Array, with a Range
`array << 'X'`                          | append a single element to the Array
`array1.concat(array2)`                 | concats another Array to the Array
`array.join(' ')`                       | joins he elements with a String and returns a String

See the documentation of [Array] for more methods.

[Array]: https://rubydoc.info/stdlib/core/Array

## Enumerable Methods

----------------------------------|---------------------------------------------
`enum.each { |elem| ... }`        | iterate over each element in the Array
`enum.find { |elem| elem > 2 }`   | find the first element that matches
`enum.map { |elem| elem + 1 }`    | convert an Array into another Array
`enum.select { |elem| elem > 2 }` | select some of the Array's elements
`enum.reject { |elem| elem > 2 }` | opposite of `array.select`
`enum.grep(/regex-here/)`         | select elements based on the Regex

See the documentation of [Enumerable] for more methods.

[Enumerable]: https://rubydoc.info/stdlib/core/Enumerable

## Classes

<table>
  <tbody>
    <tr>
      <td>
        <pre>class Foo
  # ...
end</pre>
      </td>
      <td>
        Define a class called <code>Foo</code> at the top-level.
      </td>
    </tr>
    <tr>
      <td>
        <pre>module Foo
  class Bar
    # ...
  end
end</pre>
      </td>
      <td>
        Define a class called <code>Bar</code> within the namespace
        <code>Foo</code>.
      </td>
    </tr>
    <tr>
      <td>
        <pre>module Foo
  class Bar

    attr_reader :x, :y

    def initialize(x,y)
      @x = x
      @y = y
    end

  end
end</pre>
      </td>
      <td>
        Define a class called <code>Bar</code> with a <code>initialize</code>
        constructor method that takes two arguments and sets the <code>@x</code>
        and <code>@y</code> instance variables.
      </td>
    </tr>
    <tr>
      <td>
        <pre>class Foo < Base
  # ...
end</pre>
      </td>
      <td>
        Define a class called <code>Foo</code> which inherits from another class
        called <code>Base</code>.
      </td>
    </tr>
    <tr>
      <td>
        <pre>class Base

  attr_reader :x

  def initialize(x)
    @x = x
  end

end

class Foo < Base

  attr_reader :y

  def initialize(x,y)
    super(x)

    @y = y
  end

end</pre>
      </td>
      <td>
        Define a class called <code>Foo</code> which inherits from another class
        called <code>Base</code>, and defines an <code>initialize</code> 
        constructor which also calls the <code>initialize</code> in the
        <code>Base</code> class.
      </td>
    </tr>
  </tbody>
</table>

## Methods

<table>
  <tbody>
    <tr>
      <td>
        <pre>def foo
  # ...
end</pre>
      </td>
      <td>
        Define an instance method called <code>foo</code> that takes no
        arguments.
      </td>
    </tr>
    <tr>
      <td>
        <pre>def foo(x)
  # ...
end</pre>
      </td>
      <td>
        Defines a method called <code>foo</code> which takes a single argument.
      </td>
    </tr>
    <tr>
      <td>
        <pre>def foo(x,y,z)
  # ...
end</pre>
      </td>
      <td>
        Defines a method called <code>foo</code> which takes three arguments.
      </td>
    </tr>
    <tr>
      <td>
        <pre>def foo(x=1)
  # ...
end</pre>
      </td>
      <td>
        Defines a method called <code>foo</code> which takes a single argument,
        which defaults to <code>1</code> if not given.
      </td>
    </tr>
    <tr>
      <td>
        <pre>def foo(*args)
  # ...
end</pre>
      </td>
      <td>
        Defines a method called <code>foo</code> which takes any number of
        arguments.
      </td>
    </tr>
    <tr>
      <td>
        <pre>def foo(x: 1)
  # ...
end</pre>
      </td>
      <td>
        Defines a method called <code>foo</code> which takes a keyword argument,
        which defaults to <code>1</code> if not given.
      </td>
    </tr>
    <tr>
      <td>
        <pre>def foo(x: )
  # ...
end</pre>
      </td>
      <td>
        Defines a method called <code>foo</code> which takes a required keyword
        argument.
      </td>
    </tr>
    <tr>
      <td>
        <pre>def foo(**kwargs)
  # ...
end</pre>
      </td>
      <td>
        Defines a method called <code>foo</code> which accepts arbitrary
        keyword arguments.
      </td>
    </tr>
    <tr>
      <td>
        <pre>def foo(x)
  yield x + 1
  yield x + 2
  yield x + 3
end</pre>
      </td>
      <td>
        Defines a method called <code>foo</code> which yields multiple times
        to the given block.
      </td>
    </tr>
    <tr>
      <td>
        <pre>def foo(&block)
  # ...
end</pre>
      </td>
      <td>
        Defines a method called <code>foo</code> which explicitly accepts a
        block (aka closure, aka anonymous function).
      </td>
    </tr>
    <tr>
      <td>
        <pre>class Foo
  def self.bar
    # ...
  end
end</pre>
      </td>
      <td>
        Defines a "static method" called <code>bar</code> on the class
        <code>Foo</code>.
      </td>
    </tr>
    <tr>
      <td>
        <pre>module Foo
  def self.bar
    # ...
  end
end</pre>
      </td>
      <td>
        Defines a "static method" called <code>bar</code> on the module
        <code>Foo</code>.
      </td>
    </tr>
  </tbody>
</table>

## See Also

* [Learn Ruby in Y minutes](https://learnxinyminutes.com/docs/ruby/)

<div class="level">
  <div class="level-left">
  </div>

  <div class="level-item">
    <a class="button" href="/docs/#guides">
      &#x2303; Guides
    </a>
  </div>

  <div class="level-right">
    <a class="button" href="../writing-ronin-ruby-scripts/">
      Writing Ronin Ruby Scripts &raquo;
    </a>
  </div>
</div>
