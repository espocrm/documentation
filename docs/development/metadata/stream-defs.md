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

## bypassAssignedUserFollow

*boolean*

*As of v10.0.*

Assigned users won't follow the record when they get assigned to it. If enabling, consider also enabling `forceAssignmentNotificator` in notificationDefs – otherwise, the assignee won't receive any notification.

## allowInternalNotes

*boolean*

*As of v10.0.*

Allow internal notes. If true, it will be possible to post internal posts in the stream. Internal posts are not visible in portals.
