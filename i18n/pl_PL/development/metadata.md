# Metadata

Metadata is intended for: storing system data such as entity's fields and relationships; specifying frontend controllers, views, panels; defining fields, dashlets; and other data needed for the application.


## How to access

#### Backend

Metadata object of `Espo\Core\Utils\Metadata` class can be access from Container. Path to a needed parameter is specified using dots `.`.

```php
$metadata->get('entityDefs.Account.fields.name.type')
```
will return `'varchar'`.

```php
$metadata->get('entityDefs.Account.fields')
```
will return an associative array of all fields.

#### Frontend

Metadata object is accessible from all view objects by method `#getMetadata`. It works the same way as backend's one.

```JavaScript
this.getMetadata().get('entityDefs.Account.fields.name.type')
```


## How is it stored

Metadata is stored in JSON files that can be located in different places:

* application/Espo/Resources/metadata/
* custom/Espo/Custom/Resources/metadata/
* application/Espo/Modules/{MODULE_NAME}/Resources/metadata/

When you access data by path `clientDefs.Account.views.edit` the first lexeme `clientDefs` corresponds to dir name, the second `Account` to file name `Account.json`. All following lexemes correspond to path in the JSON.
```json
{
  "views": {
    "edit": "crm:views/account/views/edit" 
  }
}
```

All JSON files from these directories get merged recursively into a single php array and stored in a cache file. 


## Extending

Since metadata is merged recursively you can easily redefine json objects and arrays in _custom_ and in your _module_. Also you can append to existing arrays by using `__APPEND__` (since version 2.6.0) as the first element of array.

`custom/Espo/Custom/Resources/Metadata/entityDefs/Account.json`

```json
{
  "fields": {
    "employeeCount": {
      "type": "int"
    },
    "type": {
      "options": ["__APPEND__", "Drug dealer", "Lawyer"]
    }
  }
}
```
