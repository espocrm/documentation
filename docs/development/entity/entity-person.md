# Person Entity
The Person Entity has properties specific to an individual including salutation, name fields, and salutation. By default, it includes links to "Call," "Email," and "Meeting" entities (Activities) for tracking communication. It also, by default, includes a link to the Task Entity.

!!! note

    If you create the entity through the GUI, that file will reside at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourPersonEntityName}.json`. 
    
    If you create it as part of a module, the path should be created at `custom/Espo/Modules/{ModuleName}/Resources/metadata/clientDefs/{YourPersonEntityName}.json`.

## Example entityDefs file
By default, creating a "Base Entity" from the Admin interface generates the following entityDefs file at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourPersonEntityName}.json`.

```
{
    "fields": {
        "name": {
            "type": "personName",
            "isPersonalData": true
        },
        "salutationName": {
            "type": "enum",
            "options": [
                "",
                "Mr.",
                "Ms.",
                "Mrs.",
                "Dr."
            ]
        },
        "firstName": {
            "type": "varchar",
            "maxLength": 100,
            "trim": true
        },
        "lastName": {
            "type": "varchar",
            "maxLength": 100,
            "required": true,
            "trim": true
        },
        "description": {
            "type": "text"
        },
        "emailAddress": {
            "type": "email",
            "isPersonalData": true
        },
        "phoneNumber": {
            "type": "phone",
            "typeList": [
                "Mobile",
                "Office",
                "Home",
                "Fax",
                "Other"
            ],
            "defaultType": "Mobile",
            "isPersonalData": true
        },
        "address": {
            "type": "address",
            "isPersonalData": true
        },
        "addressStreet": {
            "type": "text",
            "maxLength": 255,
            "dbType": "varchar"
        },
        "addressCity": {
            "type": "varchar",
            "trim": true
        },
        "addressState": {
            "type": "varchar",
            "trim": true
        },
        "addressCountry": {
            "type": "varchar",
            "trim": true
        },
        "addressPostalCode": {
            "type": "varchar",
            "trim": true
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
            "required": false,
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
        }
    },
    "collection": {
        "orderBy": "createdAt",
        "order": "desc"
    },
    "indexes": {
        "firstName": {
            "columns": [
                "firstName",
                "deleted"
            ]
        },
        "name": {
            "columns": [
                "firstName",
                "lastName"
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