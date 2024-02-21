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

## loadAdditionalFieldsAfterUpdate

*boolean*

*As of v8.0.*

Load additional fields after update. Needed for cases when additional fields need to be re-loaded since they are not actual after update.

## actions

Parameters of actions (applied only for the back-end).

Parameters:

* disabled – disables an action;
* allowed – allows an action for non-object scopes;
* implementationClassName – a class name, should implement `Espo\Core\Action\Action`.

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

*bool*

Disable actions in the back-end.

## massActionsDisabled

*bool*

Disable mass actions in the back-end.

## exportDisabled

*bool*

To disable export regardless ACL.

## updateDuplicateCheck

*bool*

A boolean parameter. If true, then duplicate checking will be processed while updating a record. By default, it's processed only when creating a new record.

## relationships

*As of v7.3.*

Relationship parameters. Key-object pairs, where keys are link names.

Example:

```json
{
    "relationships": {
        "cases": {
            "linkRequiredAccess": "edit",
            "linkRequiredForeignAccess": "read",
            "linkForeignAccessCheckDisabled": false
        }
    }
}
```

Parameters:

* selectAccessControlDisabled – disable access control when listing related records; only access to a parent record will be checked (as of v8.0);
* linkRequiredAccess – access to a current record that is needed to be able to link and unlink records (`create`, `read`, `edit`, `delete`, `stream`); applied only in the back-end, for the front-end specify clientDefes > {EntityType} > relationshipPanels > {link} > selectRequiredAccess (*edit* by default);
* linkRequiredForeignAccess – access to a foreign record that is needed to be able to link and unlink (*edit* by default);
* linkForeignAccessCheckDisabled – disable foreign record access check when linking (as of v7.4);
* linkCheckDisabled – disable a link-check functionality linking when through link-multiple field (as of v7.4.4).

## beforeReadHookClassNameList

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\ReadHook` interface.

## beforeCreateHookClassNameList

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\CreateHook` interface. As of v8.1, can also implement `Espo\Core\Record\Hook\SaveHook`.

## afterCreateHookClassNameList

*As of v8.2.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\CreateHook` or `Espo\Core\Record\Hook\SaveHook`.

## beforeUpdateHookClassNameList

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\UpdateHook` interface. As of v8.1, can also implement `Espo\Core\Record\Hook\SaveHook`.

## afterUpdateHookClassNameList

*As of v8.2.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\UpdateHook` or `Espo\Core\Record\Hook\SaveHook`.

## beforeDeleteHookClassNameList

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\DeleteHook` interface.

## afterDeleteHookClassNameList

*As of v8.2.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\DeleteHook` interface.

## beforeLinkHookClassNameList

An array of hooks (applied for API calls).  Should implement the `Espo\Core\Record\Hook\LinkHook` interface.

## beforeUnlinkHookClassNameList

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\UnlinkHook` interface.
