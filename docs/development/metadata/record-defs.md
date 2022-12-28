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

**Important**: Need to have `"__APPEND__"` item in the beginning of the array when extening (not needed anymore as of v7.2).

## actions

Parameters of actions (applied only for the back-end).

Parameters:

* disabled – disables an action;
* allowed – allows an action for non-object scopes;
* implementationClassName – a class name, should implement `Espo\CoreActionAction`.

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

* disabled – disables an action;
* allowed – allows an action for non-object scopes;
* implementationClassName – a class name, should implement `Espo\Core\MassAction\MassAction`.

## actionsDisabled

Disable actions in the back-end.

## massActionsDisabled

Disable mass actions in the back-end.

## exportDisabled

To disable export regardless ACL.

## updateDuplicateCheck

A boolean parameter. If true, then duplicate checking will be processed while updating a record. By default it's processed only when creating a new record.

## relationships

*As of v7.3.*

Relationship parameters. Key-object pairs, where keys are link names.

Example:

```json
{
    "cases": {
        "linkRequiredAccess": "edit",
        "linkRequiredForeignAccess": "read"
    }
}
```

Parameters:

* linkRequiredAccess – access to a current record that is needed to be able to link and unlink records (`create`, `read`, `edit`, `delete`, `stream`); applied only in the back-end, for the front-end specify clientDefes > {EntityType} > relationshipPanels > {link} > selectRequiredAccess.
* linkRequiredForeignAccess – access to a foreign record that is needed to be able to link and unlink;

## beforeReadHookClassNameList

Hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\ReadHook` interface.

## beforeCreateHookClassNameList

Hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\CreateHook` interface.

## beforeUpdateHookClassNameList

Hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\UpdateHook` interface.

## beforeDeleteHookClassNameList

Hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\DeleteHook` interface.

## beforeLinkHookClassNameList

Hooks (applied for API calls).  Should implement the `Espo\Core\Record\Hook\LinkHook` interface.

## beforeUnlinkHookClassNameList

Hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\UnlinkHook` interface.
