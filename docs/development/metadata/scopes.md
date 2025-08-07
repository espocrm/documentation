# scopes

Path: metadata > scopes > {ScopeName}.

Сontains scope definitions.

## entity

*boolean*

Whether the scope represents an entity type.

## object

*boolean*

Whether the entity is a business object. Means that it's not an entity for internal system purpose; an object entity represents some business entity.

## module

*string*

The the name of the module, where this scope is defined. Must be set if the entity type is defined in a module.

## stream

*boolean*

Whether the entity has the stream.

## importable

*boolean*

Whether the entity is available in the Import tool.

## layouts

*boolean*

Whether the entity is available in the Layout Manager tool.

## tab

*boolean*

Whether the scope is available as a navbar tab.

## tabAclPermission

*?string*

A permission level required for a user to have the scope available as a navbar tab. Examples: `portal`, `massUpdate`.

## type

*?string*

A template type of the entity.

Available values: Base, BasePlus, Person, Company, CategoryTree, Event.

## acl

*boolean|"boolean"*

Whether the scope is available in Roles. Available values: true, false, "boolean". Boolean means that it will be available in roles w/o actions.

## aclActionList

*string[]*

A list of available actions in Roles. Available item values: create, read, edit, delete, stream.

## aclLevelList

*string[]*

A list of available levels in Roles. Available item values: all, team, own, no.

## aclActionLevelListMap

Lists of available levels for specific actions in Roles.

Example:

```json
"aclActionLevelListMap": {
    "edit": ["own", "no"]
}
```

## aclPortal

*boolean|"boolean"*

Whether the scope is available in Portal Roles. Available values: true, false, "boolean". Boolean means that it will be available in roles w/o actions.

## aclPortalActionList

*string[]*

A list of available actions in Portal Roles. Available item values: create, read, edit, delete, stream.
      
## aclPortalLevelList

*string[]*

A list of available levels in Portal Roles. Available item values: all, account, contact, own, no.

## aclPortalActionLevelListMap

Lists of available levels for specific actions in Portal Roles.

Example:

```json
"aclPortalActionLevelListMap": {
    "edit": ["own", "no"]
}
```

## aclFieldLevelDisabled

*boolean*

*As of v8.2.*

Disable field level security.

## aclPortalFieldLevelDisabled

*boolean*

*As of v8.2.*

Disable field level security for portals.

## statusField
 
*string*

Defines a field that should be used as a status field.

## statusFieldLocked

*bool*

*As of v7.5.*

Disables the ability to change the status field.

## disabled

*boolean*

Disables the scope in the system.

## customizable

*boolean*

Whether the entity can be customized in the Entity Manager tool.

## isCustom

*boolean*

Entities created in the Entity Manager tool marked as custom.

## notifications

*boolean*

Whether notifications can be enabled for the entity.

## calendar

*boolean*

Whether the entity can be displayed on the Calendar.

## activity

Whether the entity can be displayed on the Activities panel.

## activityStatusList

*string[]*

Status values that determine that a record should be shown in the Activities panel.
      
## historyStatusList

*string[]*

Status values that determine that a record should be shown in the History panel.

## calendarOneDay

*boolean*

*As of v9.2.*

Display as one-day events in the calendar. Applicable only if the *calendar* parameter is enabled.

## languageIsGlobal

*boolean*

Language labels will be available for all users (not restricted by ACL).

## languageAclDisabled

*boolean*

Disables access control application for language labels. All labels of the scope will be available in the front-end regardless of user roles.

## kanbanStatusIgnoreList

*string[]*

Status values to be ignored on the Kanban view.

## kanbanOrderDisabled

*boolean*

Disable the ability to order items for users.

## hasPersonalData

*boolean*

Whether the entity may contain personal data.

## preserveAuditLog

*boolean*

*As of v9.0.*

Disables audit log cleanup. 

## exportFormatList

*string[]*

A list of allowed export formats.

Example:

```json
{
    "exportFormatList": ["csv"]
}
```

## currencyConversionAccessRequiredFieldList

*string[]*

*As of v7.5.*

When a user converts currency of an entity, edit access to all listed fields is checked. Otherwise, the operation will be forbidden.

## lastViewed

Force to be available in Last Viewed.

