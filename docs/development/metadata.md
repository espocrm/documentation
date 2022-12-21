# Metadata

Metadata is intended for: storing system data such as entity's fields and relationships, specifying frontend controllers, views, panels, defining fields, dashlets, and other data needed for the application.

Sections:

* [aclDefs](metadata/acl-defs.md) – access control for scopes and entity types
* [authenticationMethods](metadata/authentication-methods.md) – authentication methods
* [selectDefs](metadata/select-defs.md) – filters for entity types
* [recordDefs](metadata/record-defs.md) – CRUD-specific parameters for entity types
* [clientDefs](metadata/client-defs.md) – front-end parameters entity types
* [scopes](metadata/scopes.md) – general parmeters for scopes and entity types
* [entityAcl](metadata/entity-acl.md) – access restriction for specific fields and links for entity types
* [entityDefs](metadata/entity-defs.md) – entity definitions (fields, links, indexes etc.)
* [pdfDefs](metadata/pdf-defs.md)
* [fields](metadata/fields.md) – field types definitions
* [notificationDefs](notification-defs.md) – notification defs for entity types
* app – application definitions
  * [authentication](metadata/app-authentication.md)
  * [cleanup](metadata/app-cleanup.md)
  * [rebuild](metadata/app-rebuild.md)

## How to access

#### Backend

The Metadata instance (of `Espo\Core\Utils\Metadata` class) is available in DI Container.

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


#### Frontend

Metadata object is accessible from all view objects by method `#getMetadata`. It works the same way as backend's one.

```JavaScript
this.getMetadata().get(['entityDefs', 'Account', 'fields', 'name', 'type']);
```


## How it's stored

Metadata is stored in JSON files that can be located in different places:

* application/Espo/Resources/metadata/
* application/Espo/Modules/{MODULE_NAME}/Resources/metadata/
* custom/Espo/Modules/{MODULE_NAME}/Resources/metadata/
* custom/Espo/Custom/Resources/metadata/

When you access data by path `clientDefs.Account.views.edit` the first lexeme `clientDefs` corresponds to dir name, the second `Account` to file name `Account.json`. All following lexemes correspond to path in the JSON.
```json
{
    "views": {
        "edit": "crm:views/account/views/edit" 
    }
}
```

All JSON files from these directories **get merged** recursively into a single file and stored in a cache file. 


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
