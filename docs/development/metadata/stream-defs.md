# streamDefs

Path: metadata > streamDefs > {EntityType}.

## followingUsersField

*string*

A field (of a link-multiple type) that store users which should automatically follow a record. If not set, then the *assignedUsers* field is checked for existance and then used. E.g. for the *Meeting*, it's the *users* field.

## subscribersCleanup

*Object*

Example:

```json
{
    "followingUsersField": "users",
    "subscribersCleanup": {
        "enabled": true,
        "dateField": "dateStart",
        "statusList": ["Held", "Not Held"]
    }
}
```

### enabled

*boolean*

Enables the cleanup of subscriberes.

### dateField

*string*

A date (or date-time) field that stores a value after which followers will automatically unfollow a record.

### statusList

*string[]*

A list of statuses records should have to be eligible for the subscriberes cleanup. E.g. for the *Meeting*, it's `["Held", "Not Held"]`.
