# Dependency Injection System

There are two types of classes that utilizes DI:

* Container Services
* Classes that implement *Injectable* interface

## Container services

Note: Don't confuse with *Service* classes.

Contaner services are instantiated by *Container* object (instance of `\Espo\Core\Container`). Lazy initialization is used.

Container services are defined in:

* container class `\Espo\Core\Container` (most critical functinalities that are not supposed to be extended);
* loader classes in `\Espo\Core\Loaders` namespace (can be customized in `\Espo\Custom\Core\Loaders`);
* metadata (app > containerServices).


Container is available in Controller classes.

Usage in controller class:

```php
$serviceFactory = $this->getContainer()->get('serviceFactory');
```

### Defining in metadata

If you need to define your custom container services, do it in metadata:

* `custom/Espo/Resources/metadata/app/containserServices.json`
* or in your module folder.

Example definition in metadata:

```json
{
    "clientManager": {
        "className": "\\Espo\\Core\\Utils\\ClientManager",
        "dependencyList": ["config", "themeManager", "metadata"]
    }
}
```

Dependencies will be passed to the class constructor.

## Non-container classes

Implements `\Espo\Core\Interfaces\Injectable` interface.

Can be instantiated by *InjectableFactory* (*injectableFactory* instance can be obtained from *container*).

## Injectable interface

Class defines its dependencies by itself.

Only container services can be used as dependencies.

The following classes implements *Injectable* inteface:

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
