# Dependency Injection

Note: This article is actual as of v6.0.0.

In this article:

* [Container services](#container-services)
* [Injectable factory](#injectable-factory)
* [Binding](#binding)
* [See also](#see-also)

There are two classes repsonsibe for the dependency injection in EspoCRM:

* Container – `Espo\Core\Container` [class](https://github.com/espocrm/espocrm/blob/master/application/Espo/Core/Container.php);
* InjectableFactory – `Espo\Core\InjectableFactory` [class](https://github.com/espocrm/espocrm/blob/master/application/Espo/Core/InjectableFactory.php).

## Container services

Note: Not to be confused with *Service* classes.

The Contanier contains services. These services are supposed to be used in multiple places throughout the system.

**Lazy initialization** is used, meaning that a service is not loaded until it's asked (as a dependency or implicitly).

Container services are defined:

* in [metadata](metadata.md) (app > containerServices);
* by loader classes (in `Espo\Core\Loaders` namespace);

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

When defining in metadata there's 2 options:

* specify a class for a service;
* specify a loader that loads a service (the loader should implement `Espo\Core\Container\Loader` interface).

A definition example:

```json
{
    "myService1": {
        "className": "Espo\\Modules\\MyModule\\MyService1"
    },
    "myService2": {
        "loaderClassName": "Espo\\Modules\\MyModule\\MyService2Loader"
    }
}
```

Needed dependencies will be passed to a class constructor. Parameter type hinting and binding (processed on application start) will be used (via reflection) to detect dependencies.

Example:

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\Core\ORM\EntityManager;

class MyService1
{
    private $entityManager;

    public function __construct(EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }
}
```

If there's no matching service for a parameter but a type hint is a class, then a new instance of that class will be instantiated (by Injectable Factory).

## Injectable factory

The Injectable Factory creates objects by a given class names. It resolves and injects class dependencies. The Injectable Factory is available as a service in the Container. That means that *injectableFactory* can be required as a dependency.

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
    private $injectableFactory;

    public function __construct(InjectableFactory $injectableFactory)
    {
        $this->injectableFactory = $injectableFactory;
    }

    public function create(): Something
    {
        return $this->injectableFactory->create(Something::class);
    }
}
```

### Constructor injection

Constructor parameter names are used to detect dependencies.

Resolving process:

* Tries to resolve by binding (see below about binding); exit if succcess;
* Tries to resolve by a parameter name, assuming that parameter name matches a service name; exit if succcess;
* Creates a new instance if type hint is a class.

If there's no service with the name that matches a parameter name, and a parameter's type hint is a class, then an instance will be created and passed as a dependency. A new instance will be created every time the dependency is requested. See below.

Service 'entityMananger' as a dependency:

```php
<?php
namespace Espo\Custom;

use Espo\Core\ORM\EntityManager;

class SomeClass
{
    private $entityManager;

    // There's a service with the name 'entityManager'.
    public function __construct(EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }
}
```

Non-service depedency:

```php
<?php
namespace Espo\Custom;

use Espo\Modules\MyModule\SomeClass;

class SomeClass
{
    private $something;

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

    public function someMethod(): void
    {
        $entityManager = $this->entityManager;
        $metadata = $this->metadata;
    }
}
```

Using setter injections may be reasonable when you are extending from an existing class and want to add additional dependencies.

Important: Only services can be injected via setters.

Note: It's not a recommended way to inject dependencies. Use it as a last resort if you don't want to modify an existing constructor signature.

### Manual instantiating

This way is supposed to be utilized in factory classes.

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

Factory example:

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\Core\InjectableFactory;

/**
 * The factory instance is supposed to be passed as a dependency of some class.
 */
class SomeTypeFactory
{
    private $injectableFactory;
    
    public function __construct(InjectableFactory $injectableFactory)
    {
        $this->injectableFactory = $injectableFactory;
    }
    
    /**
     * The variable $userId will be used for the constructor parameter
     * with the name 'userId'.
     */
    public function create(string $userId): SomeType
    {
        return $this->injectableFactory->createWith(SomeType::class, [
            'userId' => $userId, 
        ]);
    }    
}

```

It's also possible to pass a binding container when creating with the injectable factory. More info below.

## Binding

Available as of v6.1.0.

There is the ability to bind interfaces to implementations and bind parameter names to specific values. Binding is used for resolving dependencies passed through a constructor.

Binding can be processed in the `Binding` classes in every module as well as in the *Custom*:

* `Espo\Modules\{ModuleName}\Binding`
* `Espo\Custom\Binding`

Note: The module order parameter is used when binding is processed. Meaning that modules with a lower order value will be processed first.

CLI command to print all bindings:

```
php command.php app-info --binding
```

Default binding is processed in `Espo\Core\Binding\DefaultBinding`.

### Example

File `application/Espo/Modules/MyModule/Binding.php`:

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\Core\Binding\Binder;

class Binding
{
    public function process(Binder $binder): void
    {
        $binder
            ->bindService('Espo\\SomeServiceName', 'someServiceName')
            ->bindImplementation('Espo\\SomeInterface', 'Espo\\SomeImplementation');

        $binder
            ->bindService('Espo\\SomeServiceName $name', 'anotherServiceName');
       
        $binder
            ->for('Espo\\SomeClass')
            ->bindImplementation('Espo\\SomeInterface', 'Espo\\SomeImplementation')
            ->bindValue('$paramName', 'Some Value')
            ->bindCallback(
                 '$anotherParamName', 
                 // callback arguments are resolved automatically
                 function (SomeDependency $dependency) {                     
                     return $dependency->getSomething();
                 }
             );
    }
}
```

Explanation:

* If any class requires `Espo\SomeServiceName`, give the container service `someServiceName`.
* If any class requires `Espo\SomeInterface`, give an instance of `Espo\SomeImplementation`.
* If any class requires `Espo\SomeServiceName ` and a parameter name is `$name`, then give `anotherServiceName` service.
* When `Espo\SomeClass` requires `Espo\SomeInterface`, give an instance of `Espo\SomeImplementation`.
* When `Espo\SomeClass` is instantiated, pass the value 'Same Value' for the parameter `$paramName`.
* When `Espo\SomeClass` is instantiated, use the callback to resolve a value of the parameter `$anotherParamName`.

### Binding to implementation

Bind an interface to a specific implementation.

```php
$binder->bindImplementation(SomeInterface::class, SomeImplementation::class);
```

### Binding to service

Bind an interface to a specific [service](container-services.md).

```php
$binder->bindService(SomeInterface::class, 'someServiceName');
```

### Binding to factory

As of v7.0.0.

Bind an interface to a specific factory so that a specific dependency will be created by a specific factory. The factory should implement `Espo\Core\Binding\Factory` interface.

```php
$binder->bindFactory(SomeInterface::class, SomeFactory::class);
```

### Binding to callback

A callback will be used for creatring a specific instance. The callback can have its own dependencies.

```php
$binder->bindCallback(SomeInterface::class, function (SomeDependency $dependency) {
    // Create an instance here.
    return $instance;
});
```

### Using with Injectable Factory

Available as of v7.0.0.

It's possible to override default binding when creating instances with the injectable factory (usually this will be processed in your factory classes).

The binding will be applied to all dependencies of the class, including dependencies of dependencies and so on.

Example:

```php
<?php

use Espo\Core\Binding\BindingContainerBuilder;
use Espo\Core\Binding\ContextualBinder;

$bindingContainer = BindingContainerBuilder::create()
    ->bindInstance(SomeInterface::class, $someInstance)
    ->inContext(SomeClass::class, function (ContextualBinder $binder): void {
        // Bind dependencies of `SomeClass`.
        $binder->bindValue('$parameterName', 'some value');
    })
    ->build();
    
$instance = $injectableFactory->createWithBinding(SomeClass::class, $bindingContainer);
```

The passed binding has a higher priority than the default binding (the default binding is applied globally too all objects resolved via DI).

## See also

* [Container services](container-services.md)
