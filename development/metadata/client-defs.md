# Client defenitions

Path: `metadata/clientDefs/{ScopeName}.json`

Can be one of:
```
  1) CUSTOM_PATH - custom/Espo/Custom/Resources/metadata/clientDefs/{ScopeName}.json;
  2) MODULE_PATH - application/Espo/Modules/{ModuleName}/Resources/metadata/clientDefs/{ScopeName}.json;
  3) BASE_PATH - application/Espo/Resources/metadata/clientDefs/{ScopeName}.json
```

Parameters used by front-end.


## controller

Defines a client controller class.


## collection

Defines a client record collection class. Optional.

By default `'collection'`. Path `client/src/collection.js`.

## acl

Defines client a scope acl class. Optional.

By default `'acl'`. Path `client/src/acl.js`.


## aclPortal

Defines client scope acl for portals. Optional.

By default `'acl-portal'`. Path `client/src/acl-portal.js`.


## createDisabled

Allows to disable to create entity with user interface.


## searchPanelDisabled

Allows to hide a search panel on the list view.


## views

list, detail, edit view classes

Example:
```
{
    "list": "custom:views/test/list",
    "detail": "custom:views/test/detail"
}

```


## recordViews

Record view classes. list, detail, edit, detailSmall, editSmall, kanban.

Example:
```
{
    "list": "custom:views/test/record/list"
}

```

## modalViews

Modal view classes.

Example:
```
{
    "detail": "custom:views/test/modal/detail",
    "select": "custom:views/test/modal/select-records"
}
```

## filterList

Contains a list of primary (preset) filters.

## boolFilterList

## defaultFilterData

## selectDefaultFilters

Used as default set filter on the select modal
Object 'filter' => 'active'
    
## formDependency

Deprecated

## menu


## relationshipPanels


## sidePanels

      
## bottomPanels


## additionalLayouts
    
      
## massActionList


## checkAllResultMassActionList


## massActionDefs

## iconClass

Example: `"fas fa-chess-king"`

## color

Scope color in HEX.

## kanbanViewMode

The scope has kanban view mode on the list view
