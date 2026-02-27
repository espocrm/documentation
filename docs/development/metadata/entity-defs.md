# entityDefs

Path: metadata > entityDefs > {EntityType}.

Contains entity definitions, particularly fields, links and indexes.

```json
{

    "fields": {},
    "links": {},
    "indexes": {},
    "collection": {}
}
```

## fields

A field-name => parameters map.


```json

{
    "fields": {
        "myField": {
            "type": "varchar",
            "someParam": "someValue"
        }
    }
}
```

Here are defined: common parameters as well as parameters specific for a field type (defined in metadata > fields > {fieldType} > params).

Common parameters are listed below.

### type

*string*

A field type.

### notStorable

*boolean*

The field will be marked as not-storable, a DB column won't be created.

### orderDisabled

*boolean*

*As of v8.3.*

Disables the ability to sort by the field.

### readOnly

*boolean*

Read-only fields are stripped from a payload received from the front-end. Fields are not editable.


### view

*string*

A custom field view. If not specified, then a value from metadata > fields > {fieldType} > view is used.

### index

*boolean*

To create a DB index for the field.

### dbType

*string*

Overrides the type of the DB column.

### disabled

*boolean*

Disables the field.

### utility

*As of v8.0.*

*boolean*

The field will be hidden from the user on the UI whenever possible.

### tooltip

*boolean|string*

Enable a tooltip for the field. A tooltip text is taken from the language by: {EntityType} > tooltips > {fieldName}.

If defined as a string, then text will be taken from the language by a path {EntityType} > tooltips > {value}.

If defined as a string containing a dot character, then parsed with {EntityType}.{key} format, a text will be taken by a path {EntityType} > tooltips > {key} (as of v8.0).

### validatorClassName

*class-string*

A field validator. Legacy, consider using *validatorClassNameMap* or *validatorClassNameList*.

### validatorClassNameMap

*Object.<string, class-string\>*

*As of v7.4.*

Validators defined as validation-type => class-name map. Classes should implement `Espo\Core\FieldValidation\Validator` interface. If not defined for a type, metadata > fields > {fieldType} > validatorClassNameMap > {type} is used.

Example:

```json
{
    "validatorClassNameMap": {
        "required": "Espo\\Modules\\MyModule\\Classes\\FieldValidators\\MyField\\RequiredValidator"
    }
}
```

