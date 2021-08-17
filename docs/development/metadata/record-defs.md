# recordDefs

Path: metadata > recordDefs > {EntityType}

## duplicateWhereBuilderClassName

A class for building a where clause for duplicate checking.

Should implement `Espo\Core\Duplicate\WhereBuilder`.

## readLoaderClassNameList

Array of classes to load additional fields for an entity.

Should implement `Espo\Core\FieldProcessing\Loader` interface.

## listLoaderClassNameList

Array of classes to load additional fields for an entity for the list view.

Should implement `Espo\Core\FieldProcessing\Loader` interface.

## saverClassNameList

Array of classes to save additional fields.

Should implement `Espo\Core\FieldProcessing\Saver` interface.
