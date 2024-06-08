# clientDefs

Path: metadata > clientDefs > {Scope}

Contains parameters used by the front-end.

## controller

*string*

Defines a client controller class.

## collection

*string*

Defines a client record collection class. Optional.

The default value: `'collection'`. Corresponds to the path `client/src/collection.js`.

## model

*string*

Defines a client record model class. Optional.

## acl

*string*

Defines a client acl class. Optional.

The default value: `'acl'`. Path `client/src/acl.js`.

## aclPortal

*string*

Defines a client acl class for portals. Optional.

The default value: `'acl-portal'`. Path `client/src/acl-portal.js`.

## createDisabled

*boolean*

Disables the ability to create a record from the user interface (from the list view).

## searchPanelDisabled

*boolean*

Hides the search panel on the list view.

## searchPanelInPortalDisabled

*boolean*

Hides the search panel on the list view in portals.

## textFilterDisabled

*boolean*

Disables text search.

## views

Custom view classes for list, detail, edit.

Example:

```
{
    "list": "custom:views/test/list",
    "detail": "custom:views/test/detail"
}
```

## recordViews

Custom record view classes. For list, detail, edit, detailQuick, editQuick, kanban, listRelated.

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

## listViewModeList

*string[]*

A list view mode list. E.g. *list*, *kanban*.

## viewModeIconClassMap

*object.<string, string\>*

*As of v8.3.*.

View mode icon classes. mode => class map.

## saveErrorHandlers

Save error handlers. See [here](../frontend/save-error-handlers.md).

## viewSetupHandlers

