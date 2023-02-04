# Base Entity
The Base Entity refers to an Entity that doesn't have associations to Tasks, Activities, and/or History by default. If your entity needs those relationshps out of the box, refer to [Base Plus](../entity/entity-plus.md).

Entity properties are defined in an entityDefs file. 

!!! note 

    If you create the entity through the GUI, that file will reside at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourBaseEntityName}.json`. 
    
    If you create it as part of a module, the path should be created at `custom/Espo/Modules/{ModuleName}/Resources/metadata/clientDefs/{YourBaseEntityName}.json`.

## Example entityDefs file
By default, creating a "Base Entity" from the Admin interface generates the following entityDefs file at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourBaseEntityName}.json`.

```
{
    "fields": {
        "name": {
            "type": "varchar",
            "required": true,
            "trim": true,
            "pattern": "$noBadCharacters"
        },
        "description": {
            "type": "text"
        },
        "createdAt": {
            "type": "datetime",
            "readOnly": true
        },
        "modifiedAt": {
            "type": "datetime",
            "readOnly": true
        },
        "createdBy": {
            "type": "link",
            "readOnly": true,
            "view": "views/fields/user"
        },
        "modifiedBy": {
            "type": "link",
            "readOnly": true,
            "view": "views/fields/user"
        },
        "assignedUser": {
            "type": "link",
            "required": true,
            "view": "views/fields/assigned-user"
        },
        "teams": {
            "type": "linkMultiple",
            "view": "views/fields/teams"
        }
    },
    "links": {
        "createdBy": {
            "type": "belongsTo",
            "entity": "User"
        },
        "modifiedBy": {
            "type": "belongsTo",
            "entity": "User"
        },
        "assignedUser": {
            "type": "belongsTo",
            "entity": "User"
        },
        "teams": {
            "type": "hasMany",
            "entity": "Team",
            "relationName": "EntityTeam",
            "layoutRelationshipsDisabled": true
        }
    },
    "collection": {
        "orderBy": "createdAt",
        "order": "desc"
    },
    "indexes": {
        "name": {
            "columns": [
                "name",
                "deleted"
            ]
        },
        "assignedUser": {
            "columns": [
                "assignedUserId",
                "deleted"
            ]
        }
    }
}
```