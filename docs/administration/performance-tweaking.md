# Performance Tweaking

## Disabling total count on list view

Actual if there are a lot of records of a specific entity type in database. In this case it's reasonable to disable displaying count on the list view of that entity type, since COUNT is a very slow operation in MySQL.

To disable: Administration > Entity Manager > edit specific entity type > check *Disable record count*.

## Recommendations

* SSD is preferred over HHD
* Dedicated server is preferred over shared
* More RAM can be helpful if your database grows

## Database indexes

By default EspoCRM has some pre-defined indexes. As your database gets bigger it's reasonable to create new indexes. What exactly indexes are needed depends on how you use CRM and how you customized it: what custom fields are created, default record orders are set, reports are often run, searches are usually performed, etc.

* You need indexes for fields that are used for a default order.
* You need indexes for fields that are often used in filters (reports & regular searches).

See article about [how to create indexes](../development/db-indexes.md).

## MySQL params

#### innodb_buffer_pool_size

It's recommended to set a value that is about 70% of your RAM.

#### sort_buffer_size

You can consider increasing this param to speed up ORDER BY or GROUP BY. [See more](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_sort_buffer_size).

#### innodb_log_file_size

Should be large enough. [See more](https://dev.mysql.com/doc/refman/8.0/en/innodb-parameters.html#sysvar_innodb_log_file_size).

#### innodb_flush_log_at_trx_commit

We recommend to set it to `2`.

