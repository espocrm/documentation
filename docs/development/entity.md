# Entities

Entities are models that represent the data in your application. Fields are properties of the model that get stored in the database. 

By default, EspoCRM supports the following Entities:

- [Base Entity](../entity/entity-base)
- [Entity Plus](../entity/entity-plus) - An Entity that includes Activities, Tasks, and History by default.
- [Event Entity](../entity/entity-event) - An Entity that has calendar properties, by default
- [Person Entity](../entity/entity-person) - An Entity with details for a person, including an attribute to manage personal data.
- [Company Entity](../entity/entity-company) - An Entity with details for a company or organization.

## Entity Fields
Entities are made up of fields, which describe the entity's data and provide structure to the entity. The types of fields available are described [on the fields page](/administration/fields).

These fields are organized into an [entityDefs](/development/metadata/entity-defs) file that, by default, is created at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourBaseEntityName}.json` when using the GUI to create the interface.

When fields are updated via the GUI, updates are also stored in that file.

If you are creating a module, then the best practice is to organize entities as modules. If you do that, the file should be created at `custom/Espo/Modules/{ModuleName}/Resources/metadata/clientDefs/{YourBaseEntityName}.json`

!!! note
    If you create an Entity as a Module, but update it via the GUI, then the updates will write to `custom/Espo/Custom/Resources/metadata/entityDefs/{YourBaseEntityName}.json` AND NOT `custom/Espo/Modules/{ModuleName}/Resources/metadata/clientDefs/{YourBaseEntityName}.json`. If you update via the GUI and want the updates in your module, then you will need to copy the data from the default file into your module file. 

!!! note
    The system loads file data from `custom/Espo/Custom` _after_ `custom/Espo/Modules/`. If you define a field in entityDefs in your module and then update it via the GUI, the updates at `custom/Espo/Custom` will supercede your Module.

## Labels

While you define your schema in the entityDefs file of your Entity, the naming/labelling of those fields is managed in the Internationalization area of the application.

For example, if I define somefield "someEnumFieldName" in entityDefs:

```
"someEnumFieldName": {
    "type": "enum",
    "options": [
        "Option 1",
        "Option 2",
        "Option 3"
    ],
    "style": {
        "Option 1": null,
        "Option 2": null,
        "Option 3": null
    },
    "isSorted": true,
    "displayAsLabel": false,
    "audited": false,
    "readOnly": false,
    "inlineEditDisabled": false,
    "default": "Option 1",
    "tooltip": false,
    "isCustom": true
}
```

Then the labeling of that field name for the GUI will be managed at `custom/Espo/Custom/Resources/i18n/{someInID}/{SomeEntity}.json`

For example, in the "en_US" language file, it might look something like this:

`custom/Espo/Custom/Resources/i18n/en_US/SomeEntity.json`

```
{
    "fields": {
        "someEnumFieldName": "Enum Field Name for the GUI"
    },
    "tooltips": {
        "someEnumFieldName": "This is the text for my tooltip"
    },
    "options": {
        "someEnumFieldName": {
            "Option 1": "Option 1 Label for GUI",
            "Option 2": "Option 2 Label for GUI",
            "Option 3": "Option 3 Label for GUI",
        }
    }
}
```

When defining an Entity from the backend of the application, you need to keep this in mind as translations are not automatically defined for you.

