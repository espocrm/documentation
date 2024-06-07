# Service Classes

!!! note

    Not to be confused with [*Container services*](di.md).

Services are entry points for business logic. You can write business logic right in a service class or delegate it inside the service to another classes. Controllers are supposed to have little code. Usually, a controller action calls some service method.

You can create a service class in any namespace you like (inside your module). Use the dependency injection to require this class in your custom controller (your class will be passed to the constructor of your controller).

## Creating service class

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

## Record service

The Record Service is a layer to access records via API. It handles CRUD (and some others) operations over entities (records). It applies validation and access checks before saving or reading.

The base class `Espo\Core\Record\Service`.

Main methods of the Record service class:

* read – get an entity
* create – create an entity
* update – update an entity
* delete – delete an entity
* find – get a list of entities, used by list view
* findLinked – get a list of related entities, used by relationship panels
* loadAdditionalFields – to load additional fields for an entity before returning it, for detail view

!!! note
    
    Record services can be extended in the `Espo\Modules\{MyModule}\Services` namespace. But it's recommended to avoid extending.
    The framework allows customization by means of composition. See metadata > recordDefs.

### Accessing record service

Record services can be accessed from the record service container `Espo\Core\Record\ServiceContainer`.

```php
<?php
$service = $this->recordServiceContainer->get($entityType);
```
