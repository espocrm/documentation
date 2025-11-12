# selectDefs

Path: metadata > selectDefs > {EntityType}.

Parameters used by the [Select](../select-builder.md) framework that converts search parameters (sent from the front-end) to ORM queries.

## accessControlFilterClassNameMap

Class names for access control filters. Classes should implement `Espo\Core\Select\AccessControl\Filter` interface.

Default filters are available at `Espo\Core\Select\AccessControl\Filters`.

The `mandatory` filter is applied for all users. Use if you need to apply some access restrictions for all users (including admin).

Example:

```json
{
    "accessControlFilterClassNameMap": {
        "onlyOwn": "Espo\\Custom\\Classes\\Select\\MyEntityType\\AccessControlFilters\\OnlyOwn",
        "mandatory": "Espo\\Custom\\Classes\\Select\\MyEntityType\\AccessControlFilters\\Mandatory"
    }
}
```

Available out-of-the-box filters:

* mandatory
* all
* onlyTeam
* onlyOwn
* portalAll
* portalOnlyAccount
* portalOnlyContact
* portalOnlyOwn

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

When the system asking to select a specific attribute, this mapping will force the framework to also select some other fields along with the requested field.

Example:

```json
{
    "selectAttributesDependencyMap": {
        "subject": ["name"],
        "personStringData": ["fromString", "fromEmailAddressId"],
        "id": ["order"]
    }
}
```

In the example, when the *subject* attribute is requested, the *name* attribute will be selected. We can have the *subject* field on the list layout but don't have the *name* field. Without this mapping the *name* field won't be fetched when we fetch a collection for the list view.

Map to the *id* attribute to make specific attributes to be always selected. This works as the *id* attribute is always requested.

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

Mapping keys a formatted as: `{fieldName}_{conditionItemType}`.

This mapping allows to define a custom field filtering implementation. The *conditionItemType* is passed in a [where item](../api-search-params.md#where-items) in the *type* parameter.

## accessControlFilterResolverClassName

A resolver is responsible for choosing an access filter to apply to a select query. Should implement `Espo\Core\Select\AccessControl\FilterResolver` interface.

## textFilterClassName

A class that processes the text filter search. Should implement `Espo\Core\Select\Text\Filter` interface. By default, `Espo\Core\Select\Text\DefaultFilter` is used.

## orderItemConverterClassNameMap

An order converter converts order parameters (passed from the frontend through the REST API) to an order data acceptable for the ORM. One can implement a custom converter for a specific field. For example, to make an address field be ordered by a city (when the user sorts by the address column, it will order by the city under the hood).

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

*As of v7.1.*

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

## additionalApplierClassNameList

*As of v9.1.*

*class-string<Espo\Core\Select\Applier\AdditionalApplier\>[]*

Additional appliers. Used for additional handling of a select query. They are always applied. The logic inside the applier can apply some filters conditionally.

