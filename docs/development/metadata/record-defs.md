# recordDefs

Path: metadata > recordDefs > {EntityType}

## duplicateWhereBuilderClassName

A class for building a where clause for duplicate checking.

Must implement `Espo\Core\Duplicate\WhereBuilder` interface.

## readLoaderClassNameList

Array of classes to load additional fields for an entity.

Must implement `Espo\Core\FieldProcessing\Loader` interface.

**Important**: Need to have `"__APPEND__"` item in the beginning of the array when extening.

## listLoaderClassNameList

Array of classes to load additional fields for an entity for the list view.

Must implement `Espo\Core\FieldProcessing\Loader` interface.

**Important**: Need to have `"__APPEND__"` item in the beginning of the array when extening.

## saverClassNameList

Array of classes to save additional fields.

Must implement `Espo\Core\FieldProcessing\Saver` interface.

**Important**: Need to have `"__APPEND__"` item in the beginning of the array when extening.

## selectApplierClassNameList

Array of classes for additional handling of a select query.

Must implement `Espo\Core\Select\Applier\AdditionalApplier` interface.

**Important**: Need to have `"__APPEND__"` item in the beginning of the array when extening.

## actions

Parameters of actions (applied only for the back-end).

Parameters:

* disabled - disables an action;
* allowed - allows an action for non-object scopes.

## massActions

Parameters of mass actions (applied only for the back-end).

Example:

```json
{
    "massActions": {
        "delete": {
            "allowed": true
        }
    }
}
```

Parameters:

* disabled - disables an action;
* allowed - allows an action for non-object scopes.

## actionsDisabled

Disable actions in the back-end.

## exportDisabled

To disable export regardless ACL.

## beforeReadHookClassNameList

Hooks (applied only for API calls). 

## beforeCreateHookClassNameList

Hooks (applied only for API calls). 

## beforeUpdateHookClassNameList

Hooks (applied only for API calls). 

## beforeDeleteHookClassNameList

Hooks (applied only for API calls). 

## beforeLinkHookClassNameList

Hooks (applied only for API calls). 

## beforeUnlinkHookClassNameList

Hooks (applied only for API calls). 

