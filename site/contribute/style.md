---
layout: default
title: Coding Style Guide-Lines
---

Coding Style Guide-Lines
========================

File Naming
-----------

Files should be named after their contained modules/classes.
The following code would reside in the file `thing/stuff.rb`.

    module Thing
      class Stuff

        ....

      end
    end

Class/Module Naming
------------

Class or Module names should be in CamelCase or in all CAPS.

Method Naming
-------------

Method names should always be in all lower-case, with words seperated by
underscores.

Methods which return a Boolean value, should end with a `?`.

    def is_closed?
      ...
    end

Methods which change the state of an object should end with a `!`.

    def close!
      ...
    end

Indentation
-----------

**Two space** indentation Ruby, XML, XSL, HTML and Javascript source-code.
Tab indentation for other programming languages.

Also, all code should try to be no wider than 80 columns.

Strings
-------

Use double-quotes when necessary, use single-quotes otherwise.

    'i do not need double quotes here, so why use them?'

    "I do need double quotes here, #{var}."

Embedded Strings
----------------

Use the `%{...}` syntax when embedding large strings into Ruby code.

    %{I find this style to be particularly clean.}

Expressions
-----------

The `and`, `or`, `not` keywords are not the same as their `&&`, `||`, `!`
counter-parts. Please use symbolic operators instead.

Statements
----------

Ruby provides various short-hand statements, that lessen repetitive typing.
Please use the short-hand statements
when appropriate, it helps DRY (Dont Repeat Yourself) up the code.

Repetitive:

    if !(@var)
      ...
    end

    if @var.nil?
      @var = 'default'
    end

DRY:

    unless @var
      ...
    end

    @var ||= 'default'

Defining Modules/Classes
------------------------

Bad:

    class Bla::Ugly
      
    end

Good:

    module Bla
      class Better

      end
    end

Global Variables
----------------

Avoid using global variables, instead use class variables.

    class Important
      
      def Important.data
        @@data ||= {}
      end
      
    end

Blocks (aka Closures)
---------------------

Use `&block` syntax to explicitly receive and pass blocks. This allows
for maximum control of where blocks are passed to.

    def explicit_block(var,&amp;block)
      ...
      compute(var,&amp;block)
      ...
    end

Chaining Blocks
---------------

When chaining together method calls that receive blocks, please use
`{` and `}` instead of `do` and `end` for defining the blocks.

Ugly:

    stuff.do |i|
      i =~ /[a-f0-9]/
    end.map |j|
      j.to_i(16)
    end

Better:

    stuff.select { |i| i =~ /[a-f0-9]/ }.map { |j| j.to_i(16) }

send
----

Always check if the requested method is public.

Dangerous:

    def bad_method_proxy(name)
      @obj.send(name)
    end

Safer:

    def better_method_proxy(name)
      if @obj.public_methods.include?(name.to_s)
        return @obj.send(name)
      else
        raise(NoMethodError,"unknown method #{name.dump}",caller)
      end
    end

Also, sometimes it is necessary to check if the method is not inherited,
but defined directly within the class.

Safest:

    def strict_method_proxy(name)
      if @obj.class.public_instance_methods(false).include?(name)
        return @obj.send(name)
      else
        raise(NoMethodError,"undefined method #{name.dump}",caller)
      end
    end

