# Service classes

It's supposed to write business logic in services.

Locations of services:

* `application/Espo/Services/`
* `application/Espo/Modules/{moduleName}/Services/`
* `custom/Espo/Services/`

Service object is created by the service factory. Usually services are created inside controllers or another services.

Note, that you need to clear cache after creating a service class (file).

## Example

Controller `custom/Espo/Controllers/Opportunity.php`:

```php
<?php

namespace Espo\Custom\Controllers;

class Opportunity extends \Espo\Modules\Crm\Controllers\Opportunity
{
    public function postActionHello($params, $data, $request)
    {
        $service = $this->getContainer()->get('serviceFactory')->create('HelloTest');

        return $service->doSomething($data);
    }
}

```

Service `custom/Espo/Services/HelloTest.php`:

```php
<?php

namespace Espo\Custom\Services;

use Espo\Core\Exceptions\BadRequest;
use Espo\Core\Exceptions\Forbidden;
use Espo\Core\Exceptions\NotFound;

class HelloTest extends \Espo\Core\Services\Base
{
    // What will be injected on service creation
    //
    // List of available injections you can find here:  
    // * application/Espo/Core/Container.php
    // * application/Espo/Core/Loaders
    protected $dependencyList = [
        'entityManager',
        'acl',
    ];

    public function doSomething($data)
    {
        if (!isset($data->id)) throw new BadRequest();

        $em = $this->getInjection('entityManager');
        $acl = $this->getInjection('acl');

        $opportunity = $em->getEntity('Opportunity', $data->id);

        if (!$opportunity) throw new NotFound();        
        if (!$acl->check($opportunity, 'edit')) throw new Forbidden();

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

Service `custom/Espo/Services/Opportunity.php`:

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
