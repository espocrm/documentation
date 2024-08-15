# Modules

The best practice is to place customizations in a module directory:

* `custom/Espo/Modules/{YourModule}/` – backend (CamelCase name);
* `client/custom/modules/{your-module}/` – frontend (hyphen name).

## Order

Every module has its *order* property. The order is used by the system to define which module to load first. For example, if two modules have some metadata with the same key, the metadata of the module that has a higher order will be used. If two modules have the controller classes with the same name, then the class of the module that has a higher order will be used.

The *order* property is defined in `custom/Espo/Modules/{YourModule}/Resources/module.json`:

```json
{
    "order": 16
}
```

Requires clearing cache after changes.

## Routes

A module can define additional [API routes](api-action.md#routing). They are defined in `custom/Espo/Modules/{YourModule}/Resources/routes.json`.

Requires clearing cache after changes.

## Composer

You can create a `composer.json` in your module directory to include 3rd party libraries. To let Espo know about these libraries, you need to create an [autoload configuration file](autoload.md) in your module.

## JS modules

When referencing ES (or AMD) modules located in an Espo module, use the path: `module/{your-module}/*`. Example: `module/my-module/views/fields/my-field`.

When using [ext-template](https://github.com/espocrm/ext-template), the path to your Espo module will be automatically written in *jsconfig.json*. That will allow an IDE to properly locate module files. 
