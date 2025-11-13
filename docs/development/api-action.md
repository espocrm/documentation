# API actions

This article would be useful for those who needs to create a custom [API](api.md) action.

## Routing

You can define a specific route to access your API action (endpoint).

Default routes are defined here: `application/Espo/Resources/routes.json`.

Custom routes can be defined in the following places:

* `custom/Espo/Modules/{ModuleName}/Resources/routes.json`
* `custom/Espo/Custom/Resources/routes.json`

### Example

`routes.json`:

```json
[
    {
        "route": "/MyAction",
        "method": "get",
        "actionClassName": "Espo\\Modules\\MyModule\\Api\\GetMyAction"
    },
    {
        "route": "/MyScope/:id/something",
        "method": "post",
        "actionClassName": "Espo\\Modules\\MyModule\\Api\\PostMyScopeSomething"
    },
    {
        "route": "/TestNoAuth",
        "method": "get",
        "params": {
            "myParam1": "MyValue1",
            "myParam2": "MyValue2"
        },
        "noAuth": true
    }
]
```

Route parameters:

* *noAuth* makes the endpoint accessible without authentication.
* *method* specifies an HTTP method. The most used methods are: *get*, *post*, *put*, *delete*.
* *actionClassName* defines an action class name – the entry point of the route.
* *params* – used for controller implementation, not recommeded.

A route can contain placeholders (for example, `:id`). The value will be passed to the Action in the Request object.

A route can be processed either by an Action class or by a Controller.

The API endpoint for a particular route: `https://your-site/api/v1/{route}`.

Clearing cache is required after changes in routing files.

## Action

*As of v7.4.*

!!! note

    This is the preferable method.

The *actionClassName* parameter in a route definition defines the action class. The action class is an entry point. Action classes should implement the `Espo\Core\Api\Action` interface.

Example:

```php
<?php
namespace Espo\Modules\MyModule\Api;

use Espo\Core\Api\Action;
use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
use Espo\Core\Api\ResponseComposer;
use Espo\Core\Exceptions\BadRequest;

use RuntimeException;

use Espo\Modules\MyModule\Service;

class GetMyAction implements Action
{
    public function __construct(
        // Some class we delegate the logic to.
        private Service $service,
    ) {}

    public function process(Request $request): Response
    {
        // A route parameter value is passed in an URI, if defined in the route.
        // E.g. `/Hello/:id`.
        $id = $request->getRouteParam('id') ?? throw new RuntimeException();

        // Read payload.
        $someInputValue = $request->getParsedBody()->someKey ??
            throw new BadRequest("Key is not passed in payload.");

        // Delegate the logic to some class.
        $data = $this->service->get($id, $someInputValue);

        // Output the result as JSON.
        return ResponseComposer::json([
            'someKey' => $data->someKey,
        ]);
    }
}
```

## Route parameters

You can define arbitrary route parameters in route definitions. The defined parameters will be available in the action class. It may be useful if you want to use the same action class for different routes but don't want to use a placeholder parameter.

 `route.json`:

```json
[
    {
        "route": "Account/:id/myItems",
        "method": "get",
        "actionClassName": "Espo\\Modules\\MyModules\\Api\\GetItems",
        "params": {
            "entityType": "Account"
        }
    },
    {
        "route": "Contact/:id/myItems",
        "method": "get",
        "actionClassName": "Espo\\Modules\\MyModules\\Api\\GetItems",
        "params": {
            "entityType": "Contact"
        }
    }
]
```

In the action method:

```php
<?php
$entityType = $request->getRouteParam('entityType') ?? throw new RuntimeException();
```

Instead of defining a generic route `:entityType/:id/myItems`, we defined two separate routes for specific record types.

---

For most cases, the sections below won't be relevant and can be skipped.

## Controller

!!! note

    Using controllers is not advisable. Prefer actions instead.

A Controller is an alternative to an Action class. A Controller can contain multiple methods for different actions.

Example of `route.json` with routes mapped to controller actions:

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

### Custom controller


#### In Custom folder

Create a file  `custom/Espo/Custom/Controllers/MyController.php`.

```php
<?php
namespace Espo\Custom\Controllers;

class MyController
{}
```

Clear cache (Administration > Clear Cache).

#### In Module folder

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

    // Naming convention: `{method}Action{Action}`.
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

### Extending existing controller

!!! note

    Not recommended.

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
     * POST api/v1/Account/action/test
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
     * GET api/v1/Account/action/test
     */
    public function getActionTest(Request $request, Response $response): void
    {
        $someParam = $request->getQueryParam('someParam'); // GET parameter
        
        // call some service class here

        $response->writeBody('true');
    }
}
```

!!! note
    
    For the *Account* entity type, we extend `Espo\Modules\Crm\Controllers\Account`. 
    Some entity types might not have controllers in `Espo\Modules\Crm\Controllers` namespace. They are defined in `Espo\Controllers` namespace.

## CRUD actions

If a controller is used, the CRUD operations for a record are implemented using the methods shown below.

```php
<?php
namespace Espo\Custom\Controllers;

use Espo\Core\Api\Request;
use Espo\Core\Api\Response;

class MyController
{   
    // Creates a record.
    public function postActionCreate(Request $request, Response $response): void
    {}

    // Reads a record.
    public function getActionRead(Request $request, Response $response): void
    {}
    
    // Updates a record.
    public function putActionUpdate(Request $request, Response $response): void
    {}
    
    // Deletes a record.
    public function deleteActionDelete(Request $request, Response $response): void
    {}
}
```
