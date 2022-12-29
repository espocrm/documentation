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

Parameters passed within a topic. E.g. the topic name `myGroupName.myCustomName.Account.someId`. This makes a topic name unique for a specific record. For global events, omit this parameter.

### accessCheckCommand

*string*

A console [command](../../administration/commands.md) that will be used to check whether a topic is allowed for a user when they attempting to subscribe. Patameter placeholders starts with the colon `:`. The `userId` parameter contains a user ID. If access checking is not needed, omit this parameter.

## messagers

*Object.<string, Object\>*

Provides the ability to implement other messangers rather than the default ZeroMQ. E.g. RabbitMQ.

Example:

```json
{
    "messagers": {
        "ZeroMQ": {
            "senderClassName": "Espo\\Core\\WebSocket\\ZeroMQSender",
            "subscriberClassName": "Espo\\Core\\WebSocket\\ZeroMQSubscriber"
        }
    }
}
```

### senderClassName

*class-string<Espo\Core\WebSocket\Sender\>*

### subscriberClassName

*class-string<Espo\Core\WebSocket\Subscriber\>*
