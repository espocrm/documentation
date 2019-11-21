# API :: Account

## List

### GET Account

Returns a list of accounts and total number of records. It's possible to specify filters.

GET parameters are available [here](../api.md#list-entities).

Requires *read* access to *Account* scope.

Example:

```
GET Account?select=name&maxSize=2&orderBy=name&order=asc
```

will return:

```json
{
    "list": [
        {
            "id": "someId1",
            "name": "Test 1"
        },
        {
            "id": "someId2",
            "name": "Test 2"
        }
    ],
    "total": 2100
}
```

## Create

### POST Account

Creates an account. Returns its attributes.

Requires *create* access to *Account* scope.

Payload: Record attributes.

Example:

```
POST Account
```

with payload:

```json
{
    "name": "Test",
    "assignedUserId": "someUserId"
}
```

## Read

### GET Account/{id}

Returns attributes of a specific Account record.

Requires *read* access to Account record.


Example:

```
GET Account/someId
```

with return:

```json
{
    "id": "someId",
    "name": "Test",
    "createdById": "someUserId",
    "createdByName": "Some Name",
    "assignedUserId": "someUserId",
    "assignedUserName": "someName",
    "teamsIds": [],
    "teamsNames": {}
}
```

## Update

### PUT Account/{id}

Updates an existing Account. Returns its attributes.

Requires *edit* access to Account record.

Payload: Record attributes.

Example:

```
PUT Account/someId
```

with payload:

```json
{
    "assignedUserId": "someUserId"
}
```

## Delete

### DELETE Account/{id}

Removes an existing account.

Requires *delete* access to Account record.

Example:

```
DELETE Account/someId
```

## Stream

### GET Account/{id}/stream

Returns stream records of a specific account.

GET parameters: *maxSize*, *limit*.

Requires *stream* access to Account record.

## Relationships

Note: *Link* names can be obtained at Administration > Enity Manager > click *relationsips* on *Account* row > 4th column. Actual types: parent-to-children, one-to-many, many-to-many.

The list of links available out-of-the-box:

* calls
* cases
* contacts
* documents
* emails
* emailsPrimary
* meetings
* meetingsPrimary
* opportunities
* targetLists
* tasks
* tasksPrimary


### GET Account/{id}/{link}

Returns a list of related records linked through *link* relation and their total number of records. It's possible to specify filters.

GET parameters are available [here](../api.md#list-related-entities).

Requires *read* access to Account record and *read* access to the scope of the related entity type.


### POST Account/{id}/{link}

Relate an existing account with a specific record (or multiple records) throuh a specific *link*.

Requires *edit* access to Account record and *edit* access to the scope of the related entity type.

Payload parameters are available [here](../api.md#link-entity).


### DELETE Account/{id}/{link}

Unlinks a specific record, linked throgh a specific link, from an account.

Requires *edit* access to Account record and *edit* access to the scope of the related entity type.

Payload:

1. JSON with `id` string attribute
2. JSON with `ids` array attribute

