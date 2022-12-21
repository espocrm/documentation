# scopes

Path: metadata > scopes > {ScopeName}.

Сontains scope definitions. A scope can define an entity type.

## entity

*{boolean}*

Whether the scope represents an entity type.

## object

*{boolean}*

Whether the entity is a business object. Means that it's not an entity for internal system purpose; an object entity represents some business entity.

## module

*string*

The the name of the module, where this scope is defined.

## stream

*{boolean}*

Whether the entity has the stream.

## importable

*{boolean}*

Whether the entity is avialble in the Import tool.

## layouts

Whether the entity is avialble in the Layout Manager tool.

## tab

*{boolean}*

Whether the scope is available as a navbar tab.

## type

*?string*

A template type of the entity.

Available values: Base, BasePlus, Person, Company, CategoryTree, Event.

## acl

*boolean|"boolean"*

Whether the scope is available in Roles. Available values: true, false, "boolean". Boolean means that it will be available in roles w/o actions.

## aclPortal

*boolean|"boolean"*

Whether the scope is available in Portal Roles. Available values: true, false, "boolean". Boolean means that it will be available in roles w/o actions.


### aclActionList

_Description_: list of available actions in Role configuration;

_Type_: array;

_Available value_: array of ['create', 'read', 'edit', 'delete', 'stream'];

_Default_: `["create", "read", "edit", "delete"]` if `acl` is `true`.


### aclLevelList

_Description_: list of available level for actions in Role configuration;

_Type_: array;

_Available value_: array of ['all', 'team', 'own', 'no'];

_Default_: `["all", "team", "own", "no"]` if `acl` is `true`.


### aclActionLevelListMap

_Description_: list of available levels for actions in Role configuration;

_Type_: object;

Example:

```
"aclActionLevelListMap": {
    "edit": ["own", "no"]
}
```
      
### aclPortalLevelList

_Description_: list of available level for actions in Portal Role configuration;

_Type_: array;

_Available value_: array of ['all', 'account', 'contact', 'own', 'no'];

_Default_: `["all", "account", "contact", "own", "no"]` if `aclPortal` is `true`.

### statusField
 
_Description_: an enum field which is used to determine the status;; 

_Type_: string;

_Available value_: the name of enum field or null;

_Default_: null.
  
### workflow

_Description_: if Advanced Pack extension is installed and `"object"` is not set, but you need this entity in Target Entity list in Workflow;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


### disabled

_Description_: is disabled and invisible in the system;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


### customizable

_Description_: whether the entity can be customized in the Entity Manager;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


### isCustom

_Description_: scope is custom; in general this parameter is true if the entity was created in the Entity Manager;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


### notifications

_Description_: whether notifications can be enabled for the entity;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.

### calendar

_Description_: whether can be displayed on the Calendar;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


#### activity

_Description_: whether can be displayed on the Activities panel;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.

### activityStatusList

_Description_: status values that determine that a record should be shown in the Activities panel;

_Type_: array;

_Available value_: options of the status field;

_Default_: `["Planned"]`.
      
### historyStatusList

_Description_: status values that determine that a record should be shown in the History panel;

_Type_: array;

_Available value_: options of the status field;

_Default_: `["Held", "Not Held"]`.

### languageIsGlobal

_Description_: languge labels will be available for all users (not restricted by ACL);

_Type_: boolean;

_Default_: false.

### kanbanStatusIgnoreList

_Description_: status values to be ignored on the kanban view;

_Type_: array;

_Available value_: options of the status field;

_Default_: `[]`.

### hasPersonalData

_Description_: whether the entity contains personal data;

_Type_: boolean;

_Default_: false.
