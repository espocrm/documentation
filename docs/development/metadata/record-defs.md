# recordDefs

Path: metadata > recordDefs > {EntityType}

## duplicateWhereBuilderClassName

A class for building a where clause for duplicate checking.

Must implement `Espo\Core\Duplicate\WhereBuilder` interface.

## defaultsPopulatorClassName

*class-string<Espo\Core\Record\Defaults\Populator\>*

*As of v8.2.*

Populates default values when creating a record.

Is called after the entity is set with input payload values. Usually, it's reasoable to call the default implementation `Espo\Core\Record\Defaults\DefaultPopulator`.

## readLoaderClassNameList

Array of classes to load additional fields for an entity.

Must implement `Espo\Core\FieldProcessing\Loader` interface.

**Important**: Need to have `"__APPEND__"` item in the beginning of the array when extending.

## listLoaderClassNameList

Array of classes to load additional fields for an entity for the list view.

Must implement `Espo\Core\FieldProcessing\Loader` interface.

**Important**: Need to have `"__APPEND__"` item in the beginning of the array when extending.

## saverClassNameList

Array of classes to save additional fields.

Must implement `Espo\Core\FieldProcessing\Saver` interface.

!!! note

    Savers are applied on the ORM level, not on the Record Service level. Technically they should not belong to the recordDefs but they are left here for backward compatibility.

## selectApplierClassNameList

Array of classes for additional handling of a select query. Use for joining additional fields. Do not use for access control logic.

Must implement `Espo\Core\Select\Applier\AdditionalApplier` interface.


## loadAdditionalFieldsAfterUpdate

*boolean*

*As of v8.0.*

Load additional fields after update. Needed for cases when additional fields need to be re-loaded since they are not actual after update.

## actions

Parameters of actions (applied only for the back-end).

Parameters:

* disabled – disables the action;
* allowed – allows the action for non-object scopes;
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

* disabled – disables the action;
* allowed – allows the action for non-object scopes;
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

## actionHistoryDisabled

*bool*

*As of v8.2.*

Disable Action History processing.

## updateDuplicateCheck

*bool*

A boolean parameter. If true, then duplicate checking will be processed while updating a record. By default, it's processed only when creating a new record.

## forceSelectAllAttributes

*bool*

*As of v8.2.*

To select all attributes when calling find.

## mandatoryAttributeList

*string[]*

*As of v8.2.*

Attributes to select when calling find.

## duplicateLinkList

*string[]*

*As of v8.2.*

Links to be copied when duplicating a record. As of v8.2.

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
            "mandatoryAttributeList": ["number"]
        }
    }
}
```

Parameters:

* selectAccessControlDisabled – disable access control when listing related records; only access to a parent record will be checked; as of v8.0;
* linkRequiredAccess – access to a current record that is needed to be able to link and unlink records (`create`, `read`, `edit`, `delete`, `stream`); applied only in the back-end, for the front-end specify clientDefs > {EntityType} > relationshipPanels > {link} > selectRequiredAccess (*edit* by default);
* linkRequiredForeignAccess – access to a foreign record that is needed to be able to link and unlink (*edit* by default);
* linkForeignAccessCheckDisabled – disable foreign record access check when linking; as of v7.4;
* linkCheckDisabled – disable a link-check functionality linking when through link-multiple field; as of v7.4.4;
* mandatoryAttributeList – *string[]* – mandatory attributes to be selected when find related; as of v8.2;
* countDisabled – bool – disable total count; as of 8.2;
* massLink – bool – allows mass linking; as of 8.2;
* linkOnlyNotLinked – bool – allow linking only if a record is not linked with any;  as of 8.3;

## createInputFilterClassNameList

*class-string<Espo\Core\Record\Input\Filter\>[]*

*As of v8.2.*

Create input filters.

## updateInputFilterClassNameList

*class-string<Espo\Core\Record\Input\Filter\>[]*

*As of v8.2.*

Update input filters.

## outputFilterClassNameList

*class-string<Espo\Core\Record\Output\Filter\>[]*

*As of v8.2.*

Output filters.

## beforeReadHookClassNameList

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\ReadHook` interface.

## earlyBeforeCreateHookClassNameList

*As of v9.0.*

An array of hooks. Applied for API calls, before validation. Should implement `Espo\Core\Record\Hook\CreateHook` or `Espo\Core\Record\Hook\SaveHook` interface.

## beforeCreateHookClassNameList

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\CreateHook` interface. As of v8.1, can also implement `Espo\Core\Record\Hook\SaveHook`.

## afterCreateHookClassNameList

*As of v8.2.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\CreateHook` or `Espo\Core\Record\Hook\SaveHook`.

## earlyBeforeUpdateHookClassNameList

*As of v9.0.*

An array of hooks. Applied for API calls, before validation. Should implement `Espo\Core\Record\Hook\UpdateHook` or `Espo\Core\Record\Hook\SaveHook` interface.

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

## afterLinkHookClassNameList

*As of v8.2.*

An array of hooks (applied for API calls).  Should implement the `Espo\Core\Record\Hook\LinkHook` interface.

## afterUnlinkHookClassNameList

*As of v8.2.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\UnlinkHook` interface.

## deletedRestorerClassName

*class-string<Espo\Core\Record\Deleted\Restorer\>*

*As of v9.2.*

A deleted record restorer.
