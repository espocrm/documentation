# app > record

Record framework definitions.

## selectApplierClassNameList

*class-string<Espo\Core\Select\Applier\AdditionalApplier\>*

*As of v9.0.*

Classes for additional handling of a select query. An entity type is passed to the constructor in `$entityType` parameter.


## createInputFilterClassNameList

*class-string<Espo\Core\Record\Input\Filter\>[]*

*As of v9.4.*

Create input filters.

## updateInputFilterClassNameList

*class-string<Espo\Core\Record\Input\Filter\>[]*

*As of v9.4.*

Update input filters.

## outputFilterClassNameList

*class-string<Espo\Core\Record\Output\Filter\>[]*

*As of v9.4.*

Output filters.

## beforeReadHookClassNameList

*As of v9.4.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\ReadHook` interface.

## earlyBeforeCreateHookClassNameList

*As of v9.4.*

An array of hooks. Applied for API calls, before validation. Should implement `Espo\Core\Record\Hook\CreateHook` or `Espo\Core\Record\Hook\SaveHook` interface.

## beforeCreateHookClassNameList

*As of v9.4.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\CreateHook` interface. As of v8.1, can also implement `Espo\Core\Record\Hook\SaveHook`.

## afterCreateHookClassNameList

*As of v9.4.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\CreateHook` or `Espo\Core\Record\Hook\SaveHook`.

## earlyBeforeUpdateHookClassNameList

*As of v9.4.*

An array of hooks. Applied for API calls, before validation. Should implement `Espo\Core\Record\Hook\UpdateHook` or `Espo\Core\Record\Hook\SaveHook` interface.

## beforeUpdateHookClassNameList

*As of v9.4.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\UpdateHook` interface. As of v8.1, can also implement `Espo\Core\Record\Hook\SaveHook`.

## afterUpdateHookClassNameList

*As of v9.4.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\UpdateHook` or `Espo\Core\Record\Hook\SaveHook`.

## beforeDeleteHookClassNameList

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\DeleteHook` interface.

## afterDeleteHookClassNameList

*As of v8.2.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\DeleteHook` interface.

## beforeLinkHookClassNameList

*As of v9.4.*

An array of hooks (applied for API calls).  Should implement the `Espo\Core\Record\Hook\LinkHook` interface.

## beforeUnlinkHookClassNameList

*As of v9.4.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\UnlinkHook` interface.

## afterLinkHookClassNameList

*As of v8.2.*

An array of hooks (applied for API calls).  Should implement the `Espo\Core\Record\Hook\LinkHook` interface.

## afterUnlinkHookClassNameList

*As of v8.2.*

An array of hooks (applied for API calls). Should implement the `Espo\Core\Record\Hook\UnlinkHook`
