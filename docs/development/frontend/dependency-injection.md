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

    /**
     * @type {Settings}
     */
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

### storage

`storage`

A local browser storage. Stored values preserved when re-visiting the site from the same device.

### session-storage

`session-storage`

A session browser storage. Stored values are not preserved when re-visiting the site.

### settings

`models/settings`

Config parameters.

### preferences

`models/preferences`

User preferences parameters.

### user

`models/user`

A current user.

### language

`language`

Label translation functions.

### metadata

`metadata`

Application metadata.

### app-params

`app-params`

Application parameters.

### model-factory

`model-factory`

Creates models for specific entity types.

### collection-factory

`collection-factory`

Creates collections for specific entity types.

### acl-manager

`acl-manager`

Access control checking functions.

### field-manager

`field-manager`

A util related to record fields.

### date-time

`date-time`

A date-time util.

### theme-manager

`theme-manager`

Theme related functions.

### number-util

`number-util`

A number util. For working with numbers.

### view-helper

`view-helper`

A view helper. Markdown, sanitizing, etc.

### layout-manager

`layout-manager`

A record layout provider.

### router

`router`

Navigation and routing functions. The confirm leave-out functionality.

### web-socket-manager

`web-socket-manager`

Web-socket functions.

### broadcast-channel

`broadcast-channel`

For communication between browser tabs.

### page-title

`page-title`

A page title util.

