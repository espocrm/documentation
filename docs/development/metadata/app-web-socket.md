# app > webSocket

Path: metadata > app > webSocket.

## categories

*Object*

A category-name => defs map. Define custom WebSocket events here. You can use dots in category names.

Example:

```json
{
    "categories": {
        "myGroupName.myCustomName": {
            "paramList": ["scope", "id"],
            "accessCheckCommand": "AclCheck --userId=:userId --scope=:scope --id=:id --action=read"
        }
    }
}
```

### paramList

*string[]*

Parameters passed with within a WebSocket topic. E.g. the topic name `myGroupName.myCustomName.Account.someId`. This makes a topic name unique for a specific record. For global events, omit this parameter.

### accessCheckCommand

*string*

A console [command](../../administration/commands.md) that will be used to check whether a topic is allowed for a user when they attempting to subscribe. Patameter placeholders starts with the colon `:`. The `userId` parameter contains a user ID.
