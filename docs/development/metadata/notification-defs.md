# notificationDefs

Path: metadata > notificationDefs > {EntityType}.

## assignmentNotificatorClassName

*class-string*

An assignment notificator. Should implement `Espo\Core\Notification\AssignmentNotificator` interface. Processes assignment notifications. 
Called after entity is saved.  By default, `Espo\Core\Notification\DefaultAssignmentNotificator` is used.

## emailNotificationHandlerClassNameMap

*Object.<string, class-string>*

Email notification handlers. Should implement `Espo\Core\Notification\EmailNotificationHandler` interface. 
Handles a notification emails (supposed for adding CC, BCC addresses). Provides sender parameters for notification emails (e.g. setting Reply-To address).

Example:

```json
{
    "emailNotificationHandlerClassNameMap": {
        "notePost": "Espo\\Modules\\Crm\\Classes\\EmailNotificationHandlers\\CaseObj"
    }
}

```

## forceAssignmentNotificator

*boolean*

To force processing assignment notifications (upon record save). Otherwise, it may be bypassed in some scenarios (e.g. when the Stream is enabled 
for the entity type).

