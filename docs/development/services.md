# Service Classes

Note: Not to be confused with [*Container services*](di.md).

Services are entry points for business logic. You can write business logic right in a service class or delegate it inside the service to another classes. Controllers are supposed to have little code. Usually, a controller action calls some service method.

You can create a service class in any namespace you like (inside your module). Use the dependency injection to require this class in your custom controller (your class will be passed to the constructor of your controller).

## Record service

The Record Service is a layer to access records via API. It handles CRUD (and some others) operations  over entities (records).

The base class is `Espo\Services\Record` (an extension of `Espo\Core\Record\Service`).

If there's a service class with a name that matches the name of the entity type, then that service class will be used as a record service class. It's supposed that that class extends base `Espo\Services\Record` class. Example: `Espo\Services\User` is treated as a Record service for the *User* entity type. Note: You need to clear cache after creating a custom record service class.

Main methods of the Record service class:

* read - get an entity
* create - create an entity
* update - update an entity
* delete - delete an entity
* find - get a list of entities, used by list view
* findLinked - get a list of related entities, used by relationship panels
* loadAdditionalFields - to load additional fields for an entity before returning it, for detail view

Hook-methods:

* beforeCreateEntity
* afterCreateEntity
* beforeUpdateEntity
* afterUpdateEntity
* beforeDeleteEntity
* afterDeleteEntity

### Accessing record service

Record services can be accessed from the record service container `Espo\Core\Record\ServiceContainer`.

```php
$service = $this->recordServiceContainer->get($entityType);
```

If a record service class with the name of an entity type exists in `Espo\Custom\Services` namespace, it will be used instead of the default one.

## Creating new service class

Controller `custom/Espo/Custom/Controllers/SomeController.php`:

```php
<?php
namespace Espo\Custom\Controllers;

use Espo\Core\Exceptions\BadRequest;
use Espo\Core\Api\Request;
use Espo\Core\Api\Response;
use Espo\Custom\MyNamespace\MyService;

class SomeController
{
    public function __construct(private MyService $myService)
    {}

    public function postActionHello(Request $request, Response $response): void
    {
        $data = $request->getParsedBody();
        
        $id = $data->id ?? null;
        
        if (!$id) {
            throw new BadRequest();
        }

        $this->myService->doSomething($id);
        
        $response->writeBody('true');
    }
}
```

Service `custom/Espo/Custom/MyNamespace/MyService.php`:

```php
<?php
namespace Espo\Custom\MyNamespace;

use Espo\Core\Exceptions\Forbidden;
use Espo\Core\Exceptions\NotFound;
use Espo\Core\Acl;
use Espo\Core\Acl\Table;
use Espo\ORM\EntityManager;
use Espo\Modules\Entities\Opportunity;

class MyService
{
    public function __construct(private Acl $acl, private EntityManager $entityManager)
    {}

    public function doSomething(string $id): void
    {
        $opportunity = $this->entityManager->getEntityById(Opportunity::ENTITY_TYPE, $id);

        if (!$opportunity) {
            throw new NotFound();
        }

        if (!$this->acl->check($opportunity, Table::ACTION_EDIT)) {
            throw new Forbidden("No 'edit' access.");
        }

        $opportunity->set('stage', Opportunity::STATUS_CLOSED_WON);
        $opportunity->set('probability', 100);

        $this->entityManager->saveEntity($opportunity);
    }
}
```
