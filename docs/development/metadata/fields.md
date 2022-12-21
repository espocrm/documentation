# Metadata > Fields

Definitions for field types.

Path: `metadata/fields/{fieldType}.json`

## notMergeable

_true_ | _false_

Whether this field type is mergeable (when merging duplicate records).

## notCreatable

_true_ | _false_

Whether the field of this type can be created in the Entity Manager tool.

## readOnly

_true_ | _false_

Is this field type Read Only (can't be edited).
 
## skipOrmDefs

_true_ | _false_

Skip converting to defs for the ORM.

## filter

_true_ | _false_

Records can be filtered by this field (available as filter on the list view). 

## view

By default when displaying a field the system try to read the view `"views/fields/{field-type}"` (path is `client/src/views/fields/{field-name}.js`). You can define a custom view with this parameter.

## params

Array of field parameters. Theses parameters then can be edited for every field of this field type in the Entity Manager tool.

### Example

```
[
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
```

Parameters are passed to the field view in the `params` option.

## fieldDefs

An object of field type definition. The most of them is used as database column parameter:
- `type` - _"varchar"_, _"int"_, _"bool"_, _"text"_, _"float"_ etc.;
- `notNull` - value can't be set as NULL (_true_ | _false_);
- `unique` - value is unique in the table column (_true_ | _false_);
- `autoincrement` - value is autoincrement an is calculated with database (_true_ | _false_).

Also you can set here such definition as:
- `notStorable` - the column of field with this field type wont be created in the database (_true_ | _false_);
- `readOnly` - field is not editable (_true_ | _false_);
- `layoutListDisabled` - field can notbe displayed on the list view (_true_ | _false_).

## translatedOptions

_true_ | _false_

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

The naming determine how additional fields will be name.

### Example

Field name: *billingAddress*.
Additional field: *country*.
The result (with default _suffix_ naming): *billingAddressCountry*.

## actualFields

The list of actual attributes (which contain useful data). 

For example, for field type `link` in `actualFields` is `['id']`, in `notActualFields` is `['name']`.
Means, if you load record with link field, you have values in `{fieldName}Id` and `{fieldName}Name` (suffix naming). But you need set only `{fieldName}Id`, if you want to update this field.

Attributes for field are created by the ORM Converter framework.

## notActualFields

The list of not actual attributes.

## personalData

*boolean*

Wherer the field may contain personal data.

## valueFactoryClassName

A factory that creates value-objects for this field. Should implement `Espo\ORM\Value\ValueFactory` inteface. Value-object can be obtainer by calling `getValueObject` method on an `Entity`.

## attributeExtractorClassName

A class that extracts values (attribute => value map) from a value-object. Used internally for obtaining values from a value-object and writting them to an entity. Should implement `Espo\ORM\Value\AttributeExtractor`.
