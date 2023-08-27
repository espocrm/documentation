# API :: Stream

### List stream records for the current user

`GET Stream`

Get parameters:

* `offset` – (int) offset
* `maxSize` – (int) max size

### List stream notes of a specific record

`GET {entityType}/{id}/stream`

Get parameters:

* `offset` – (int) offset
* `maxSize` – (int) max size

### Follow record

`PUT {entityType}/{id}/subscription`

### Unfollow record

`DELETE {entityType}/{id}/subscription`

### Post to stream

`POST Note`

Payload attributes:

* `type` – should be the string value `Post`
* `parentId` – ID of the record to post to
* `parentType` – entity type of the record to post to
* `post` – text to post
* `attachmentsIds` – optional, array of IDs of attachments (should be uploaded in separate request beforehand)

Payload example:

```json
{
  "type": "Post",
  "parentId": "someId",
  "parentType": "Case",
  "post": "This is a test\n\nHello"
}
```
