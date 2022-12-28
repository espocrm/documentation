# Metadata

Metadata is intended for storing application data such as fields, relationships, front-end controllers, views, panels, dashlets etc.

In this article:

* [Reference](#reference)
* [Accessing](#accessing)
* [How it's stored](#how-its-stored)
* [Extending](#extending)

## Reference

* [scopes](metadata/scopes.md) – general parmeters for scopes and entity types
* [entityDefs](metadata/entity-defs.md) – entity defs (fields, links, indexes)
* [aclDefs](metadata/acl-defs.md) – access control for scopes and entity types
* [selectDefs](metadata/select-defs.md) – Select-framework defs for entity types
* [recordDefs](metadata/record-defs.md) – CRUD-specific defs for entity types
* [clientDefs](metadata/client-defs.md) – front-end defs for entity types
* [entityAcl](metadata/entity-acl.md) – access restriction for specific fields and links for entity types
* [pdfDefs](metadata/pdf-defs.md) – PDF generation defs for entity types
* [notificationDefs](metadata/notification-defs.md) – notification defs for entity types
* [streamDefs](metadata/stream-defs.md) – stream defs for entity types
* [fields](metadata/fields.md) – field types
* [dashlets](metadata/dashlets.md)
* [authenticationMethods](metadata/authentication-methods.md) – authentication methods
* [integrations](metadata/integrations.md)
* app – application definitions
  * [acl](metadata/app-acl.md) – access control
  * [aclPortal](metadata/app-acl-portal.md) – access control for portals
  * [actions](metadata/app-actions.md) – Action framework
  * [addressFormats](metadata/app-address-formats.md)
  * [adminPanel](metadata/app-admin-panel.md) – Administration panel
  * [api](metadata/app-api.md)
  * [appParams](metadata/app-app-params.md) – AppParams framework
  * [authentication](metadata/app-authentication.md)
  * [authentication2FAMethods](metadata/app-authentication-2fa-methods.md) – 2-factor authentication methods
  * [cleanup](metadata/app-cleanup.md)
  * [client](metadata/app-client.md) – front-end client
  * [clientRoutes](metadata/app-client-routes.md) – front-end routes
  * [complexExpression](metadata/app-complex-expression.md)
  * [config](metadata/app-config.md)
  * [consoleCommands](metadata/app-console-commands.md)
  * [containerServices](metadata/app-container-services.md)
  * [currency](metadata/app-currency.md)
  * [dateTime](metadata/app-date-time.md)
  * [defaultDashboardLayouts](metadata/app-default-dashboard-layouts.md)
  * [defaultDashboardOptions](metadata/app-default-dashboard-options.md)
  * [entityTemplateList](metadata/app-entity-template-list.md)
  * [export](metadata/app-export.md)
  * [fieldProcessing](metadata/app-field-processing.md)
  * [file](metadata/app-file.md)
  * [fileStorage](metadata/app-file-storage.md)
  * [formula](metadata/app-formula.md)
  * [hook](metadata/app-hook.md) – Hook framework
  * [image](metadata/app-image.md)
  * [jsLibs](metadata/app-js-libs.md) – JS libs
  * [language](metadata/app-language.md)
  * [](metadata/)
  * [](metadata/)
  * [](metadata/)
  * [](metadata/)
  * [](metadata/)
  * [](metadata/)
  * [](metadata/)
  * [rebuild](metadata/app-rebuild.md)
  * [webSocket](metadata/app-web-socket.md)


## Accessing

### Backend

The Metadata instance (of `Espo\Core\Utils\Metadata` class) is available as an [container service](di.md).

Path to a needed parameter is specified with an array.

```php
// entityDefs > Account > fields > type
$value = $metadata->get(['entityDefs', 'Account', 'fields', 'name', 'type']);
```
will return the string value `"varchar"`.

```php
$metadata->get(['entityDefs', 'Account', 'fields']);
```
will return an associative array with definitions of all fields.


### Frontend

Metadata object is accessible from all view objects by method `#getMetadata`. It works the same way as backend's one.

```JavaScript
this.getMetadata().get(['entityDefs', 'Account', 'fields', 'name', 'type']);
```


## How it's stored

Metadata is stored in JSON files that can be located in different places:

* `application/Espo/Resources/metadata`
* `application/Espo/Modules/{ModuleName}/Resources/metadata`
* `custom/Espo/Modules/{ModuleName}/Resources/metadata`
* `custom/Espo/Custom/Resources/metadata`

When you access data by a path `clientDefs.Account.views.edit` the first lexeme `clientDefs` corresponds to a dir name, the second `Account` – to a file name `Account.json`. All following lexemes correspond to a path in the JSON object.

```json
{
    "views": {
        "edit": "crm:views/account/views/edit" 
    }
}
```

All JSON files from these directories **get merged** recursively into a single file and stored in a cache. 

## Extending

Since metadata is merged recursively you can easily redefine JSON objects and arrays in the `custom` directory.

You can **append** values to existing arrays by using `"__APPEND__"` string as the first element of array.

`custom/Espo/Custom/Resources/metadata/entityDefs/Account.json`:

```json
{
    "fields": {
        "employeeCount": {
          "type": "int"
        },
        "type": {
            "options": [
                "__APPEND__",
                "Dealer",
                "Lawyer"
            ]
        }
    }
}
```
