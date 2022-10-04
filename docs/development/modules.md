# Modules

The best practice is to place all customizations in a module directory:

* `custom/Espo/Modules/{YourModule}/` – backend (CamelCase name);
* `client/custom/modules/{your-module}/` – frontend (hyphen name).

## Order

Every module has its *order* property. The order is used by the system to define which module to load firts. For example, if two modules have some metadata with the same key, the metadata of the module that has a higher order will be used. If two modules have the controller classes with the same name, then the class of the module that has a higher order will be used.

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
