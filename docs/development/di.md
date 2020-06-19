# Dependency Injection

Note: This article is actual for v5.10.0 and greater.

There are two different DI frameworks in Espo. The first utilizes *container* object, the second – *injectableFactory*.

Two types of classes:

* Container services
* Classes created by *injectableFactory*

## Container services

Note: Don't confuse with *Service* classes.

Contaner services are instantiated by *Container* object (instance of `\Espo\Core\Container`). Lazy initialization is used.

Container services are defined in:

* container class `\Espo\Core\Container` (most critical functinalities that are not supposed to be extended);
* loader classes in `\Espo\Core\Loaders` namespace (can be customized in `\Espo\Custom\Core\Loaders`);
* metadata (app > containerServices).

*Container* instance is available in Controller classes.

Usage in controller class:

```php
$serviceFactory = $this->getContainer()->get('serviceFactory');
```

### Defining in metadata

If you need to define your custom container services, do it in metadata:

* `custom/Espo/Resources/metadata/app/containserServices.json`;
* or in your module folder.

Example of definition:

```json
{
    "notificatorFactory": {
        "className": "\\Espo\\Core\\NotificatorFactory"
    },
    "clientManager": {
        "className": "\\Espo\\Core\\Utils\\ClientManager",
        "dependencyList": ["config", "themeManager", "metadata"]
    }
}
```

Dependencies will be passed to the class constructor.

If *dependencyList* is not defined, then class constructor parameter names will be used to detect dependencies. 

For example, if the parameter name is `$entityManager`, then *entityMaanger* container service will be passed.

```php
namespace Espo\Custom;

class SomeClass
{
    protected $entityManager;
    
    public function __construct(\Espo\ORM\EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }
}
```

## Classes created by injectableFactory

*injectableFactory* can be obtained from *Container*.

Usage:

```php
$injectableFactory->create($className);
```

There are two types of classes that can be created by *injectableFactory*:

* those that does not implement *Injectable* interface
* those that implement *Injectable* interface

If class doesn't implement *Injectable* interface, then class constructor parameter names will be used to detect dependency. 

For example, if the parameter name is `$entityManager`, then *entityMaanger* container service will be passed.

Class:

```php
namespace Espo\Custom;

class SomeClass
{
    protected $entityManager;
    
    public function __construct(\Espo\ORM\EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }
}
```

Instantiating:

```php
$injectableFactory->create('\\Espo\\Custom\\SomeClass');
```

Only container services can be used for dependencies.

### Injectable interface

Interface: `\Espo\Core\Interfaces\Injectable`.

A class defines its dependencies by itself.

Only container services can be used as dependencies.

The following classes implement *Injectable* inteface:

* Services (`\Espo\Core\Services\Base`)
* Repositories (`\Espo\Core\ORM\Repositories\RDB`)
* Hooks (`\Espo\Core\Hooks\Base`)
* Notificators (`\Espo\Core\Notificators\Base`)
* Acl (`\Espo\Core\Acl\Base`)
* Cleanup (see metadata: app > cleanup)
* AppParams (see metadata: app > appParams)


Example:

```php
<?php
namespace Espo\Core\Password;

class Recovery implements \Espo\Core\Interfaces\Injectable
{
    use \Espo\Core\Traits\Injectable;

    public function __construct()
    {
        $this->addDependencyList([
            'entityManager',
            'config',
            'mailSender',
            'htmlizerFactory',
            'templateFileManager',
        ]);
    }

    public function someMethod()
    {
        $entityManager = $this->getInjection('entityManager');
    }
}
```

```php
$recovery = $injectableFactory->createByClassName('\\Espo\\Core\\Password\\Recovery');
```
