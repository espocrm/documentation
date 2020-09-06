# Service classes

Services are entry points for business logic. You can write business logic right in a service class or delegate it to another classes.

Controllers are supposed to have little code. Usually a controller action calls some service method. 

The **main feature** of service classes that they can be re-defined in `Modules` or `Custom` directories.

Locations of services:

* `application/Espo/Services/`
* `application/Espo/Modules/{moduleName}/Services/`
* `custom/Espo/Custom/Services/`

Service objects are created by the *serviceFactory*. [Dependencies](di.md) can be defined in a constructor or with *Aware* interfaces.

Note that you need to clear cache after creating a service class.

To **customize** an existing service you need to create a class in the custom directory and extend it from the existing one. It's also possible to customize within a module directory. Make sure that the *order* param of your module is higher than the value of the module of the extended service.


## Example

Actual as of v6.0.

Controller `custom/Espo/Custom/Controllers/Opportunity.php`:

```php
<?php

use Espo\Core\{
    ServiceFactory,
    Api\Request
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

Operations (CRUD and others) over entities (records) are handled by Record service `application/Espo/Services/Record`. 

If your entity type belongs to a module, you can create its record service in `application/Espo/Modules/{moduleName}/Services/` directory. Otherwise the default record service will be used. You can also override existing record services in custom folder.

Main methods:

* read
* create
* update
* delete
* find - used by list view
* findLinked - used by relationship panels
* massUpdate
* massDelete
* findDuplicates
* loadAdditionalFields - for detail view
* loadAdditionalFieldsForList - for list view

Hook-methods:

* beforeCreateEntity
* afterCreateEntity
* beforeUpdateEntity
* afterUpdateEntity
* beforeDeleteEntity
* afterDeletEntity

Service `custom/Espo/Custom/Services/Opportunity.php`:

```php
<?php

namespace Espo\Custom\Services;

use Espo\ORM\Entity;

class Opportunity extends \Espo\Modules\Crm\Services\Opportunity
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
