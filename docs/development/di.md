# Dependency Injection

Note: This article is actual for v5.10.0 and greater.

There are wo types of classes, that utilize dependency injection.

* Container services
* Classes created by *injectableFactory*

## Container services

Note: Don't confuse with *Service* classes.

Contaner services are instantiated by *Container* object (instance of `Espo\Core\Container`). **Lazy initialization** is used.

Container services are defined in:

* container class `Espo\Core\Container` (most critical functinalities that are not supposed to be extended);
* loader classes in `Espo\Core\Loaders` namespace (can be customized in `Espo\Custom\Core\Loaders`);
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

use Espo\ORM\EntityManager;

class SomeClass
{
    protected $entityManager;
    
    public function __construct(EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }
}
```

## Classes created by injectableFactory

*injectableFactory* can be obtained from *Container*. It can be passed to the constructor if the object is created through DI mechanism.

Usage:

```php
$injectableFactory->create($className);
```

### Constructor injection

Constructor parameter names will be used to detect dependencies (if the class doesn't implement *Injectable* interface).

For example, if the parameter name is `$entityManager`, then *entityMaanger* container service will be passed.

Class:

```php
<?php
namespace Espo\Custom;

use Espo\ORM\EntityManager;

class SomeClass
{
    protected $entityManager;
    
    public function __construct(EntityManager $entityManager)
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

You can specify constructor injections explicitly using *createdWith* method. Those that are not specified, will be tried to be resolved using *ReflectionClass*.

```php
$injectableFactory->createWith($className, [
    'parameterName1' => $value1,
    'parameterName2' => $value2,
]);
```

### Setter method injection

Can be used along with the constructor injection.

```php
<?php
namespace Espo\Custom;

use Espo\Core\Di;

class MyClass implements Di\EntityManagerAware, Di\MetadataAware
{
    use Di\EntityManagerSetter;
    use Di\MetadataSetter;
    
    public function someMethod()
    {
        $entityManager = $this->entityManager;
        $metadata = $this->metadata;
    }
}
```

### Classes using injectableFactory

The following classes are created by *injectableFactory*:

* Services - `Espo\Services`
* Repositories - `Espo\Repositories`
* Hooks - `Espo\Hooks`
* Notificators - `Espo\Notificators`
* Acl - `Espo\Acl`
* Jobs - `Espo\Jobs`
* EntryPoints - `Espo\EntryPoints`
* Formula Functions
* Cleanup - defined in metadata: app > cleanup
* AppParams - defined in metadata: app > appParams

And more others. You can use `grep -R 'injectableFactory'` to find where it's used in Espo.

### Injectable interace

Using *Injectable* interface is deprecated. It's left for backward compatibility.
