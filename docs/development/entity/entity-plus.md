# Base Plus Entity

The Base Plus Entity refers to an Entity that has associations to Tasks, Activities, and History by default. If your entity doesn't need those relationshps out of the box, refer to [Base Entity](../entity/entity-base.md).

Entity properties are defined in an entityDefs file. 

!!! note

    If you create the entity through the GUI, that file will reside at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourBaseEntityPlusName}.json`. 
    
    If you create it as part of a module, the path should be created at `custom/Espo/Modules/{ModuleName}/Resources/metadata/clientDefs/{YourBaseEntityPlusName}.json`.

## Example entityDefs file
By default, creating a "Base Entity" from the Admin interface generates the following entityDefs file at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourBaseEntityPlusName}.json`.

!!! note

    Note the additional fields in the "links" object. This is where the references to the Task, Meeting, Calls, and Email entities (e.g., Activities & History) are stored.


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
        },
        "meetings": {
            "type": "hasMany",
            "entity": "Meeting",
            "foreign": "parent",
            "layoutRelationshipsDisabled": true
        },
        "calls": {
            "type": "hasMany",
            "entity": "Call",
            "foreign": "parent",
            "layoutRelationshipsDisabled": true
        },
        "tasks": {
            "type": "hasChildren",
            "entity": "Task",
            "foreign": "parent",
            "layoutRelationshipsDisabled": true
        },
        "emails": {
            "type": "hasChildren",
            "entity": "Email",
            "foreign": "parent",
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