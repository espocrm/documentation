# Dependency Injection

Note: This article is actual as of v6.0.0.

There are two classes repsonsibe for the dependency injection in EspoCRM:

* Container – [class](https://github.com/espocrm/espocrm/blob/master/application/Espo/Core/Container.php)
* InjectableFactory – [class](https://github.com/espocrm/espocrm/blob/master/application/Espo/Core/InjectableFactory.php)

## Container services

Note: Not to be confused with *Service* classes.

The Contanier contains services. These services are supposed to be used in multiple places throughout the system.

**Lazy initialization** is used, meaning that a service is not loaded until it's asked (as a dependency or implicitly).

Container services are defined:

* by loader classes in `Espo\Core\Loaders` namespace (can be customized in `Espo\Custom\Core\Loaders`);
* in [metadata](metadata.md) (app > containerServices).

Note: The best practice is not to require the *container* in your classes, and never use it directly. A specific service can be required in a constructor or with Aware interface.

Console command that prints all available container services with their implementing classes:

```
php command.php app-info --container
```

Most used container services are listed [here](container-services.md).

### Defining in metadata

If you need to define your custom container services, do it in metadata. In your module or in the custom folder:

* `application/Espo/Modules/{YourModule}/Resources/metadata/app/containserServices.json`;
* `custom/Espo/Custom/Resources/metadata/app/containserServices.json`.

A definition example:

```json
{
    "myService": {
        "className": "Espo\\Modules\\MyModule\\MyService"
    }
}
```

Needed dependencies will be passed to a class constructor. Class constructor parameter names and type hinting will be used to detect dependencies.

For example, if a parameter name is `$entityManager`, then *entityMaanger* container service will be passed.

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\Core\ORM\EntityManager;

class MyService
{
    protected $entityManager;

    public function __construct(EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }
}
```

If there's no service with a matching name but a type hint for the parameter is a class, then a new instance of that class will be instantiated (by Injectable Factory).

## Injectable factory

Injectable Factory creates objects by a given class names resolving dependencies. It is available as a service in *container*. That means that *injectableFactory* can be required as a dependency.

Requiring *injectableFactory* as a dependency:

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\Core\InjectableFactory;
use Espo\Modules\MyModule\Something;

/**
 * It's a good practice to use factory classes for creating instances of specific types.
 * Your class will require the factory rather than `injectableFactory` service.
 */
class SomeFactory
{
    protected $injectableFactory;

    public function __construct(InjectableFactory $injectableFactory)
    {
        $this->injectableFactory = $injectableFactory;
    }

    public function create() : Something
    {
        return $this->injectableFactory->create(Something::class);
    }
}
```

### Constructor injection

#### Service dependencies

Constructor parameter names are used to detect dependencies on services.

For example, if the parameter name is `$entityManager`, then *entityManager* service will be passed.

Class:

```php
<?php
namespace Espo\Custom;

use Espo\Core\ORM\EntityManager;

class SomeClass
{
    protected $entityManager;

    // There's a service with the name 'entityManager'.
    public function __construct(EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }
}
```

Note: A type hint for a parameter should match a class of a service or be a parent class or interface. Otherwise the service won't be passed but a new instance will be created and passed into the constructor.

#### Non-service dependencies

If there's no service with the name that matches a parameter name, and a parameter's type hint is a class, then an instance will be created and passed as a dependency. A new instance will be created every time the dependency is requested. See below.

```php
<?php
namespace Espo\Custom;

use Espo\Modules\MyModule\SomeClass;

class SomeClass
{
    protected $something;

    // There's no service with the name 'something' and type hint is a class.
    // Hence an instance of SomeClass is created and passed to the constructor.
    public function __construct(SomeClass $something)
    {
        $this->something = $something;
    }
}
```

### Setter method injection

Can be used along with the constructor injection. If a class implements *Aware* interface, the factory will use a corresponding setter function to inject a dependency. Setter traits can be utilized for adding setter functions into your class.

Example:

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

Using setter injections may be reasonable when you are extending from an existing class and want to add additional dependencies.

Important: Only services can be injected via setters.

### Manual instantiating

```php
<?php
use Espo\Custom\SomeClass;

$injectableFactory->create(SomeClass::class);
```

You can specify constructor injections explicitly using *createdWith* method. Those that are not specified, will be tried to be resolved using *ReflectionClass*.

```php
<?php

$injectableFactory->createWith($className, [
    'parameterName1' => $value1,
    'parameterName2' => $value2,
]);
```

### Classes created by injectableFactory

The following classes are created by *injectableFactory*:

* ApplicationRunners - `Espo\Core\ApplicationRunners`
* Controllers - `Espo\Controllers`
* Services - `Espo\Services`
* Hooks - `Espo\Hooks`
* Jobs - `Espo\Jobs`
* EntryPoints - `Espo\EntryPoints`
* Repositories - `Espo\Repositories`
* SelectManagers - `Espo\SelectManagers`
* Notificators - `Espo\Notificators`
* Acl - `Espo\Acl`
* Formula Functions
* Cleanup - defined in metadata: app > cleanup
* AppParams - defined in metadata: app > appParams

And many others. You can use `grep -R 'injectableFactory'` to find where it's used in Espo.

## See also

* [Container services](container-services.md)