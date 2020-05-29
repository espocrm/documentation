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

##### Step 1. Upload attachment

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
    "id": "{some-id}",
    "name": "test.txt"
}
```

##### Step 2. Set attachment ID in related record

Then you need to send the 2nd request that creates (or updates) the Document record. You will need to fill *fileId* attribute with ID returned after *POST Attachment* request.

Create:

`POST Document`

```json
{
    "name": "document-name",
    "fileId": "{id-of-attachment}"
}
```
Update:

`PUT Document/{document-id}`

```json
{
    "fileId": "{id-of-attachment}"
}
```


#### Example (Attachment-Multiple field)

##### Step 1. Upload attachment

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

##### Step 2. Set attachment ID in parent record

Then you need to send the 2nd request that creates (or updates) the parent Note record. You need to specify *attachmentsIds* attribute with an array that contains ID returned after *POST Attachment* request.

Create:


`POST Note`

```json
{
    "post": "Some text",
    "type": "Post",
    "attachmnetsIds": ["{id-of-attachment}"]
}
```

Update:

`PUT Note/{id-of-note-record}`

```json
{
    "attachmnetsIds": ["{id-of-attachment}"]
}
```

Note: If you are attaching to an existing record, you need also to add current attachments, otherwise they will be unlinked from the record.



### Downloading

Available since version 5.9.0.

`GET Attachment/file/{id}`

Where `{id}` is an ID of the attachment record.

Returns attachment contents.
