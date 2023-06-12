# API Before-Save Script

*As of v7.5.*

A [formula](formula.md) script that is called on create and update API requests before an entity is saved.
It's executed only when a record is created or updated via API, including via UI (as EspoCRM is a single page application). It's not executed when a record is saved from whithin the system (e.g. in hooks, workflow actions).
Can be used for custom validation, duplicate checking, and access control. Available at Administration > Entity Manager > {Entity} > Formula.

!!! note

    API Before-Save Script is not executed when doing mass update.

## Special functions

These functions are available only in *API Before-Save Script*. Using them in other places will produce an error.

### recordService\skipDuplicateCheck

Returns *true* if a *skipDuplicateCheck* HTTP header is passed (when a user warned about a duplicate but opts to save the record anyway).

!!! example

    ```
    if (!recordService\skipDuplicateCheck()) {
        // process duplicate checking
    }
    ```

### recordService\throwDuplicateConflict

`recordService\throwDuplicateConflict(RECORD_ID)`

`recordService\throwDuplicateConflict(RECORD_IDS)` – receives a list of ID.

Throw a duplicate conflict exception. This will show a modal dialog warning the user that the saved record
might be a duplicate.

!!! example

    ```
    if (!recordService\skipDuplicateCheck()) {
        $id = record\findOne('MyEntityType', null, null, 'name=', name);

        if ($id) {
            recordService\throwDuplicateConflict($id);
        }
    }
    ```

### recordService\throwBadRequest

`recordService\throwBadRequest(MESSAGE, [BODY])`

Throws a Bad Request exception.

!!! example

    ```
    recordService\throwBadRequest('Invalid value.')`
    ```

!!! example

    ```
    $obj = object\create();
    object\set($obj, 'key', 'value');

    recordService\throwBadRequest('Invalid value.', $obj)`
    ```

### recordService\throwForbidden

`recordService\throwForbidden(MESSAGE, [BODY])`

Throws a Forbidden exception.

### recordService\throwConflict

`recordService\throwConflict(MESSAGE, [BODY])`

Throws a Conflict exception.

## Examples

### Duplicate checking

Example 1:

```
if (entity\isNew() && !recordService\skipDuplicateCheck()) {
    $id = record\findOne('MyEntityType', null, null, 'name=', name);

    if ($id) {
        recordService\throwDuplicateConflict($id);
    }
}
```

Example 2:

```
if (entity\isNew() && !recordService\skipDuplicateCheck()) {
    $ids = list();

    $id = record\findOne('MyEntityType', null, null, 'name=', name);

    if ($id) {
        $ids = array\push($ids, $id);
    }

    $id = record\findOne('MyEntityType', null, null, 'emailAddress=', emailAddress);

    if ($id) {
        $ids = array\push($ids, $id);
    }

    $ids = array\unique($ids);

    if (array\length($ids)) {
        recordService\throwDuplicateConflict($ids);
    }
}
```

### Validation

Example 1:

```
if (status == 'Completed' && !dateCompleted) {
    recordService\throwBadRequest("Missing `dateCompleted` value.");
}
```

### Access control

Example 1:

```
if (
    entity\isAttributeChanged('status') &&
    !array\includes(env\userAttribute('teamsIds'), '6133380f577a93492')
) {
    recordService\throwForbidden("Not allowed to change status.");
}
```
