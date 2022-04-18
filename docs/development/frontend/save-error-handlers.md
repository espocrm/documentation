# Save error handlers

When a record is being saved, it's possible to throw an exception in the backend and then handle it in the frontend.

In the backend the exception should is thrown with the *reason* parameter in the body. It can be done in a before-save hook.

```php

use Espo\Core\Exceptions\ConflictSilent;
use Espo\Core\Utils\Json;

throw ConflictSilent::createWithBody(
    'anyText',
    Json::encode([
        'reason' => 'myReason',
        'data' => [
            'someKey' => 'someValue',
        ],
    ])
);

```

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
