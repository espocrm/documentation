# app > acl

Path: metadata > app > acl.

Access control level parameters for the system (excluding portals).

## mandatory

*Object.<string, Object\>*

Access levels forcibly applied for regular and API users. These roles can't be changed by Roles assigned to a user.

### scopeLevel

*Object.<string, (Object|boolean|string)\>*

Mandatory access levels for specific scopes.

Example:

```json
{
    "mandatory": {
        "scopeLevel": {
            "MyEntityType1": {
                "create": "yes",
                "read": "own",
                "edit": "own",
                "delete": "own",
                "stream": "team"
            },
            "MyScope1": true,
            "WorkingTimeRange": "WorkingTimeCalendar"
        }
    }
}
```

* If set to *false*, then users won't have access to the scope.
* True enables access to scopes w/o actions (scopes that have `"acl": "boolean"` in metadata > scopes).
* A string value makes the framework to use roles from another scope and apply it to our scope. It can be useful to have roles only for one parent scope, when child scopes uses roles of the parent scope. E.g. *WorkingTimeCalendar* is a parent, *WorkingTimeRange* is a child. In Roles the admin defines only access levels to *WorkingTimeCalendar*, *WorkingTimeRange* will have the same access levels.

### scopeFieldLevel

*Object.<string, Object.<string, Object|false\>\>*

Mandatory access levels for fields for scopific scopes (entity types). Available levels: *yes*, *no*. False disables access to a field.

Example:

```json
{
    "mandatory": {
        "scopeFieldLevel": {
            "MyEntityType": {
                "myField1": {
                    "read": "yes",
                    "edit": "no"
                },
                "myField2": false
            }
        }
    }
}
```

### fieldLevel

*Object.<string, (Object|false)>*

Mandatory access levels for fields for any scope (entity type). E.g. if we define access levels to a field *assignedUsers*, then all fields with the name *assignedUsers* will obtain defined access levels (regardles of an entity type).


Example:

```json
{
    "mandatory": {
        "fieldLevel": {
            "myField1": {
                "read": "yes",
                "edit": "no"
            },
            "myField2": false
        }
    }
}
```

## adminMandatory

*Object.<string, Object\>*

Access levels forcibly applied for admin users. This section has the same parameters as the *mandatory* section: scopeLevel, scopeFieldLevel, fieldLevel.

## strictDefault

*Object.<string, Object\>*

Access levels applied for regular and API users when access is not defined by Roles assigned to those users. This section has the same parameters as the *mandatory* section: scopeLevel, scopeFieldLevel, fieldLevel.

## valuePermissionList

*string*

The list of all available [permissions](../../administration/roles-management.md#special-permissions) in the system.

Example:

```json
{
    "valuePermissionList": [
        "assignmentPermission",
        "userPermission",
        "portalPermission",
        "groupEmailAccountPermission",
        "exportPermission",
        "massUpdatePermission",
        "followerManagementPermission",
        "dataPrivacyPermission"
    ]
}
```

Use `__APPEND__` as the first value if you want to extend the list.

## permissionsStrictDefaults

*Object.<string, "all"|"yes"|"team"|"own"\>*

Permissions applied for regular and API users when they are not defined by Roles assigned to those users.

Example:

```json
{
    "permissionsStrictDefaults": {
        "assignmentPermission": "no",
        "userPermission": "no",
        "portalPermission": "no",
        "groupEmailAccountPermission": "no",
        "exportPermission": "no",
        "massUpdatePermission": "no",
        "followerManagementPermission": "no",
        "dataPrivacyPermission": "no"
    }
}
```

## valuePermissionHighestLevels

*Object.<string, "all"|"yes"|"team"|"own"\>*

Highest levels for permissions.

Example:

```json
{
    "valuePermissionHighestLevels": {
        "assignmentPermission": "all",
        "userPermission": "all",
        "portalPermission": "yes",
        "groupEmailAccountPermission": "all",
        "exportPermission": "yes",
        "massUpdatePermission": "yes",
        "followerManagementPermission": "all",
        "dataPrivacyPermission": "yes"
    }
}
```
