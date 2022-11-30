# clientDefs. Client defenitions

Path: `metadata/clientDefs/{ScopeName}.json`

Contains parameters used by the front-end.


## controller

Defines a client controller class.

## collection

Defines a client record collection class. Optional.

The default value: `'collection'`. Corresponds to the path `client/src/collection.js`.

## acl

Defines a client scope acl class. Optional.

The default value: `'acl'`. Path `client/src/acl.js`.


## aclPortal

Defines client scope acl for portals. Optional.

The default value: `'acl-portal'`. Path `client/src/acl-portal.js`.


## createDisabled

Allows to disable the ability to create entity from user interface (from the list view).


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

A list of primary (preset) filters.

## boolFilterList

A list of bool filters.

## defaultFilterData

## selectDefaultFilters

Used as default set filter on the select modal
Object 'filter' => 'active'
    
## menu

Top-right menu for views (list, detail, edit, etc.).


## sidePanels

Definitions of side-panels for views (list, detail, edit, etc.).

      
## bottomPanels

Definitions of bottom-panels for views (list, detail, edit, etc.).

## relationshipPanels

Parameters to be applied for specific relationship panels.

Example:

```json
{
    "relationshipPanels": {
        "linkName": {
            "view": "my-module:views/panels/panel-view",
            "recordListView": "my-module:views/record/list",
            "rowActionsView": "my-module:views/record/row-actions/view",
            "label": "Panel Label",
            "readOnly": false,
            "selectDisabled": false,
            "createDisabled": false,
            "viewDisabled": false,
            "unlinkDisabled": false,
            "orderBy": "someField",
            "orderDirection": "ASC",
            "createRequiredAccess": "read",
            "selectRequiredAccess": "edit",
            "selectPrimaryFilterName": "filterName",
            "boolFilterList": ["onlyMy"],
            "layout": "listLayoutName"
        }
    }
}

```

## additionalLayouts

Additionals layouts for a scope.
    
      
## massActionList

Mass actions.

## checkAllResultMassActionList

Mass actions available when selecting all recults.

## massActionDefs

Defenitions for mass actions.

## iconClass

A scope icon class.

Example: `"fas fa-chess-king"`

## color

Scope color in HEX.

## kanbanViewMode

The scope has kanban view mode on the list view.

## allowInternalNotes

If true, it will be possible to post internal posts in the stream. Internal posts are not visible in portals.

## isExpandedByDefault

Actual for category scopes (e.g. DocumentFolder). If true, then by default it will be in expanded mode.
