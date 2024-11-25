# Dependency injection in frontend

*As of v9.0.*

!!! note

    Using dependency injection in the frontend requires transpiling step. Hence, you need to use the [ext-template](https://github.com/espocrm/ext-template) repository for customization development.

In this article:

* [Injecting](#injecting)
* [Registering](#registering)
* [Built-in services](#built-in-services)

## Injecting

To inject a service into a class, apply *@inject* decorator with a needed class to a class property. Note that the injected class must be registered as a service.

Example:

```js
import {inject} from 'di';
import Settings from 'models/settings';

class MyHelper {

    @inject(Settings)
    config
}
```

## Registering

To register a service, apply *@register* decorator to a class.

Example:

```js
import {register} from 'di';

@register()
class MyService {

}
```

## Built-in services

### router

`router`

### storage

`storage`

### session-storage

`session-storage`

### settings

`models/settings`

### preferences

`models/preferences`

### user

`models/user`

### language

`language`

### metadata

`metadata`

### model-factory

`model-factory`

### collection-factory

`collection-factory`

### field-manager

`field-manager`

### acl-manager

`acl-manager`

### date-time

`date-time`

### theme-manager

`theme-manager`

### number-util

`number-util`

### view-helper

`view-helper`

### layout-manager

`layout-manager`

### web-socket-manager

`web-socket-manager`

### broadcast-channel

`broadcast-channel`



