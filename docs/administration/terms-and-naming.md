# Terms & Naming

## Entity type

It's a type of data. E.g. Account, Contact, Opportunity, Task, Knowledge Base.

Entity types are named in UpperCamelCase (start with a capital letter).

**The list of available entity types** can be obtained at: Administration > Entity Manager > *Name* column.

Entities have their fields and links.

## Field

A field is a unit of data. Entities have their own set of fields. E.g. name, status, createdAt, assignedUser.

Fields are named in lowerCamelCase (start with a lowercase letter).

**The list of available fields** for a specific entity type can be obtained at: Administration > Entity Manager > needed entity type > Fields > *Name* column.

Each field can have one or few attributes (depending on the field type).

The list of available field types can be found [here](fields.md).

## Attribute

Most fields have only one attribute named the same as the field. E.g. the `createdAt` field has an attribute `createdAt`. Some fields have multiple attributes.

Attributes are named in lowerCamelCase (start with a lowercase letter).

Field types that have multiple attributes:

* Link: *fieldId*, *fieldName*
* Link-Multiple: *fieldIds*, *fieldNames* (ids − array of IDs, names − object of ID => name pairs)
* Link-Parent: *fieldId*, *fieldType*, *fieldName* (type is an entity type)
* Currency: *field*, *fieldCurrency* (currency is a currency code)
* Person Name: *firstName*, *lastName*, *middleName*, *salutationName*
* Address: *fieldStreet*, *fieldCity*, *fieldPostalCode*, *fieldCountry*, *fieldState*

where *field* is the name of the field.

## Link

A link represents a relationship with another entity. Entities have their set of links.

Links are named in lowerCamelCase (start with a lowercase letter).

**The list of available links** for a specific entity type can be obtained at: Administration > Entity Manager > needed entity type > Links > 4th column.

Each relationship between two entity types is a pair of two links on both sides.

Link types:

* belongsTo
* hasMany
* hasOne
* belongsToParent
* hasChildren

Relationship type & link types mapping:

* One-to-Many: hasMany + belongsTo
* Many-to-One: belongsTo + hasMany
* Many-to-Many: hasMany + hasMany
* One-to-One Right: belongsTo + hasOne
* One-to-One Left: hasOne + belongsTo
* Parent-to-Children: hasChildren + belongsToParent
