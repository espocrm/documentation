# app > containerServices

Path: metadata > app > containerServices.

Definitions of [container services](../di.md#container-services). A service-name => defs map.

Example:

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

## className

*class-string*

A service class.

## loaderClassName

*class-string<Espo\Core\Container\Loader\>*

A service loader class. Should implement `Espo\Core\Container\Loader` interface.

## settable

*boolean*

Whether the service can be set to the container externally (with *set* method).
