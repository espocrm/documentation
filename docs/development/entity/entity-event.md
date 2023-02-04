# Event Entity

!!! note

    If you create the entity through the GUI, that file will reside at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourEventEntityName}.json`. 
    
    If you create it as part of a module, the path should be created at `custom/Espo/Modules/{ModuleName}/Resources/metadata/clientDefs/{YourEventEntityName}.json`.

## Example entityDefs file
By default, creating a "Base Entity" from the Admin interface generates the following entityDefs file at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourEventEntityName}.json`.

```
{
    "fields": {
        "name": {
            "type": "varchar",
            "required": true,
            "trim": true,
            "pattern": "$noBadCharacters"
        },
        "status": {
            "type": "enum",
            "options": [
                "Planned",
                "Held",
                "Not Held"
            ],
            "default": "Planned",
            "style": {
                "Held": "success"
            },
            "audited": true
        },
        "dateStart": {
            "type": "datetimeOptional",
            "view": "crm:views/meeting/fields/date-start",
            "required": true,
            "default": "javascript: return this.dateTime.getNow(15);",
            "audited": true
        },
        "dateEnd": {
            "type": "datetimeOptional",
            "view": "crm:views/meeting/fields/date-end",
            "required": true,
            "after": "dateStart"
        },
        "isAllDay": {
            "type": "bool",
            "layoutListDisabled": true,
            "layoutDetailDisabled": true,
            "layoutMassUpdateDisabled": true
        },
        "duration": {
            "type": "duration",
            "start": "dateStart",
            "end": "dateEnd",
            "options": [
                300,
                600,
                900,
                1800,
                2700,
                3600,
                7200,
                10800
            ],
            "default": 300,
            "notStorable": true,
            "select": {
                "select": "TIMESTAMPDIFF_SECOND:(dateStart, dateEnd)"
            },
            "order": {
                "order": [
                    [
                        "TIMESTAMPDIFF_SECOND:(dateStart, dateEnd)",
                        "{direction}"
                    ]
                ]
            }
        },
        "parent": {
            "type": "linkParent",
            "entityList": [
                "Account",
                "Lead",
                "Contact"
            ]
        },
        "description": {
            "type": "text"
        },
        "reminders": {
            "type": "jsonArray",
            "notStorable": true,
            "view": "crm:views/meeting/fields/reminders",
            "layoutListDisabled": true
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
        "parent": {
            "type": "belongsToParent",
            "foreign": "testEntityEventChildren"
        },
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
        "orderBy": "dateStart",
        "order": "desc"
    },
    "indexes": {
        "dateStartStatus": {
            "columns": [
                "dateStart",
                "status"
            ]
        },
        "dateStart": {
            "columns": [
                "dateStart",
                "deleted"
            ]
        },
        "status": {
            "columns": [
                "status",
                "deleted"
            ]
        },
        "assignedUser": {
            "columns": [
                "assignedUserId",
                "deleted"
            ]
        },
        "assignedUserStatus": {
            "columns": [
                "assignedUserId",
                "status"
            ]
        }
    }
}
```