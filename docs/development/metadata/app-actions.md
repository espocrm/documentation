# app > actions

Path: metadata > app > actions.

Definitions for the [Action]() framework. An action-name => Object map. A called action is applied to a single record.

Example:

```json
{
    "convertCurrency": {
        "implementationClassName": "Espo\\Core\\Action\\Actions\\ConvertCurrency"
    },
    "merge": {
        "implementationClassName": "Espo\\Core\\Action\\Actions\\Merge"
    }
}
```

API endpoint: `POST Action`.

API payload params:

* entityType – *string*
* action – *string*
* id – *string*
* data – *Object.<string, mixed>*

## implementationClassName

An action class. Should implement `Espo\Core\Action\Action` interface. Can be overriden for a specific entity type at: recordDefs > {EntityType} > actions > {action} > implementationClassName.
