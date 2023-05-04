# Dependency Injection

The Dependency Injection framework provides needed dependencies to classes (usually via a constructor). E.g. if your hook needs the EntityManager service, you just  define it as a constructor parameter.

For example, your controller has a dependency on some service class. That service class has other dependencies (e.g. the entity manager, some utility classes), these dependencies can have their own dependencies and so on. You don't need to instantiate dependencies, you just define them in class constructors and the framework provides them automatically.

```
- MyController
    - MyService
        - EntityManager (container service)
        - MyUtilityClass1
            - EntityManager (container service)
            - FileStorageManager (container service)
        - MyUtilityClass2
```

In this article:

* [Container services](#container-services)
* [Injectable factory](#injectable-factory)
* [Binding](#binding)
* [See also](#see-also)

There are two classes responsible for the dependency injection in EspoCRM:

* Container – `Espo\Core\Container` [class](https://github.com/espocrm/espocrm/blob/master/application/Espo/Core/Container.php);
* InjectableFactory – `Espo\Core\InjectableFactory` [class](https://github.com/espocrm/espocrm/blob/master/application/Espo/Core/InjectableFactory.php).

## Container services

The Contanier contains services. These services are supposed to be used in multiple places throughout the system. **Lazy initialization** is used, meaning that a service is not loaded until it's asked (as a dependency).

Container services are defined:

* in [metadata](metadata.md) (app > containerServices);
* by loader classes (in `Espo\Core\Loaders` namespace);

!!! note

    The best practice is not to require the *container* in your classes, and never use it directly. A specific service can be required in a constructor or with Aware interface.

Console command that prints all available container services with their implementation classes:

```
bin/command app-info --container
```

Most used container services are listed [here](container-services.md).

### Defining

If you need to define your custom container services, do it in metadata. In your module or in the custom folder:

* `custom/Espo/Modules/{YourModule}/Resources/metadata/app/containerServices.json`;
* `custom/Espo/Custom/Resources/metadata/app/containerServices.json`.

When defining in metadata there are 2 options:

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

Then you need to bind a class name to the service.

File `custom/Espo/Modules/MyModule/Binding.php`:

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\Core\Binding\BindingProcessor;
use Espo\Core\Binding\Binder;

class Binding implements BindingProcessor
{
    public function process(Binder $binder): void
    {
        $binder->bindService('Espo\\Modules\\MyModule\\MyService1', 'myService1');
    }
}
```

Needed dependencies will be passed to a class constructor upon instantiation. Parameter type hinting and binding (processed on application start) will be used (via reflection) to detect dependencies.

Example:

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\ORM\EntityManager;

class MyService1
{
    public function __construct(private EntityManager $entityManager) {}
}
```

## Injectable factory

The Injectable Factory is a core class that creates objects resolving and injecting needed dependencies. Contollers, Entry Points, Hooks etc. all are created by the Injectable Factory (automatically by the framework).

The Injectable Factory is available as a service in the Container. That means that *injectableFactory* can be required as a dependency to be used directly.

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
    public function __construct(private InjectableFactory $injectableFactory) {}

    public function create(): Something
    {
        // Here can be logic that choose a specific class upon some criteria.
        return $this->injectableFactory->create(Something::class);
    }
}
```

### Constructor injection

*A recommended way.*

Constructor parameter names are used to detect dependencies.

Resolving process:

* Tries to resolve by binding (see below about binding); exits if success;
* Tries to resolve by a parameter name, assuming that parameter name matches a service name and the type hint matches the service class; exits if success;
* Creates a new instance if the type hint is a class.

If a dependency is not a service, a new instance will be created every time the dependency is requested. See below.

```php
<?php
namespace Espo\Custom;

use Espo\ORM\EntityManager;
use Espo\Modules\MyModule\SomeClass;

class SomeClass
{
    /**
     * EntityManager is a service. The same instance will be used for different classes.
     * SomeClass is not a service. It will be instantiated every time.
     */
    public function __construct(
        private EntityManager $entityManager,
        private SomeClass $some
    ) {}
}
```

### Setter method injection

*Not recommended. Was introduced for the ability to add dependencies to extended classes where it's not possible to change a constructor signature.*

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

Limitation: Only container services can be injected via setters.

!!! note

    It's not a recommended way to inject dependencies. Use it as a last resort if you don't want to modify an existing constructor signature.

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
    public function __construct(private InjectableFactory $injectableFactory) {}

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

There is the ability to bind interfaces to implementations and bind parameter names to specific values. Binding is used for resolving dependencies passed through a constructor.

Custom binding can be set up in a `Binding` class of a module:

* `Espo\Modules\{ModuleName}\Binding`
* `Espo\Custom\Binding`

!!! note

    The module order parameter is used when binding is processed. Meaning that modules with a lower order value will be processed first.

CLI command to print all bindings:

```
bin/command app-info --binding
```

The default binding is set up in `Espo\Binding`.

### Example

File `custom/Espo/Modules/MyModule/Binding.php`:

```php
<?php
namespace Espo\Modules\MyModule;

use Espo\Core\Binding\BindingProcessor;
use Espo\Core\Binding\Binder;

class Binding implements BindingProcessor
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
                 'Espo\\AnotherClass', 
                 // Callback arguments are resolved automatically.
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
* When `Espo\SomeClass` is instantiated, use the callback to resolve a value of the parameter with the type `Espo\AnotherClass`.

### Binding to implementation

Bind an interface to a specific implementation.

```php
<?php
$binder->bindImplementation(SomeInterface::class, SomeImplementation::class);
```

### Binding to service

Bind an interface to a specific [service](container-services.md).

```php
$binder->bindService(SomeInterface::class, 'someServiceName');
```

### Binding to factory

*As of v7.0.*

Bind an interface to a specific factory so that a specific dependency will be created by a specific factory. The factory should implement `Espo\Core\Binding\Factory` interface.

```php
<?php
$binder->bindFactory(SomeInterface::class, SomeFactory::class);
```

### Binding to callback

A callback will be used for creatring a specific instance. The callback can have its own dependencies.

```php
<?php
$binder->bindCallback(SomeInterface::class, function (SomeDependency $dependency) {
    // Create an instance here.
    return $instance;
});
```

### Using with Injectable Factory

*As of v7.0.*

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

The passed binding has a higher priority than the default binding (the default binding is applied globally to all objects resolved via DI).

## See also

* [Container services](container-services.md)
