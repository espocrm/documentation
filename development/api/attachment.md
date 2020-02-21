# API :: Attachment

## Uploading

### POST Attachment

Payload fields:

* name — file name;
* type — mime type;
* role — specify value `Attachment`;
* relatedType — entity type attachment is related to (only for fields of *File* type);
* relatedId — record ID attachment is related to (only for fields of *File* type);
* parentType — entity type attachment is related to (only for fields of *Attachment Multiple* type);
* parentId — record ID attachment is related to (only for fields of *Attachment Multiple* type);
* field — field name of related record attachment is related through;
* file — file contents.

#### Example (File type)

```json
{
    "name": "test.txt",
    "type": "text/plain",
    "role": "Attachment",
    "relatedType": "Document",
    "field": "file",
    "file": "data:text/plain;base64,ENCODED_FILE_CONTENTS"
}
```

Returns attachment record attributes:

```json
{
    "id": "some-id",
    "name": "test.txt"
}
```

Returned ID can be used in the following API call that creates or updated a record to which the attachment is supposed to be related to. In our example we create a record of *Document* entity type. You will need to fill *fileId* attribute with ID returned after *POST Attachment* request.

#### Example (Attachment-Multiple type)


Payload example (*File* type):

```json
{
    "name": "test.txt",
    "type": "text/plain",
    "role": "Attachment",
    "parentType": "Note",
    "parentId": "id-of-note-record",
    "field": "attachments",
    "file": "data:text/plain;base64,ENCODED_FILE_CONTENTS"
}
