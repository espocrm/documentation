# API :: Related records

!!! note
    You can obtain the list of [link](../../administration/terms-and-naming.md#link) names at Administration > Entity Manager > click relationships on a specific entity type > 4th column. Actual types: parent-to-children, one-to-many, many-to-many.

* [List related records](#list-related-records)
* [Link](#link)
* [Unlink](#unlink)

### List related records

`GET {entityType}/{id}/{link}`

GET parameters:

* `maxSize` - (int) max size
* `offset` - (int) offset
* `where` - (array) filters
* `orderBy` - (string) attribute to sort by
* `order` - (string: 'asc' | 'desc') sort direction
* `select` - (string) list of attributes to be returned, sepratated by comma; if not specified, then all fields will be returned

You can find more info about search params [here](../api-search-params.md).

Example:

`GET Account/5564764442a6d024c/opportunities`

Returns:

```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

See [more info](../api-search-params.md) about search parameters.

### Link

`POST {entityType}/{id}/{link}`

Relates two records.

Payload:

* `id` - ID of the record to relate with
* `ids` - array of IDs of the records to relate with
* `massRelate` - optional, false or true, whether to use search criteria that will be used instead of specific ids
* `where` - optional [search criteria](../api-search-params.md#where)

Headers:

*  `Content-Type: application/json`

Example:

`POST Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

### Unlink

`DELETE {entityType}/{id}/{link}`

Unrelates two records.

Payload fields:

* `id` - ID of related record to remove
* `ids` - array of IDs of related records to remove

Headers:

*  `Content-Type: application/json`

Example:

`DELETE Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```
