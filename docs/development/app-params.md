# App Params

App params are returned by the back-end once a user logged in. You can use these params in the front-end. For example, a build-in parameter: the list of entity types available for printing to PDF.

## Custom app params

You can make the system to return custom parameters. This params can be unique for a current user (different user have different values in params).

Create a file: `custom/Espo/Custom/Resources/metadata/app/appParams.json`:

```json
{
    "myParam": {
        "className": "Espo\\Custom\\Core\\AppParams\\MyParam"
    }
}
```

Create a file `custom/Espo/Custom/Core/AppParams/MyParam.php`:

```php
<?php
namespace Espo\Custom\Core\AppParams;

// As of v7.2 it's recommended to implement the \Espo\Tools\App\AppParam interface.

class MyParam
{
    public function __construct(/** Pass needed dependencies. */)
    {
    }
    
    public function get(): mixed
    {
        // Value fetching logic.
        // Your value can be a scalar, array or stdClass.

        return $someValue;
    }
```

Clear cache.

In the front-end in a [View](view.md) you can access your parameter the following way:

```js
this.getHelper().getAppParam('myParam');
```
