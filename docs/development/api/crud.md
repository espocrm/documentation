# API :: CRUD Operations

CRUD stands for create, read, update, delete.

Note: You can obtain the list of [entity types](../../administration/terms-and-naming.md#entity-type) at Administration > Entity Manager > the left column.

* [List](#list)
* [Read](#read)
* [Create](#create)
* [Update](#update)
* [Delete](#delete)


### List

`GET {entityType}`

Returns a list of records of a specific entity type.

GET parameters:

* `maxSize` – *int* – max size;
* `offset` – *int* – offset;
* `where` – *array* – filters;
* `orderBy` – *string* – attribute to sort by;
* `order` – *string: 'asc' | 'desc'* – sort direction;
* `select` – *string* – list of [attributes](../../administration/terms-and-naming.md#attribute) to be returned, sepratated by comma; if not specified, then all attributes will be returned; whitespaces are not allowed.

Example:

`GET Account?offset=0&maxSize=20`

Returns:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

See [more info](../api-search-params.md) about search parameters.

Additional headers:

* `X-No-Total: true` - won't return a total number of records (can be reasonable for big tables, the request will be processed faster).

### Read

`GET {entityType}/{id}`

Returns [attributes](../../administration/terms-and-naming.md#attribute) of a specific record.

Example:

`GET Account/5564764442a6d024c`

### Create

`POST {entityType}`

Creates a new record of a specific entity type.

Payload: Object of entity [attributes](../../administration/terms-and-naming.md#attribute).

Returns attributes of the created record.

Example:

`POST Account`

Payload:
```
{
  "name": "Test",
  "assignedUserId": "1"
}
```

Additional headers:

* `X-Skip-Duplicate-Check: true` - skips checking for duplicates (won't return 409 Error if a duplicate record is found).

### Update

`PUT {entityType}/{id}`

Updates an existing record.

Payload: Object of entity [attributes](../../administration/terms-and-naming.md#attribute) needed to be changed.

Returns attributes of the updated record.

Example:

`PUT Account/5564764442a6d024c`

Payload:

```
{
  "assignedUserId": "1"
}
```

### Delete

`DELETE {entityType}/{id}`

Deletes an existing record.

Returns `true`.

Example:

`DELETE Account/5564764442a6d024c`
