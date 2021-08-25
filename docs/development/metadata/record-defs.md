# recordDefs

Path: metadata > recordDefs > {EntityType}

## duplicateWhereBuilderClassName

A class for building a where clause for duplicate checking.

Should implement `Espo\Core\Duplicate\WhereBuilder` interface.

## readLoaderClassNameList

Array of classes to load additional fields for an entity.

Should implement `Espo\Core\FieldProcessing\Loader` interface.

## listLoaderClassNameList

Array of classes to load additional fields for an entity for the list view.

Should implement `Espo\Core\FieldProcessing\Loader` interface.

## saverClassNameList

Array of classes to save additional fields.

Should implement `Espo\Core\FieldProcessing\Saver` interface.

## assignmentNotificatorClassName

A class for notifying upon assignment.

Should implement `Espo\Core\Notification\AssignmentNotificator` interface.

## selectApplierClassNameList

Array of classes for additional handling of a select query.

Should implement `Espo\Core\Select\Applier\AdditionalApplier` interface.

## actions

Parameters of actions (applied only for the back-end).

Parameters:

* allowed - to allow an action for a scope w/o ACL.

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

* allowed - to allow an action for a scope w/o ACL.

## actionsDisabled

Disable actions in the back-end.

## exportDisabled

To disable export regardless ACL.

## beforeReadHookClassNameList

Hooks (applied only for API calls). 

## afterReadHookClassNameList

Hooks (applied only for API calls). 

## beforeCreateHookClassNameList

Hooks (applied only for API calls). 

## afterCreateHookClassNameList

Hooks (applied only for API calls). 

## beforeUpdateHookClassNameList

Hooks (applied only for API calls). 

## afterUpdateHookClassNameList

Hooks (applied only for API calls). 

## beforeDeleteHookClassNameList

Hooks (applied only for API calls). 

## afterDeleteHookClassNameList

Hooks (applied only for API calls). 

## beforeLinkHookClassNameList

Hooks (applied only for API calls). 

## afterLinkHookClassNameList

Hooks (applied only for API calls). 

## beforeUnlinkHookClassNameList

Hooks (applied only for API calls). 

## afterUnlinkHookClassNameList

Hooks (applied only for API calls).

