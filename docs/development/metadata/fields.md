# fields

Path: metadata > fields > {fieldType}.

Definitions for field types.

## notMergeable

*boolean*

Whether this field type is mergeable (when merging duplicate records).

## notCreatable

*boolean*

Whether the field of this type can be created in the Entity Manager tool.

## readOnly

*boolean*

Is this field type Read Only (can't be edited).
 
## skipOrmDefs

*boolean*

Skip converting to defs for the ORM.

## filter

*boolean*

Records can be filtered by this field (available as filter on the list view). 

## view

*string*

By default, when displaying a field, the system tries to read the view `"views/fields/{field-type}"` (path is `client/src/views/fields/{field-name}.js`). You can define a custom view with this parameter.

## params

Array of field parameters. Theses parameters then can be edited for every field of this field type in the Entity Manager tool.

### Example

```json
{
    "params": [
            [
                "name": "required",
                "type": "bool",
                "default": false
            ],
            [
                "name": "translation",
                "type": "varchar",
                "hidden": true
            ],
            [
                "name": "audited",
                "type": "bool"
            ],
            [
                "name": "readOnly",
                "type": "bool"
            ]
        ]  
}
```

Parameters are passed to the field view in the `params` option.

## fieldDefs

An object of field type definition. The most of them is used as database column parameter:

- *type* – _"varchar"_, _"int"_, _"bool"_, _"text"_, _"float"_ etc.;
- *notNull* – value can't be set as NULL (_true_ | _false_);
- *unique* – value is unique in the table column (_true_ | _false_);
- *autoincrement* - value is autoincrement an is calculated with database (_true_ | _false_).

Some other parameters:

- *notStorable* – the column of field with this field type wont be created in the database (_true_ | _false_);
- *readOnly* – field is not editable (_true_ | _false_);
- *layoutListDisabled* – field can not be displayed on the list view (_true_ | _false_).

## translatedOptions

*boolean*

Does the field have options that can be translated.

## hookClassName

Called after the field is created or edited in the Entity Manager tool.

Available methods:

- onRead
- beforeSave
- afterSave
- beforeRemove
- afterRemove

#### Example

```
"hookClassName": "Espo\\Core\\Utils\\FieldManager\\Hooks\\NumberType"
```

## fields

Definitions of additional fields that will be created with this field. E.g. for address field, separate fields (street, city, etc.) are created.


## naming

_"suffix"_ | _"prefix"_ ("suffix" is default)

The naming determines how additional fields will be named.

#### Example

Field name: *billingAddress*.
Additional field: *country*.
The result (with default _suffix_ naming): *billingAddressCountry*.

## actualFields

*string[]*

The list of actual attributes (which contain useful data). 

For example, for field type `link` in `actualFields` is `['id']`, in `notActualFields` is `['name']`.
Means, if you load record with link field, you have values in `{fieldName}Id` and `{fieldName}Name` (suffix naming). But you need set only `{fieldName}Id`, if you want to update this field.

Attributes for field are created by the ORM Converter framework.

## notActualFields

*string[]*

The list of not actual attributes.

## personalData

*boolean*

Where the field may contain personal data.

## textFilter

*boolean*

The field will be available in the list of text filters (in the Entity Manager tool).

## textFilterForeign

*boolean*

The field will be available in the list of text filters as a foreign field.

## linkDefs

*Object*

If defined, a link with the same name as the field name will be created. Defines link parameters.

## fullTextSearch

*boolean*

Full-text search will be available for the field.

## fullTextSearchColumnList

*string[]*

Columns used in full-text search.

## valueFactoryClassName

*class-string<Espo\ORM\Value\ValueFactory\>*

A factory that creates value-objects for this field. A value-object can be obtained by calling `getValueObject` method on an `Entity`.

## attributeExtractorClassName

*class-string<Espo\ORM\Value\AttributeExtractor\>*

A class that extracts values (attribute => value map) from a value-object. Used internally for obtaining values from a value-object and writing them to an entity.

## validationList

*string[]*

Validations applied server-side.

## mandatoryValidationList

*string[]*

Mandatory validations applied server-side. The difference from regular validations is that mandatory are applied always, regardless a corresponding field parameter. E.g. if a field has a parameter *required = false*, then the validation *required* won't be applied unless it's listed as mandatory.


## validatorClassNameMap

*Object.<string, class-string<Espo\Core\FieldValidation\Validator\>\>*

*As of v7.3.*

Validators defined as validation-type => class-name map.

Example:

```json
{
    "validatorClassNameMap": {
        "required": "Espo\\Modules\\MyModule\\Classes\\FieldValidators\\MyField\\RequiredValidator"
    }
}
```

## validatorClassName

A validator class name. The class should contain validation method corresponding to validations listed in *validationList* and *mandatoryValidationList*. This is a legacy, consider using *validatorClassNameMap*. If not defined, then a class `Espo\Classes\FieldValidations\{Type}Type` is used.

## duplicatorClassName

*class-string<Espo\Core\Record\Duplicator\FieldDuplicator\>*

Duplicates attributes of a field. Some fields can require some processing when an entity is being duplicated.

## converterClassName

*class-string<Espo\Core\Utils\Database\Orm\FieldConverter\>*

*As of v7.4.*

Converts field metadata to ORM metadata.

## sanitizerClassName

*class-string<Espo\Core\FieldSanitize\Sanitizer\>*

*As of v8.1.*

An input sanitizer.
