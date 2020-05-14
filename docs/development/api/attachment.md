# API :: Attachment

* [Uploading](#uploading)
* [Downloading](#downloading)

### Uploading

`POST Attachment`

* Method: *POST*
* Action: `Attachment`
* Headers: `Content-Type: application/json`

Payload attributes:

* name - file name;
* type - mime type;
* role - specify value `Attachment`;
* relatedType - entity type attachment is related to (only for fields of *File* type);
* relatedId - record ID attachment is related to (only for fields of *File* type);
* parentType - entity type attachment is related to (only for fields of *Attachment Multiple* type);
* field - field name of related record attachment is related through;
* file - file contents.

Note: *parentId* attribute is available when uploading and will be ignored.

#### Example (File field)

The attachment to be stored in the field of *File* type. 

`POST Attachment`

```json
{
    "name": "test.txt",
    "type": "text/plain",
    "role": "Attachment",
    "relatedType": "Document",
    "field": "file",
    "file": "data:text/plain;base64,FILE_CONTENTS_ENCODED_WITH_BASE64"
}
```

Returns attachment record attributes:

```json
{
    "id": "some-id",
    "name": "test.txt"
}
```

Then you need to send the 2nd request that updates the Document record. You will need to fill *fileId* attribute with ID returned after *POST Attachment* request.

`PUT Document/someId`

```json
{
    "fileId": "id-of-attachment"
}
```


#### Example (Attachment-Multiple field)

The attachment to be stored in the field of *Attachment-Multiple* type. 

`POST Attachment`

```json
{
    "name": "test.txt",
    "type": "text/plain",
    "role": "Attachment",
    "parentType": "Note",
    "field": "attachments",
    "file": "data:text/plain;base64,FILE_CONTENTS_ENCODED_WITH_BASE64"
}
```

Then you need to send the 2nd request that updates the parent Note record. You need to specify *attachmentsIds* attribute with an array that contains ID returned after *POST Attachment* request.


`PUT Note/someId`

```json
{
    "attachmnetsIds": ["id-of-attachment"]
}
```

Note: If you are attaching to an existing record, you need also to add current attachments, otherwise they will be unlinked from the record.



### Downloading

Available since version 5.9.0.

`GET Attachment/file/{id}`

Where `{id}` is an ID of the attachment record.

Returns attachment contents.
