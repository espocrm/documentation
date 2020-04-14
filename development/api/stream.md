# API :: Stream

### List stream records for the current user

`GET Stream`

Get parameters:

* `offset` - (int) offset
* `maxSize` - (int) max size

### List stream notes of a specific record

`GET {entityType}/{id}/stream`

Get parameters:

* `offset` - (int) offset
* `maxSize` - (int) max size

### Follow record

`PUT {entityType}/{id}/subscription`

### Unfollow record

`DELETE {entityType}/{id}/subscription`
