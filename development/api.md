# REST API

EspoCRM is a single page application so a frontend uses REST API to connect with a backend. 
All operations you perform using UI you can implement via API calls using your programing language. 
You can learn how API works if you trace what's going in the network tab in your browser console.

Most of api functions return JSON. POST, PATCH calls usually need some JSON data in payload.

Base URL of EspoCRM API is: `api/v1/`. You need to prepend it to expressions in this reference. Example: `GET api/v1/Contact/55643ca033f7ab4c5`.

## CRUD Operations

### List Entities

`GET {entityType}`

GET parameters:

* `offset` - (int) offset;
* `maxSize` - (int) max size;
* `where` - (array) filters;
* `sortBy` - (string) field to sort by;
* `asc` - (bool) sort direction.

_Example_

`GET Account?offset=0maxSize=20`

Returns:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

### Read Entity

`GET {entityType}/{id}`

Returns attributes in JSON object.

_Example_

`GET Account/5564764442a6d024c`

### Create Entity

`POST {entityType}`

Payload: Object of entity attributes.

Returns entity attributes in JSON object.

_Example_

`POST Account`

Payload:
```
{
  "name": "Test",
  "assignedUserId": "1"
}
```

### Update Entity

`PATCH {entityType}/{id}`

or

`PUT {entityType}/{id}`

Payload: Object of entity attributes needed to be changed.

Returns attributes in JSON object.

_Example_

`PATCH Account/5564764442a6d024c`

Payload:
```
{
  "assignedUserId": "1"
}
```

### DELETE Entity

`DELETE {entityType}/{id}`

_Example_

`DELETE Account/5564764442a6d024c`

## Related Entities

### List Related Entities

`GET {entityType}/{id}/{link}`

* `offset` - (int) offset;
* `maxSize` - (int) max size;
* `where` - (array) filters;
* `sortBy` - (string) field to sort by;
* `asc` - (bool) sort direction.

_Example_

`GET Account/5564764442a6d024c/opportunities`

Returns:
```
{
  "list": [... array of records...],
  "total": {totalCountOfRecords}
}
```

### Link Entity

`POST {entityType}/{id}/{link}`

Payload:

1. `id` attribute.
2. `ids` array attribute.
3. `"massRelate": true` and `"where": {...}` to relate multiple records by search criterias.

_Example_

`POST Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

### Unlink Entity

`DELETE {entityType}/{id}/{link}`

Payload:

1. JSON with `id` attribute.
2. JSON with `ids` array attribute.

_Example_

`DELETE Account/5564764442a6d024c/opportunities`

Payload:
```
{
  "id": "55646fd85955c28c5"
}
```

## Stream

### List stream entries related to a specific record

`GET {entityType}/{id}/stream`

### Follow record

`PUT {entityType}/{id}/subscription`

### Follow record

`DELETE {entityType}/{id}/subscription`



