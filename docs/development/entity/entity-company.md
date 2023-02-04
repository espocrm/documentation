# Company Entity
The Company Entity can be used to create a company or organization distinct from the default "Account" Entity that ships with EspoCRM. It includes address fields and links to Tasks, Meetings, Calls, and Emails (Activities & History) by default.

!!! note

    If you create the entity through the GUI, that file will reside at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourCompanyEntityName}.json`. 
    
    If you create it as part of a module, the path should be created at `custom/Espo/Modules/{ModuleName}/Resources/metadata/clientDefs/{YourCompanyEntityName}.json`.

## Example entityDefs file
By default, creating a "Base Entity" from the Admin interface generates the following entityDefs file at `custom/Espo/Custom/Resources/metadata/entityDefs/{YourCompanyEntityName}.json`.

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
        "website": {
            "type": "url",
            "strip": true
        },
        "emailAddress": {
            "type": "email"
        },
        "phoneNumber": {
            "type": "phone",
            "typeList": [
                "Office",
                "Mobile",
                "Fax",
                "Other"
            ],
            "defaultType": "Office"
        },
        "billingAddress": {
            "type": "address"
        },
        "billingAddressStreet": {
            "type": "text",
            "maxLength": 255,
            "dbType": "varchar"
        },
        "billingAddressCity": {
            "type": "varchar",
            "trim": true
        },
        "billingAddressState": {
            "type": "varchar",
            "trim": true
        },
        "billingAddressCountry": {
            "type": "varchar",
            "trim": true
        },
        "billingAddressPostalCode": {
            "type": "varchar",
            "trim": true
        },
        "shippingAddress": {
            "type": "address",
            "view": "crm:views/account/fields/shipping-address"
        },
        "shippingAddressStreet": {
            "type": "text",
            "maxLength": 255,
            "dbType": "varchar"
        },
        "shippingAddressCity": {
            "type": "varchar",
            "trim": true
        },
        "shippingAddressState": {
            "type": "varchar",
            "trim": true
        },
        "shippingAddressCountry": {
            "type": "varchar",
            "trim": true
        },
        "shippingAddressPostalCode": {
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