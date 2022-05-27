# Modules

The best practice is to place all customizations in a specific module directory.

Modules are available at `application/Espo/Modules/`. You can create a new directory with a name in CamelCase. That will be your module.

## Order

Every module has its *order* property. The order is used by the system to define which module to load firts. For example, if two modules have some metadata with the same key, the metadata of the module that has a higher order will be used. If two modules have the controller classes with the same name, then the class of the module that has a higher order will be used.

The *order* property is defined in `application/Espo/Modules/{YourModule}/Resources/module.json`:

```json
{
    "order": 16
}
```

Note that you need to clear cache after making changes.

## Routes

A module can define additional [API routes](api-action.md#routing). They are defined in `application/Espo/Modules/{YourModule}/Resources/routes.json`.

Note that you need to clear cache after making changes.

## Classes

Your module can contain classes of the following types (each in separate directories):

* Controllers
* Entities
* EntryPoints
* Hooks
* Jobs
* Repositories
* Services

Example: `application/Espo/Modules/{YourModule}/Entities/MyCustomEntity.php`.

Note that you need to clear cache after creating new classes.

You can also create any classes for your logic. In what directories to place and how to name them is at your discretion.

## Frontend files

Frontend files should be placed in a separate directory: `client/modules/{module-name}/`. Note that the folder name should be in hyphen.
