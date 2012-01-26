---
layout: default
title: Coding Style Guide-Lines
---

# Coding Style Guide-Lines

## File Naming

Files should be named after their contained modules/classes.
The following code would reside in the file `thing/stuff.rb`.

{% highlight ruby %}
module Thing
  class Stuff

    # ....

  end
end
{% endhighlight %}

## Class/Module Naming

Class or Module names should be in CamelCase or in all CAPS.

## Method Naming

Method names should always be in all lower-case, with words seperated by
underscores.

Methods which return a Boolean value, should end with a `?`.

{% highlight ruby %}
def is_closed?
  # ...
end
{% endhighlight %}

Methods which change the state of an object should end with a `!`.

{% highlight ruby %}
def close!
  # ...
end
{% endhighlight %}

## Argument/Variable Naming

Please try to use english words for method arguments or variable names.

Try not use names such as `tmp`, `var`, `x`, `i`, `foo` or `bar`.

## Spacing

### Width

Code should try to be no wider than 80 columns.

### Indentation

**Two space** indentation Ruby, XML, XSL, HTML and Javascript source-code.
Tab indentation for other programming languages.

### Vertical Alignment

Vertical alignment improves readability.

{% highlight ruby %}
options = {
  :thing       => 'foo',
  :other_thing => 'bar'
}

options[:more]       = 'baz'
options[:more_stuff] = 'bax'
{% endhighlight %}

## Strings

Use double-quotes when necessary, use single-quotes otherwise.

{% highlight ruby %}
'i do not need double quotes here, so why use them?'

"I do need double quotes here, #{var}."
{% endhighlight %}

## Embedded Strings

Use the `%{...}` syntax when embedding large strings into Ruby code.

{% highlight ruby %}
%{I find this style to be particularly clean.}
{% endhighlight %}

## Arrays of Strings

Use `%w[]` to define an Array of words:

{% highlight ruby %}
%w[foo bar baz]
{% endhighlight %}

## Expressions

The `and`, `or`, `not` keywords are not the same as their `&&`, `||`, `!`
counter-parts. Please use symbolic operators instead.

## Statements

Ruby provides various short-hand statements, that lessen repetitive typing.
Please use the short-hand statements
when appropriate, it helps DRY (Dont Repeat Yourself) up the code.

### Verbose

{% highlight ruby %}
if !(@var)
  # ...
end

if @var.nil?
  @var = 'default'
end
{% endhighlight %}

### DRY

{% highlight ruby %}
unless @var
  # ...
end

@var ||= 'default'
{% endhighlight %}

## Assignment Statements

In Ruby everything has a return value, even `if` statements:

{% highlight ruby %}
flag = if options[:flag]
         "--#{options[:flag]}"
       end
{% endhighlight %}

## Defining Modules/Classes

### Bad

{% highlight ruby %}
class Bla::Ugly

end
{% endhighlight %}

### Good

{% highlight ruby %}
module Bla
  class Better

  end
end
{% endhighlight %}

## Global Variables

Avoid using global variables, instead use class or instance-variables.

    class Important
      
      def Important.data
        @@data ||= {}
      end

      def self.metadata
        @metadata ||= {}
      end
      
    end

## Blocks (aka Closures)

Use `&block` syntax to explicitly receive and pass blocks. This allows
for maximum control of where blocks are passed to.

{% highlight ruby %}
def explicit_block(var,&amp;block)
  # ...
  compute(var,&amp;block)
  # ...
end
{% endhighlight %}

## Chaining Blocks

When chaining together method calls that receive blocks, please use
`{` and `}` instead of `do` and `end` for defining the blocks.

### Ugly

{% highlight ruby %}
stuff do |i|
  i =~ /[a-f0-9]/
end.map |j|
  j.to_i(16)
end
{% endhighlight %}

### Better

{% highlight ruby %}
stuff.select { |i| i =~ /[a-f0-9]/ }.map { |j| j.to_i(16) }
{% endhighlight %}

## send

Always check if the requested method is public.

### Dangerous

{% highlight ruby %}
def bad_method_proxy(name)
  @obj.send(name)
end
{% endhighlight %}

### Safer

{% highlight ruby %}
def better_method_proxy(name)
  if @obj.public_methods.include?(name.to_s)
    return @obj.send(name)
  end

  raise(NoMethodError,"unknown method #{name.dump}",caller)
end
{% endhighlight %}

Also, sometimes it is necessary to check if the method is not inherited,
but defined directly within the class.

### Safest

{% highlight ruby %}
def strict_method_proxy(name)
  if @obj.class.public_instance_methods(false).include?(name)
    return @obj.send(name)
  end

  raise(NoMethodError,"undefined method #{name.dump}",caller)
end
{% endhighlight %}
