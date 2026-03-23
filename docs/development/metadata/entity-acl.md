# entityAcl

Restrictions for fields and links can be defined here.

Path: metadata > entityAcl > {EntityType}.

Example:

```json
{
    "fields": {
        "someFieldName": {
            "readOnly": true
        },
        "anotherFieldName": {
            "forbidden": true
        }
    },
    "links": {
        "someLinkName": {
            "nonAdminReadOnly": true
        }
    }
    "automationWriteForbidden": false
}
```

Available params (all are booleans):

* forbidden – totally forbidden;
* internal – reading forbidden, writing allowed;
* onlyAdmin – forbidden for non admin users;
* readOnly – read-only for all users;
* nonAdminReadOnly – read-only for non-admin users.

## systemWriteForbidden

*boolean*

*As of v9.4.0.*

Restricts record update and removal in formula.
