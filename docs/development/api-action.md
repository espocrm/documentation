# Custom API action

## Extending existing controller

Example for Account scope.

Create a file (or modify if it already exists) `custom/Espo/Custom/Controllers/Account.php`.

```php
<?php

namespace Espo\Custom\Controllers;

class Account extends \Espo\Modules\Crm\Controllers\Account
{
    /**
     *  POST api/v1/Account/action/test
     */
    public function postActionTest($params, $data, $request, $response)
    {
        // $data - payload
        
        $someValue = $data->someKey ?? null;

        $response->setStatus(201); // this is optional, example how to set custom response status code
        
        // $someData = $this->getContainer()->get('serviceFactory')->create('MyService')
        //    ->doSomething($data);

        return $someData; // can be true, false, array or object.
    }

    /**
     *  GET api/v1/Account/action/test
     */
    public function getActionTest($params, $data, $request)
    {
        $myUriParam = $request->get('myUriParam');

        return $someData; // can be true, false, array or object.
    }
}
```

Note: For Account entity type we extend `\Espo\Modules\Crm\Controllers\Account`. Some entity types might not have controllers in `\Espo\Modules\Crm\Controllers` namespace. They are defined in `\Espo\Controllers` namespace.

## Custom controller

### In Custom folder

Create a file  `custom/Espo/Custom/Controllers/MyController.php`.

```php
<?php

namespace Espo\Custom\Controllers;

class MyController extends \Espo\Core\Controllers\Base
{

}
```

Clear cache (Administration > Clear Cache).

### In Module folder

Create a file `custom/Espo/Modules/MyModule/Resources/metadata/scopes/MyController.json`.

```json
{
    "module": "MyModule"
}
```

Create a file `custom/Espo/Modules/MyModule/Controllers/MyController.php`.

```php
<?php

namespace Espo\Modules\MyModule\Controllers;

class MyController extends \Espo\Core\Controllers\Base
{

}
```

Clear cache (Administration > Clear Cache).

## Routing

You can define a specific route to access your api action.

Default routes are defined here `application/Espo/Resources/routes.json`.

Custom routes can be defined in following places:

* `application/Espo/Modules/{moduleName}/Resources/routes.json`
* `custom/Espo/Custom/Resources/routes.json`

### Example

`routes.json`

```json
[
    {
        "route": "/Hello/test/:id",
        "method": "get",
        "params": {
            "controller": "MyController",
            "action": "doSomething",
            "id": ":id"
        }
    },
    {
        "route": "/HelloWorld/:name",
        "method": "post",
        "params": {
            "controller": "MyController",
            "action": "helloWorld",
            "name": ":name"
        }
    }
]
```

Controller:

```php
<?php

namespace Espo\Custom\Controllers;

class MyController extends \Espo\Core\Controllers\Base
{
    /**
     *  GET api/v1/Hello/test/001
     */
    public function getActionDoSomething($params, $data, $request)
    {
        $id = $params['id']; // '001'
        
        // ...
    }
    
    /**
     *  POST api/v1/HelloWorld/someName
     */
    public function postActionHelloWrold($params, $data, $request)
    {
        $name = $params['name']; // 'someName'
        
        // ...
    }
}
```

