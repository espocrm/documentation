# scopes

Path: metadata > scopes > {ScopeName}

Сontains scope definition. Scope can define an entity type.

## Parameters

### entity

_Description_: is an entity;
 
_Type_: boolean;

_Available value_: true | false;

_Default_: false.


### object

_Description_: is an object; means that it's not an entity for internal system purpose; an object entity represents some business entity;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


### module

_Description_: the name of the module, where is this scope defined;

_Type_: string.


### stream

_Description_: entity has Stream panel;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


### importable

_Description_: could be imported with Import feature;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


### layouts

_Description_: has layouts, is available in Layout Manager;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


### tab

_Description_: could be displayed on the tab list;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


### type

_Description_: type of entity;

_Type_: string;

_Available value_: one of ["Base", "BasePlus", "Person", "Company", "CategoryTree", "Event"];

_Default_: "Base".

### acl

_Description_: could be set permissions in Role;

_Type_: boolean | string;

_Available value_: true | false | 'boolean';

_Default_: false.


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
      
### aclPortal

_Description_: could be set permissions in Portal Role;

_Type_: boolean;

_Available value_: true | false;

_Default_: false.


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
