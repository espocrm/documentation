# API actions

## Routing

You can define a specific route to access your custom API action (endpoint).

Default routes are defined here `application/Espo/Resources/routes.json`.

Custom routes can be defined in following places:

* `custom/Espo/Modules/{moduleName}/Resources/routes.json`
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
    },
    {
        "route": "/TestAction",
        "method": "get",
        "actionClassName": "Espo\\Modules\\MyModule\\Api\\GetTestAction"
    },
]
```

The parameter `noAuth` makes an endpoint not requring authentication.

You need to clear cache after changes in routing files.

## Action

*As of v7.4.*

A route can define an action class with the *actionClassName* parameter. Action classes should implement an interface `Espo\Core\Api\Action`.

Example:

```php
<?php
namespace Espo\Modules\MyModule\Api;

use Espo\Core\Api\Action;
use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
use Espo\Core\Api\ResponseComposer;

use Espo\Modules\MyModule\Service;

class MyAction implements Action
{
    public function __construct(private Service $service) {}

    public function process(Request $request): Response
    {
        $data = $this->service->get();

        return ResponseComposer::json($data);
    }
}
```

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

Clear cache after creating a new controller (Administration > Clear Cache).

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
    public function __construct(private SomeDependency $someDependency)
    {}

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

## Extending existing controller

Example for the *Account* scope.

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

Note: For the *Account* entity type we extend `Espo\Modules\Crm\Controllers\Account`.
Some entity types might not have controllers in `Espo\Modules\Crm\Controllers` namespace. They are defined in `Espo\Controllers` namespace.

## CRUD actions

```php
<?php

namespace Espo\Custom\Controllers;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;

class MyController
{   
    // Creates a record.
    public function postActionCreate(Request $request, Response $response): void
    {    
    }

    // Reads a record.
    public function getActionRead(Request $request, Response $response): void
    {    
    }
    
    // Updates a record.
    public function putActionUpdate(Request $request, Response $response): void
    {    
    }
    
    // Deletes a record.
    public function deleteActionDelete(Request $request, Response $response): void
    {    
    }
}
```

