# streamDefs

Path: metadata > streamDefs > {EntityType}.

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

## followingUsersField

*string*

A field (of a link-multiple type) that store users which should automatically follow a record. If not set, then the *assignedUsers* field is checked for existence and then used. E.g. for the *Meeting*, it's the *users* field.

## subscribersCleanup

*Object*

### enabled

*boolean*

Enables the cleanup of subscribers.

### dateField

*string*

A date (or date-time) field that stores a value after which followers will automatically unfollow a record.

### statusList

*string[]*

A list of statuses records should have to be eligible for the subscribers cleanup. E.g. for the *Meeting*, it's `["Held", "Not Held"]`.
