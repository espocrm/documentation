# Scope Definition

Сontains scope definition. All options are optional.

`{PATH}/Resources/metadata/scopes/{EntityName}.json`

## List of options:

### entity

>_Description_: is an entity, has own table in database;
> 
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.


### object

>_Description_: is an object, is available in ....;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.


### module

>_Description_: the name of the module, where is this scope defined;
>
>_Type_: string.


### stream

>_Description_: does entity has Stream panel;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.


### importable

>_Description_: could be imported with Import feature;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.


### layouts

>_Description_: has layouts, is available in Layout Manager;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.


### tab

>_Description_: could be displayed on the tab list;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.


### acl

>_Description_: ;
>
>_Type_: boolean | string;
>
>_Available value_: true | false | 'boolean';
>
>_Default_: false.

### type

>_Description_: ;
>
>_Type_: string;
>
>_Available value_: one of ["Base", "BasePlus", "Person", "Company", "CategoryTree", "Event"];
>
>_Default_: "Base".

### aclActionList

>_Description_: list of available actions in Role configuration;
>
>_Type_: array;
>
>_Available value_: array of ['create', 'read', 'edit', 'delete', 'stream'];
>
>_Default_: ['create', 'read', 'edit', 'delete'] if `acl` is `true`.


### aclLevelList

>_Description_: list of available level for actions in Role configuration;
>
>_Type_: array;
>
>_Available value_: array of ['all', 'team', 'own', 'no'];
>
>_Default_: ['all', 'team', 'own', 'no'] if `acl` is `true`.


### aclActionLevelListMap

>_Description_: list of available level for actions in Role configuration;
>
>_Type_: object;
>
>_Available value_: array of ['all', 'team', 'own', 'no'];
>
>_Default_: ['all', 'team', 'own', 'no'] if `acl` is `true`.

      array (
        'edit' => 
        array (
          0 => 'own',
          1 => 'no',
        ),
      ),
      
      
### aclPortal

` => 'recordAllAccountContactOwnNo',

### aclPortalLevelList

      array (
         0 => 'all',
        1 => 'account',
        2 => 'contact',
        3 => 'own',
        4 => 'no',
      ),
      
>_Description_: list of available level for actions in Role configuration;
>
>_Type_: array;
>
>_Available value_: array of ['all', 'account', 'contact', 'own', 'no'];
>
>_Default_: ['all', 'account', 'contact', 'own', 'no'] if `aclPortal` is `true`.


 ### statusField
 
>_Description_: list of available level for actions in Role configuration;
>
>_Type_: string;
>
>_Available value_: the name of enum field;
>
>_Default_: no default.
 
 
 
### workflow

>_Description_: if Advanced Pack extension is installed, `"object"` is not set, but you need this entity in Target Entity list;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.

### disabled

>_Description_: is disabled and invisible in the system;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.

### customizable

>_Description_: could be safely customized;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.


### isCustom

>_Description_: scope is disabled and invisible in the system;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.


### notifications

>_Description_: scope is disabled and invisible in the system;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.

### calendar

>_Description_: could be displayed on the Calendar;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.


#### activity

>_Description_: could be displayed on the Activities panel;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.


### activityStatusList
      array (
        0 => 'Draft',
      ),
>_Description_: scope is disabled and invisible in the system;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.
      
### historyStatusList

      array (
        0 => 'Archived',
        1 => 'Sent',
      ),
 >_Description_: scope is disabled and invisible in the system;
>
>_Type_: boolean;
>
>_Available value_: true | false;
>
>_Default_: false.

