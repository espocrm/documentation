# selectDefs

Path: metadata > selectDefs > {EntityType}

Parameters used by [Select](../select-builder.md) framework that converts serarch parameters (sent from the front-end) to ORM queries.

## accessControlFilterClassNameMap

Class names for access control filters. Classes should implement `Espo\Core\Select\AccessControl\Filter` interface.

Default filters are available at `Espo\Core\Select\AccessControl\Filters`.

Note: `mandatory` filter is applied for all users. Use if you need to apply some access restrictions for all users (including admin).

Example:

```json
{
    "accessControlFilterClassNameMap": {
        "onlyOwn": "Espo\\Custom\\Classes\\Select\\MyEntityType\\AccessControlFilters\\OnlyOwn",
        "mandatory": "Espo\\Custom\\Classes\\Select\\MyEntityType\\AccessControlFilters\\Mandatory"
    }
}
```

## boolFilterClassNameMap

Class names for bool filters. Classes should implement `Espo\Core\Select\Bool\Filter` interface.

## primaryFilterClassNameMap

Class names for primary filters. Classes should implement `Espo\Core\Select\Primary\Filter` interface.

Example:

```json
{
    "primaryFilterClassNameMap": {
        "myCustomFilter": "Espo\\Custom\\Classes\\Select\\MyEntityType\\PrimaryFilters\\MyCustomFilter"
    }
}
```

## selectAttributesDependencyMap

Selecting a specific attribute will actually select attributes defined by the map.

Example:

```json
{
    "selectAttributesDependencyMap": {
        "subject": ["name"],
        "personStringData": ["fromString", "fromEmailAddressId"]
    }
}
```

In the example, when the *subject* attribute is requested, the *name* attribute will be selected.

## whereItemConverterClassNameMap

Implementations for custom where items.

Example: 

```json
{
    "whereItemConverterClassNameMap": {
        "id_isOfType": "Espo\\Classes\\Select\\User\\Where\\ItemConverters\\IsOfType"
    }
}
```

Classes should implement `Espo\Core\Select\Where\ItemConverter` interface.

The key format: `{fieldName}_{conditionItemType}`.

## accessControlFilterResolverClassName

A resolver is responsible for choosing an access filter. Should implement `Espo\Core\Select\AccessControl\FilterResolver` interface.

## textFilterClassName

A class that processes the text filter search. Should implement `Espo\Core\Select\Text\Filter` interface. By default `Espo\Core\Select\Text\DefaultFilter` is used.

## orderItemConverterClassNameMap

An order converter converts order parameters passed from the frontend to an order data acceptable for ORM. One can implement a custom converer for a specific field. E.g. make an address field be ordered by a city (when a user orders by the address column, it will actually order by city).

Classes should implement `Espo\Core\Select\Order\ItemConverter` interface.

Example: 

```json
{
    "orderItemConverterClassNameMap": {
        "someFieldName": "Espo\\Custom\\Classes\\Select\\MyEntityType\\Order\\ItemConverters\\MyConverter"
    }
}
```

## ordererClassNameMap

As of v7.1.0.

Provides the ability to apply custom order for a specific field.

Classes should implement `Espo\Core\Select\Order\Orderer` interface.

Example: 

```json
{
    "ordererClassNameMap": {
        "someFieldName": "Espo\\Custom\\Classes\\Select\\MyEntityType\\Order\\SomeOrderer"
    }
}
```
