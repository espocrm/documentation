# Save error handlers

When a record is being saved, it's possible to throw an exception in the backend and then handle it in the frontend.

In the backend the exception should is thrown with the *reason* parameter in the body. It can be done in a before-save hook. Only `Conflict` and `Error` exceptions are supported.

```php
<?php
use Espo\Core\Exceptions\ConflictSilent;
use Espo\Core\Utils\Json;

throw ConflictSilent::createWithBody(
    'myReason',
    Json::encode([
        'someKey1' => 'someValue1',
        'someKey2' => 'someValue2',
    ])
);
```

!!! note

    It's also possible to throw exceptions in [API before-save script](../../administration/api-before-save-script.md).

Define a handler in metadata.

`custom/Espo/Custom/Resources/metadata/clientDefs/{EntityType}.json`:

```json
{
    "saveErrorHandlers": {
        "myReason": "custom:my-error-handler"
    }
}
```

It's also possible to define handlers for all entity types in `custom/Espo/Custom/Resources/metadata/clientDefs/Global.json`.

Create a handler `client/custom/src/my-error-handler.js`:

```js

define('custom:my-error-handler', [], function () {

    return class {
        constructor(view) {
            this.view = view;
        }

        process(data) {
            Espo.Ui.error('Some error message.', true);
            
            // Some logic.
        }
    }
});
```