See more about [field validation](fields.md#validationlist).

### validatorClassNameList

*class-string[]*

A list of additional validators. Should implement `Espo\Core\FieldValidation\Validator` interface.

### forceValidation

*boolean*

*As of v8.2.*

Always to perform validation, regardless whether field values are sent.

### validationList[]

*string*

A custom validation list for the field. Use this parameter to re-define validations applied for a specific field. By default, [validations](fields.md#validationlist) for a field type are applied.

### mandatoryValidationList

*string[]*

A custom mandatory validation list for the field. Use this parameter to re-define mandatory validations applied for a specific field. By default, [mandatory validations](fields.md#mandatoryvalidationlist) for a field type are applied.

### suppressValidationList

*string[]*

*As of v8.0.*

A validation list to be bypassed for the field.

### sanitizerClassNameList

*class-string[]*

*As of v8.1.*

A list of input sanitizers. Should implement `Espo\Core\FieldSanitize\Sanitizer` interface.

### sanitizerSuppressClassNameList

*class-string[]*

*As of v8.3.*

A list of input sanitizers to be by-passed.

### customizationDisabled

*boolean*

Disables the ability to customize the field in the Entity Manager tool.

### dynamicLogicDisabled

*boolean*

Dynamic logic cannot be customized.

### fieldManagerParamList

*string[]*

Parameters available in the Entity Manager tool when editing the field. Specify an empty array to disable all parameters.

### fieldManagerAdditionalParamList

*object[]*

Additional field parameters available in the Entity Manager.

### layoutAvailabilityList

*string[]*

A list of layout types available for the field. Specify an empty array to disable in all layouts. If not specified, then no limitation is applied.

Example:

```json
{
    "layoutAvailabilityList": [
        "list",
        "detail"
    ]
}
```

### layoutIgnoreList

*string[]*

*As of v8.2.*

A list of layout types not available for the field.

### textFilterDisabled

*boolean*

To disable the ability to add the field to text filters (in the Entity Manager tool).

### directAccessDisabled

*boolean*

Indicates that the field value is not accessed or written directly but through some additional logic. The field won't be available in PDF Templates, Email Templates and some other tools.

### directUpdateDisabled

*boolean*

Indicates that updating the field directly is not possible. The parameter is not needed if *directAccessDisabled* is true.

### directUpdateEnabled

*boolean*

*As of v9.3.*

Indicates that updating the field directly is possible. To be used if directAccessDisabled is true to indicate that update is possible.

### filtersEnabled

*boolean*

*As of v9.2.*

Indicates that the field can be used in filters regardless of directAccessDisabled being set to true. To be used only with directAccessDisabled.

### listColumnEnabled

*boolean*

Indicated that the field can be used in list columns regardless of directAccessDisabled being set to true.

### importDisabled

*boolean*

To disable the ability to import the field.

### importEnabled

*boolean*

*As of v9.3.*

Indicates that import for the field is allowed even if directAccessDisabled or directUpdateDisabled are true.

### massUpdateDisabled

*boolean*

*As of v8.4.*

To mass-update for the field.

### exportDisabled

*boolean*

To disable the ability to export the field.

### apiSpecDisabled

*boolean*

*As of v9.3.*

Do not print the field in the OpenAPI spec.

### isPersonalData

*boolean*

Whether the field may contain personal data.

### valueFactoryClassName

*class-string<Espo\ORM\Value\ValueFactory\>*

A factory for [value objects](../orm-value-objects.md). For field types it's defined at metadata > fields. Here you can define a factory for a specific field.

### attributeExtractorClassName

*class-string<Espo\ORM\Value\AttributeExtractor\>*

An extractor for [value objects](../orm-value-objects.md). For field types it's defined at metadata > fields. Here you can define an extractor for a specific field.

### duplicatorClassName

*class-string<Espo\Core\Record\Duplicator\FieldDuplicator\>*

Duplicates attributes of a field. Some fields can require some processing when an entity is being duplicated.

### duplicateIgnore

*boolean*

Do not carry over a field value when duplicating an entity.

### optimisticConcurrencyControlIgnore

*boolean*

*As of v9.1.*

Ignore optimistic concurrency control.

### additionalAttributeList

*string[]*

Additional attributes for a field. Attribute name will be derived by concatenating the specified name with the field name.

### fullNameAdditionalAttributeList

*string[]*

Additional attributes for a field. As of v9.2.

### dependeeAttributeList

*string[]*

Dependee attributes.

### loaderClassName

*class-string<Espo\Core\FieldProcessing\Loader>*

*As of v9.1.*

Loads the field value. Can be used to load non-storable fields (not stored in the entity table).

Within an API request (Record service), processed after *readLoaderClassNameList*.

### select

*Object*

A custom [complex expression](../../user-guide/complex-expressions.md) to be used for the field when reading from DB. It's possible to define *leftJoins* and *joins* that are needed to be applied when the field is being selected.

Example:

```json
{
    "fields": {
        "myField": {
            "type": "float",
            "readOnly": true,
            "notStorable": true,
            "select": {
                "select": "DIV:(MUL:(amount, probability, someTableAlias.rate), 100)",
                "leftJoins": [
                    [
                        "SomeTable",
                        "someTableAlias",
                        {"someTableAlias.id:": "amountCurrency"}
                    ]
                ]
            }
        }
    }
}
```

Parameters:

* select – *string* – select expressions;
* leftJoins – *Array[]* – left joins to apply;
* joins – *Array[]* – joins to apply;

### order

*Object*

Custom [complex expressions](../../user-guide/complex-expressions.md) to be used when ordering by the field. It's possible to define *leftJoins* and *joins* that are needed to be applied.

Example:

```json
{
    "fields": {
        "myField": {
            "type": "float",
            "readOnly": true,
            "notStorable": true,
            "order": {
                "order": [
                    ["DIV:(MUL:(amount, probability, someTableAlias.rate), 100)", "{direction}"]
                ],
                "leftJoins": [
                    [
                        "SomeTable",
                        "someTableAlias",
                        {"someTableAlias.id:": "amountCurrency"}
                    ]
                ]
            }
        }
    }
}
```

Parameters:

* order – *Array[]* – order expressions;
* leftJoins – *Array[]* – left joins to apply;
* joins – *Array[]* – joins to apply;
* additionalSelect – *string[]* – additional columns to be selected when order by the field is applied.

### where

*Object*

Custom where clause to be used when the field is met in a provided where-clause. It's possible to define *leftJoins* and *joins* that are needed to be applied. Every comparison operation that you need to support should have its own definitions.

Supported comparison keys:

* `=`
* `<>`
* `<`
* `>`
* `<=`
* `>=`
* `IS NULL`
* `IS NOT NULL`
* `LIKE`
* `NOT LIKE`
* `IN`
* `NOT IN`
* `= TRUE`
* `= FALSE`

Supported parameters:

* whereClause – where-clause;
* leftJoins – *Array[]* – left joins to apply;
* joins – *Array[]* – joins to apply;
* distinct – bool – apply DISTINCT to the query;

Example:

```json
{
    "fields": {
        "myField": {
            "type": "float",
            "readOnly": true,
            "notStorable": true,
            "where": {
                "=": {
                    "whereClause": {
                        "DIV:(MUL:(amount, probability, someTableAlias.rate), 100)=": "{value}"
                    },
                    "leftJoins": [
                        [
                            "SomeTable",
                            "someTableAlias",
                            {"someTableAlias.id:": "amountCurrency"}
                        ]
                    ]
                },
                "IS NULL": {
                    "whereClause": {
                       "IS_NULL:(amount)": true
                    }
                }
            }
        }
    }
}
```

### massUpdateActionList

*string[]*

Actions for mass update.

### notLockable

*boolean*

The field is not locked when the record is locked. As of v9.4.

## links

A link-name => parameters map.

Example:

```json

{
    "links": {
        "myLink1": {
            "type": "belongsTo",
            "entity": "ForeignEntity",
            "foreign": "foreignLink1"
        },
        "myLink2": {
            "type": "hasMany",
            "entity": "ForeignEntity",
            "foreign": "foreignLink2"
        }
    }
}
```

Parameters are listed below.

### type

*string*

A link type.

Available types:

* belongsTo
* hasMany
* hasOne
* belongsToParent
* hasChildren

### entity

*string*

A foreign entity type.

### foreign

*string*

A foreign link name.


Parameters for specific types are listed below.

### noJoin

*boolean*

*(available for belongsTo, hasOne)*

Prevents joining a foreign table when fetching a record.

### foreignName

*string*

*(available for belongsTo, hasOne)*

A field to be used as a name of a foreign record. Needed when a foreign entity type does not have the field *name*.

### audited

*boolean*

*(available for hasMany)*

Linking and unlinking will be logged in the Stream.

### auditView

*string*

*As of v9.2.3.*

A view used for audit. If not specified, the ordinary view is used.

### readOnly

*boolean*

Read-only links cannot be edited via link and unlink requests. Not possible to relate or unrelate records via the relationship panel. Read-only links can still be edited via the link and link-multiple fields.

### layoutRelationshipsDisabled

*boolean*

*(available for hasMany)*

Makes the link not available in the Bottom Panels layout (in the Layout Manager tool).

### relationName

*string*

*(available for hasMany)*

A relationship name. Defines how a middle table will be named (for a many-to-many relationships).

### additionalColumns

*Object*

*(available for hasMany)*

Additional columns to be created in a middle table (for a many-to-many relationships).

Example:

```json
{
    "additionalColumns": {
        "role": {
            "type": "varchar",
            "maxLength": 64
        },
        "isPrimary": {
            "type": "bool",
            "default": false
        }
    }
}
```

### conditions

*(available for hasMany)*

Where-conditions (for a many-to-many relationships). If multiple links share the same relationship name (middle table), conditions must be defined for each link.

Example:

```json
{
    "links": {
        "toEmailAddresses": {
            "type": "hasMany",
            "entity": "EmailAddress",
            "relationName": "emailEmailAddress",
            "conditions": {
                "addressType": "to"
            },
            "additionalColumns": {
                "addressType": {
                    "type": "varchar",
                    "len": "4"
                }
            }
        },
        "ccEmailAddresses": {
            "type": "hasMany",
            "entity": "EmailAddress",
            "relationName": "emailEmailAddress",
            "conditions": {
                "addressType": "cc"
            },
            "additionalColumns": {
                "addressType": {
                    "type": "varchar",
                    "len": "4"
                }
            }
        }
    }
}
```

### indexes

*(available for hasMany)*

*Object.<string, Object\>*

Indexes for a middle table. Definition is the same as for entity indexes.

### notMergeable

*boolean*

*(available for hasMany, hasChildren)*

Disable merging related records when duplicate records are being merged.

### utility

*boolean*

The link will be hidden from the user on the UI whenever possible.

### disabled

*boolean*

Disables the link.

### apiSpecDisabled

*boolean*

*As of v9.3.*

Do not print the link in the OpenAPI spec.

### deferredLoad

*(available for belongsTo and belongsToParent)*

*As of v9.0.0.*

When getting a related entity from an entity, it will be returned without loaded values. Values will be loaded on accessing. For belongsToParent there's a downside that it can return an entity even if it's deleted.

## collection

Collection parameters.

### orderBy

*string*

The default order-by field.

### order

*"asc"|"desc"*

The default order direction.

### textFilterFields

*string[]*

Fields used by the text filter.

### countDisabled

*boolean*

Disable fetching a total records number (on the list view).

### fullTextSearch

*boolean*

Enable full-text search.

### fullTextSearchOrderType

*"original"|"relevance"|"combined"*

How to order result of full-text search.


## indexes

Database indexes.

Example:

```json
{

    "indexes": {
        "indexName1": {
            "columns": ["createdById", "dateSent"]
        },
        "indexName2": {
            "columns": ["messageId"],
            "unique": true
        }
    }
}
```

### columns

*string[]*

Database columns of the index.

### unique

*boolean*

Whether the index is unique.

## optimisticConcurrencyControl

*boolean*

Enables optimistic concurrency control for the entity type.

## skipRebuild

*boolean*

To skip database table creation for the entity type.

## hooksDisabled

*boolean*

*As of v8.2.*

Disable hooks.

## repositoryClassName

*class-string<Espo\ORM\Repository\Repository\>*

*As of v8.2.*

A repository.

## entityClassName

*class-string<Espo\ORM\Entity\>*

*As of v8.2.*

An entity. Usually should extend `Espo\Core\ORM\Entity`.

## noDeletedAttribute

*boolean*

Disables soft-deletes.

## deleteId

*boolean*

*As of v8.4.*

Adds an additional *deleteId* field that will be written with an random ID when a record is soft-deleted. Useful when need a unique index. Add *deleteId* column to the index.
