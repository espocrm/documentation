# API actions

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
    },
    {
        "route": "/TestNoAuth",
        "method": "get",
        "params": {
            "controller": "Test",
            "action": "test"
        },
        "noAuth": true
    }
]
```

The parameter `noAuth` allows making requests w/o authentication.

Controller:

```php
<?php

namespace Espo\Custom\Controllers;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;

class MyController
{
    private $someDependency;

    public function __construct(SomeDependency $someDependency)
    {
        $this->someDependency = $someDependency;
    }
    
    public function getActionDoSomething(Request $request, Response $response): void
    {
        $id = $request->getRouteParam('id'); // '001'
        
        // Assuming the request GET api/v1/Hello/test/001 has been sent,
        // a route parameter 'id' will equal '001'.
        
        $response->writeBody(
            json_encode($someData)
        );
        
        // You can either write data to the response or use return
        // Returned value will be encoded and written to the response.
    }
    
    public function postActionHelloWorld(Request $request, Response $response): void
    {
        $name = $request->getRouteParam('name'); 
         
        // Assuming the request POST api/v1/HelloWorld/someName has been sent,
        // a route parameter 'name' will equal 'someName'.
        
        $response->writeBody('true');
    }
}
```

You need to clear cache after changes.

## Extending existing controller

Example for Account scope.

Create a file (or modify if it already exists) `custom/Espo/Custom/Controllers/Account.php`.

```php
<?php

namespace Espo\Custom\Controllers;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;

class Account extends \Espo\Modules\Crm\Controllers\Account
{
    /**
     *  POST api/v1/Account/action/test
     */
    public function postActionTest(Request $request, Response $response): bool
    {
        $someParam = $request->getQueryParam('someParam'); // GET parameter
        
        $data = $request->getParsedBody(); // payload
        
        $someValue = $data->someKey ?? null;

        $response->setStatus(201); // example how to set custom response status code

        // call some service class here

        return $someData; // can be true, false, array or object.
    }

    /**
     *  GET api/v1/Account/action/test
     */
    public function getActionTest(Request $request, Response $response): void
    {
        $someParam = $request->getQueryParam('someParam'); // GET parameter
        
        // call some service class here

        $response->writeBody('true');
    }
}
```

Note: For Account entity type we extend `Espo\Modules\Crm\Controllers\Account`. Some entity types might not have controllers in `Espo\Modules\Crm\Controllers` namespace. They are defined in `Espo\Controllers` namespace.

## Custom controller

### In Custom folder

Create a file  `custom/Espo/Custom/Controllers/MyController.php`.

```php
<?php

namespace Espo\Custom\Controllers;

class MyController
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

class MyController
{
    // Dependencies are passed to the constructor.
}
```

Clear cache (Administration > Clear Cache).

## CRUD actions

```php
<?php

namespace Espo\Custom\Controllers;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;

class MyController
{   
    // Creates a record.
    public function postActionCreate(Request $request, Response $response)
    {    
    }

    // Reads a record.
    public function getActionRead(Request $request, Response $response)
    {    
    }
    
    // Updates a record.
    public function putActionUpdate(Request $request, Response $response)
    {    
    }
    
    // Deletes a record.
    public function deleteActionDelete(Request $request, Response $response)
    {    
    }
}
```

## Custom controller


Example:

```php
<?php

namespace Espo\Modules\MyModule\Controllers;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;

use SomeDependency;

use stdClass;

class MyController
{
    private $someDependency;

    public function __construct(SomeDependency $someDependency)
    {
        $this->someDependency = $someDependency;
    }

    public function putActionUpdate(Request $request, Response $response): stdClass
    {
        $id = $request->getRouteParam('id');
        $data = $request->getParsedBody();

        $result = $this->someDependency->doSomething($id, $data);
        
        // Response can be returned or written with `Response::writeBody`.
        return $result->toStdClass();
    }
}
```
