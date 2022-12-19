# Field-type definition

Path: `metadata/fields/{fieldType}.json`

### notMergeable

_true_ | _false_

Whether this field type is mergeable (when merging duplicate records).

### notCreatable

_true_ | _false_

Whether the field of this type can be created in the Entity Manager tool.

### readOnly

_true_ | _false_

Is this field type Read Only (can't be edit).
 
### skipOrmDefs

_true_ | _false_

Skip converting to defs for ORM.

### filter

_true_ | _false_

Entity could be filtered by field with this field type. 

### view

By default for displaying a field of this field type the system try to read the view `"views/fields/{field-type}"` (path is `client/src/views/fields/{field-name}.js`). But if want to define own view, you can set this parameter here.

### params

Array of fields, that described field type parameters. This parameters could be set for each field of this field type in the Entity Manager.

#### Example

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

### fieldDefs

An object of field type definition. The most of them is used as database column parameter:
- `type` - _"varchar"_, _"int"_, _"bool"_, _"text"_, _"float"_ etc.;
- `notNull` - value can't be set as NULL (_true_ | _false_);
- `unique` - value is unique in the table column (_true_ | _false_);
- `autoincrement` - value is autoincrement an is calculated with database (_true_ | _false_).

Also you can set here such definition as:
- `notStorable` - the column of field with this field type wont be created in the database (_true_ | _false_);
- `readOnly` - field is not editable (_true_ | _false_);
- `layoutListDisabled` - field can notbe displayed on the list view (_true_ | _false_).

### translatedOptions

_true_ | _false_

Does the field have options that can be translated.


### hookClassName

If field value has to be set before saving, here you need to set a class name of hook. 

Available methods:
- onRead;
- beforeSave;
- afterSave;
- beforeRemove;
- afterRemove.

#### Example

```
"hookClassName": "Espo\\Core\\Utils\\FieldManager\\Hooks\\NumberType"
```
You can find this class in `application/Espo/Core/Utils/FieldManager/Hooks/NumberType.php` and read the code.


### fields

The definition of all additional fields that contain this field type.


### naming

_"suffix"_ | _"prefix"_ ("suffix" is default)

Naming is used for genefation a full name of additional fields. Field name + field from parameter fields.

#### Example

Field name - __billingAddress__

One of address type field - __country__

The result (with default _suffix_ naming) - __billingAddressCountry__


### actualFields

The list of actual fields.


### notActualFields

The list of not actual fields.

For example, for field type `link` in `actualFields` is `['id']`, in `notActualFields` is `['name']`.
Means, if you load record with link field, you have values in `{fieldName}Id` and `{fieldName}Name` (suffix naming). But you need set only `{fieldName}Id`, if you want to update this field.
