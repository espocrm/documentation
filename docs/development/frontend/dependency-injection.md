# Dependency injection in frontend

*As of v9.0.*

!!! note

    Using dependency injection in the frontend requires transpiling step. Hence, you need to use the [ext-template](https://github.com/espocrm/ext-template) repository for customization development.

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

