# selectDefs

Path: metadata > selectDefs > {EntityType}

## accessControlFilterClassNameMap

Class names for access control filters. Classes should implement `Espo\Core\Select\AccessControl\Filter` interface.

Default filters are available at `Espo\Core\Select\AccessControl\Filters`.

## boolFilterClassNameMap

Class names for bool filters. Classes should implement `Espo\Core\Select\Bool\Filter` interface.

## primaryFilterClassNameMap

Class names for primary filters. Classes should implement `Espo\Core\Select\Primary\Filter` interface.

## selectAttributesDependencyMap

Selecting a specific attribute will actually select attributes defined by the map.

Example:

```
{
    "selectAttributesDependencyMap": {
        "subject": ["name"],
        "personStringData": ["fromString", "fromEmailAddressId"]
    }
}
```

