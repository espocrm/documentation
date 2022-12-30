# clientDefs

Path: metadata > clientDefs > {Scope}

Contains parameters used by the front-end.

## controller

Defines a client controller class.

## collection

Defines a client record collection class. Optional.

The default value: `'collection'`. Corresponds to the path `client/src/collection.js`.

## model

Defines a client record model class. Optional.

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

Record view classes. list, detail, edit, detailQuick, editQuick, kanban, listRelated.

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

A list of primary filters.

Exanmple:

```json
{
    "filterList": [
        {
            "name": "planned"
        },
        {
            "name": "held",
            "style": "success"
        },
        {
            "name": "todays"
        }
    ]
}
```

## boolFilterList

A list of bool filters.

Example:

```json
{
    "boolFilterList": ["onlyMy"]
}
```

## defaultFilterData

## selectDefaultFilters

Used as default set filter on the select modal
Object 'filter' => 'active'
    
## menu

Top-right menu for views (list, detail, edit). Available types: *buttons*, *dropdown*.

Example:

```json
{
    "menu": {
        "detail": {
            "buttons": [
                {
                    "labelTranslation": "Campaign.links.trackingUrls",
                    "link": "#CampaignTrackingUrl",
                    "acl": "read",
                    "aclScope": "CampaignTrackingUrl"
                }
            ],
            "dropdown": [
                {
                    "label": "Some Action",
                    "acl": "edit",
                    "aclScope": "SomeScope",
                    "action": "someAction"
                }
            ]
        }
    }
}
```

See [more](../custom-buttons.md).

## sidePanels

Definitions of side-panels for views (detail, edit, detailSmall, editSmall). Defined panels will be available in the layout manager.

Example: 

```json
{
    "sidePanels": {
        "detail": [
            {
                "name": "attendees",
                "label": "Attendees",
                "view": "crm:views/meeting/record/panels/attendees",
                "options": {
                    "fieldList": [
                        "users",
                        "contacts",
                        "leads"
                    ]
                },
                "isForm": true,
                "notRefreshable": true
            }
        ]
    }
}
```

### isForm

Needed for a proper UI styling when the panel contains a form.

### notRefreshable

Not refreshable (when clicking on the header).

### options

Options to pass to the panel view.
      
## bottomPanels

Definitions of bottom-panels for views. The same as sidePanels.

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
            "orderDirection": "asc",
            "createRequiredAccess": "read",
            "selectRequiredAccess": "edit",
            "selectPrimaryFilterName": "filterName",
            "boolFilterList": ["onlyMy"],
            "layout": "listLayoutName"
        }
    }
}
```

### layout

A layout name or a layout defined as an array.

### createDisabled

Disable the ability to create related records.

### selectDisabled

Disable the ability to select related records.

### viewDisabled

Disable the ability to view related records in a modal.

### unlinkDisabled

Disable the ability to unlink related records.

### label

A custom translatable label.

### createRequiredAccess

Access (to a current entity type) required for creating related records.

### selectRequiredAccess

Access (to a current entity type) required for selecting related records.

### filters

Filters available in the dropdown. An array of strings.

### orderDirection

`"asc"` or `"desc"`.


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

## dynamicLogic

[Dynamic logic](../../administration/dynamic-logic.md) definitions making a form dynamic.

```json
{
    "dynamicLogic": {
        "fields": {
            "fieldName": {
                "visible": {
                    "conditionGroup": []
                },
                "required": {
                    "conditionGroup": []
                },
                "readOnly": {
                    "conditionGroup": []
                }
            }
        },
        "panels": {
            "panelName": {
                "visible": {
                    "conditionGroup": []
                }
            }
        }
    }
}
```