View setup handlers. See [here](https://docs.espocrm.com/development/frontend/view-setup-handlers/).

## inlineEditDisabled

*boolean*

Disable inline edit.

## exportDisabled

*boolean*

Disable the *export* mass-action.

## massUpdateDisabled

*boolean*

Disable the *mass-update* mass action.

## massRemoveDisabled

*boolean*

*As of v7.4.*

Disable the *remove* mass action.

## massFollowDisabled

*boolean*

Disable the *follow* mass-action.

## convertCurrencyDisabled

*boolean*

Disable the *convert-currency* mass-action and action.

## mergeDisabled

*boolean*

Disable the record merge functionality.

## filterList

A list of primary filters.

Example:

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
            "name": "someFilter",
            "accessDataList": []
        },
        {
            "name": "notAvailableOnListViewFilter",
            "aux": true
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

Example:

```json
{
    "boolFilterList": [
        {
            "name": "onlyMy",
            "accessDataList": []
        }
    ]
}
```

## defaultFilterData

A default filter data.

## selectDefaultFilters

A default filter on the select-records modal.

```json
{
    "selectDefaultFilters": {
        "filter": "myPrimaryFilter"
    }
}
```

## rowActionList

*As of v8.1.*

Row actions for the main list view.

Example:

```json
{
    "rowActionList": [
        "moveToTop",
        "moveUp",
        "moveDown",
        "moveToBottom"
    ]
}
```

Use `"__APPEND__"` for extending.

## rowActionDefs

*As of v8.1.*

Row action definitions.

Example:

```json
{
    "rowActionDefs": {
        "moveToTop": {
            "label": "Move to Top",
            "handler": "crm:handlers/knowledge-base-article/move",
            "acl": "edit"
        }
}
```

### handler

*string*

A handler. Should extend handlers/row-action.

### label

*string*

A translatable label.

### labelTranslation

*string*

A label translation path.

### acl

*"edit"|"delete"*

Required access.

### groupIndex

*integer*

A group index. Starts from 0. As of v8.3.0.
    
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

*boolean*

Needed for a proper UI styling when the panel contains a form.

### notRefreshable

*boolean*

Not refreshable (when clicking on the header).

### options

*object*

Options to pass to the panel view.

### accessDataList

Access control defs.
      
## bottomPanels

Definitions of bottom-panels for views. The same as sidePanels.

## relationshipPanels

Parameters to be applied for specific relationship panels. Some parameters are also applied for link, link-multiple fields, e.g. *selectPrimaryFilterName*, *selectBoolFilterList*, *selectHandler*.

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
            "editDisabled": false,
            "removeDisabled": false,
            "orderBy": "someField",
            "orderDirection": "asc",
            "createRequiredAccess": "read",
            "selectRequiredAccess": "edit",
            "selectPrimaryFilterName": "filterName",
            "selectBoolFilterList": ["onlyMy"],
            "filterList": ["all", "filterName"],
            "layout": "listLayoutName",
            "selectMandatoryAttributeList": ["accountId", "accountName"],
            "selectOrderBy": "createdAt",
            "selectOrderDirection": "asc"
        }
    }
}
```

### layout

A layout name or a layout defined as an array.

### createDisabled

*boolean*

Disable the ability to create related records.

### selectDisabled

*boolean*

Disable the ability to select related records.

### viewDisabled

*boolean*

Disable the ability to view related records in a modal.

### unlinkDisabled

*boolean*

Disable the ability to unlink related records.

### editDisabled

*boolean*

*As of v8.1.*

Hide the edit action.

### removeDisabled

*boolean*

*As of v8.1.*

Hide the remove action.

### label

*string*

A custom translatable label.

### createRequiredAccess

*string*

Access (to a current entity type) required for creating related records.

### selectRequiredAccess

*string*

Access (to a current entity type) required for selecting related records.

### selectPrimaryFilterName

*string*

A primary filter applied when selecting records.

### selectBoolFilterList

*string[]*

Bool filters applied when selecting records.

### primaryFilter

*string*

*As of v8.1.*

A default primary filter.

### filterList

*string[]*

Filters available in the dropdown.

### orderBy

*string*

An order-by field.

### orderDirection

*string*

`"asc"` or `"desc"`.

### selectHandler

*string*

A select handler for providing filters when selecting related records. Should have a method *getFilters* returning a promise.

### createHandler

*string*

A create handler. Provides attributes when creating a new related record. Should have a method *getAttributes* returning a promise.

### selectFieldHandler

*string*

*As of v8.0.*

A handler called when change a link field. Only for belongs-to and has-one relations. Should have *getAttributes* and *getClearAttributes* methods.

### selectMandatoryAttributeList

*string[]*

*As of v8.0.*

Attributes to be selected when selecting records.

### selectLayout

*string*

*As of v8.0.3*

A list layout name for the select dialog.

### selectOrderBy

*string*

*As of v8.2.0*

A field to order by when selecting records.

### selectOrderDirection

*"asc"|"desc"*

*As of v8.2.0*

An direction to order by when selecting records.

### rowActionList

*string[]*

*As of v8.1.*

Row actions.

### syncWithModel

*boolean*

*As of v8.1.*

Re-fetch records when the parent model is saved or refreshed by WebSocket.

### massSelect

*bool*

Enables mass select.

### createAttributeMap

*Object.<strring, string\>*

Attributes to carry over to a related record when creating. Mapping Parent => Related.

## additionalLayouts

Additional layouts for a scope.

```json
{
    "additionalLayouts": {
        "detailConvert": {
            "type": "detail"
        },
        "listForAccount": {
            "type": "listSmall"
        },
        "listForContact": {
            "type": "listSmall"
        }
    }
}
```
    
## massActionList

*string[]*

Mass actions.

## checkAllResultMassActionList

*string[]*

Mass actions available when selecting all results.

## massActionDefs

*Object.<string, mixed\>*

Definitions for mass actions. See [more](../custom-buttons.md#mass-action-in-list-view).

### handler

*string*

A handler class for the mass action.

### initFunction

*string*

An init function of the handler.

### configCheck

*?string*

A config path (separated by the `.`) to check whether the action is enabled. The `!` prefix reverts.

### aclScope

*?string*

A scope access to which is required for the action.

### acl

*?string*

An acl action access to which is required for the action.

## detailActionList

*Object[]*

Detail view actions (available from the dropdown next to the *Edit* button).

### name

*string*

An action name.

### label

A translatable label.

### handler

*string*

A handler class for the action.

### initFunction

*string*

An init function of the handler.

### checkVisibilityFunction

*?string*

The handler function that checks whether the action is available. Should return a boolean value. Called on model sync.

### configCheck

*?string*

A config path (separated by the `.`) to check whether the action is enabled. The `!` prefix reverts.

### aclScope

*?string*

A scope access to which is required for the action.

### acl

*?string*

An acl action access to which is required for the action.

### groupIndex

*number*

A group index. 0 – is the first group. Groups are separated by a divider. As of v8.3.0.

## modalDetailActionList

*Object[]*

Modal detail view actions. Parameters are the same as for *detailActionList*.

## iconClass

A scope icon class.

Example: `"fas fa-chess-king"`

## color

Scope color in HEX.

## kanbanViewMode

*boolean*

Whether the scope has the kanban view mode on the list view.

## allowInternalNotes

*boolean*

If true, it will be possible to post internal posts in the stream. Internal posts are not visible in portals.

## isExpandedByDefault

*boolean*

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
