# Performance Tweaking

## Recommendations

* SSD is preferred over HDD.
* Dedicated server is preferred over shared.
* More RAM can be helpful if your database grows.

## Database indexes

By default, EspoCRM has some pre-defined indexes. As your database gets bigger, it's reasonable to create new indexes. What exactly indexes are needed, depends on how you use CRM and how you customized it: what custom fields are created, default record orders are set, reports are often run, searches are usually performed, etc.

* You need indexes for fields that are used for a default order.
* You need indexes for fields that are often used in filters (reports & regular searches).

See article about [how to create indexes](../development/db-indexes.md).

## Database choice

Filters by teams, relations, multi-enums perform faster on MariaDB.

## MySQL params

#### innodb_buffer_pool_size

It's recommended to set a value that is about 70% of your RAM.

#### sort_buffer_size

You may consider increasing this param to speed up ORDER BY or GROUP BY. [See more](https://dev.mysql.com/doc/refman/8.0/en/server-system-variables.html#sysvar_sort_buffer_size).

#### innodb_log_file_size

Should be large enough. [See more](https://dev.mysql.com/doc/refman/8.0/en/innodb-parameters.html#sysvar_innodb_log_file_size).

#### innodb_flush_log_at_trx_commit

We recommend to set it to `2`.

## Misc

### Disabling total count on list view

It is relevant if there are a lot of records of a specific entity type in the database. In this case, it can be reasonable to disable displaying a record count on the list view for that entity type, since the COUNT function may perform very slow in MySQL and MariaDB.

To disable: Administration > Entity Manager > {entity type} > Edit > check *Disable record count*.

### Use full-text search

Create [full-text search](../user-guide/text-search.md#full-text-search) indexes for large tables. It will improve record lookup.

## PHP configuration

### Preloading

You can use a [preloading](https://www.php.net/manual/en/opcache.preloading.php). The file `preload.php` is available at the root directory.

Using preloading is not likely to bring a significant performance boost. The database usually is the bottleneck in applications like CRM.

!!! important

    Preloading must be disabled before upgrading and extension installation.
