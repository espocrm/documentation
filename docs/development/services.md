# Service Classes

Note: Not to be confused with [*Container services*](di.md).

Services are entry points for business logic. You can write business logic right in a service class or delegate it inside the service to another classes.

Controllers are supposed to have little code. Usually a controller action calls some service method. 

The **main feature** of service classes that they can be re-defined in `Modules` or `Custom` directories.

Locations of service classes:

* `application/Espo/Services/`
* `application/Espo/Modules/{moduleName}/Services/`
* `custom/Espo/Custom/Services/`

Service instances are created by the *serviceFactory* (available as a container service, hence can be injected to the controller). [Dependencies](di.md) for service classes can be defined in a constructor or with *Aware* interfaces.

Note that you need to **clear cache** after creating a new service class.

To **customize** an existing service you need to create a class in the custom directory and extend it from the existing one. It's also possible to customize within a module directory. Make sure that the *order* param of your module is higher than the value of the module of the extended service.


## Creating new service class (example)

Actual as of v6.0.

Controller `custom/Espo/Custom/Controllers/Opportunity.php`:

```php
<?php

use Espo\Core\{
    ServiceFactory,
    Api\Request,
};

namespace Espo\Custom\Controllers;

class SomeController
{
    protected $serviceFactory;
    
    public function __construct(ServiceFactory $serviceFactory)
    {
        $this->serviceFactory = $serviceFactory;       
    }
    
    public function postActionHello(Request $request)
    {
        $service = $this->serviceFactory->create('HelloTest');
        
        $data = $request->getParsedBody();

        return $service->doSomething($data);
    }
}

```

Service `custom/Espo/Custom/Services/HelloTest.php`:

```php
<?php

namespace Espo\Custom\Services;

use Espo\Core\{
    Exceptions\BadRequest,
    Exceptions\Forbidden,
    Exceptions\NotFound,
    Acl,
    ORM\EntityManager,
};

use StdClass;

class HelloTest
{
    protected $acl;
    protected $entityManager;
    
    public function __construct(Acl $acl, EntityManager $entityManager)
    {
        $this->acl = $acl;
        $this->entityManager = $entityManager;        
    }
    
    public function doSomething(StdClass $data) : StdClass
    {
        if (!isset($data->id)) {
            throw new BadRequest();
        }

        $em = $this->entityManager');
        $acl = $this->'acl;

        $opportunity = $em->getEntity('Opportunity', $data->id);

        if (!$opportunity) {
            throw new NotFound();
        }
        
        if (!$acl->check($opportunity, 'edit')) {
            throw new Forbidden();
        }

        $opportunity->set('stage', 'Closed Won');
        $opportunity->set('probability', 100);

        $em->saveEntity($opportunity);

        return $opportunity->getValueMap();
    }
}
```

## Record service

Operations (CRUD and others) over entities (records) are handled by Record service class `Espo\Services\Record`. 

If there's a service class with a name that matches the name of the entity type, then that service class will be used as a record service class. It's supposed that that class extends base `Espo\Services\Record` class. Example: `Espo\Services\User` is treated as a Record service for the *User* entity type.


Main methods of the Record service class:

* read - get an entity
* create - create an entity
* update - update an entity
* delete - delete an entity
* find - get a list of entities, used by list view
* findLinked - get a list of related entities, used by relationship panels
* massUpdate
* massDelete
* findDuplicates
* loadAdditionalFields - to load additional fields for an entity before returning it, for detail view
* loadAdditionalFieldsForList - to load additiona fields, for list view

Hook-methods:

* beforeCreateEntity
* afterCreateEntity
* beforeUpdateEntity
* afterUpdateEntity
* beforeDeleteEntity
* afterDeletEntity

### Extending existing Record service

Service `custom/Espo/Custom/Services/Opportunity.php`:

```php
<?php

namespace Espo\Custom\Services;

use Espo\ORM\Entity;

use Espo\Modules\Crm\Services\Opportunity as BaseOpportunity

class Opportunity extends BaseOpportunity
{
    // load additional fields for detail view
    public function loadAdditionalFields(Entity $entity)
    {
        parent::loadAdditionalFields($entity);

        // here do some fetching

        $entity->set('myNotStorableField', $someValue);
    }

    protected function afterDeleteEntity(Entity $entity, $data)
    {
        // do something after entity is deleted
    }
}
```
