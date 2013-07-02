pglite
======

unix philosophy postgres adapter, aka poor man's pg adapter for ruby.

## Usage

```
require 'pglite'
conn = Pglite.new({'host' => 'localhost', 'port' => '5432', 'username' => 'bdigital', 'database' => 'db1'})
activity_count = conn.execute('select count(*) pg_stat_activity')
puts activity_count

#> 1
```


