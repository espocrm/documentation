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

### tooltip

*boolean|string*

Enable a tooltip for the field. A tooltip text is taken from the language by: {EntityType} > tooltips > {fieldName}.

If defined as a string, then text will be taken from the language by: {EntityType} > tooltips > {value}.

### validatorClassName

*class-string*

A field validator. Legacy, consider using *validatorClassNameMap* or *validatorClassNameList*.

### validatorClassNameMap

*Object.<string, class-string\>*

*As of v7.4.*

Validators defined as validation-type => class-name map. Classes should implement `Espo\Core\FieldValidation\Validator` interface. If not defined, metadata > fields > {fieldType} > validatorClassNameMap is used.

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

### validationList

*string*

A custom validation list for the field. Use this parameter to re-define validations applied for a specific field. By default, [validations](fields.md#validationlist) for a field type are applied.

### mandatoryValidationList

*string*

A custom mandatory validation list for the field. Use this parameter to re-define mandatory validations applied for a specific field. By default, [mandatory validations](fields.md#mandatoryvalidationlist) for a field type are applied.

### customizationDisabled

*boolean*

Disables the ability to customize the field in the Entity Manager tool.

### fieldManagerParamList

*string[]*

Parameters available in the Entity Manager tool when editing the field. Specify an empty array to disable all parameters.

### layoutAvailabilityList

*string[]*

A list of layout types there the field should be available. Specify an empty array to disable in all layouts.

Example:

```json
{
    "layoutAvailabilityList": [
        "list",
        "detail"
    ]
}
```

### textFilterDisabled

*boolean*

To disable the ability to add the field to text filters (in the Entity Manager tool).

### directAccessDisabled

*boolean*

To disable the ability to add the field in formula-script, templates and some other tools.

### importDisabled

*boolean*

To disable the ability to import the field.

### exportDisabled

*boolean*

To disable the ability to export the field.

### isPersonalData

*boolean*

Whether the field may contain personal data.

### valueFactoryClassName

*class-string<Espo\ORM\Value\ValueFactory\>*

A factory for [value objects](../orm-value-objects.md). For field types it's defined at metadata > fields. Here you can define a factory for a specific field.

### attributeExtractorClassName

*class-string<Espo\ORM\Value\AttributeExtractor\>*

An extractor for [value objects](../orm-value-objects.md). For field types it's defined at metadata > fields. Here you can define an extractor for a specific field.

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


Parameters for specific types a listed below.

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

### layoutRelationshipsDisabled

*boolean*

*(available for hasMany)*

Makes the link not available in the Bottom Panels layout (in the Layout Manager tool).

### relationName

*string*

*(available for hasMany)*

A relationship name. Defines how a middle table will be named (for a many-to-many relationships).

### additionalColumns

*Object[]*

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

## collection

Collection parameters.

### orderBy

*string*

The default order-by field.

### orderBy

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

Enabled full-text search.

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

To skip database table creation the entity type.
