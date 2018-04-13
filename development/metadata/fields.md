# Field Definition



### notMergeable

_true_ | _false_

If you merge records, is this field type mergeable.

### notCreatable

_true_ | _false_

Could be created a field with this type in Entity Manager.

### readOnly

_true_ | _false_

Is this field type Read Only (coudn't be edit)
 
### skipOrmDefs

_true_ | _false_

Skip convert in ORM

### filter

_true_ | _false_

Entity could be filtered by field with this field type. 

### view

By default for displaying a field with this field type  the system try to read the view `"views/fields/{field-type}"` (path is `client/src/views/fields/{field-name}.js`). But if want to define own view, you can set this parameter here.

### params

Array of fields, that described field type parameters. This parameters could be set for each field with this field type in Entity Manager.

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
- `type` - "varchar", "int", "bool", "text", "float" etc.;
- `notNull` - value can't be set as NULL; (_true_ | _false_)
- `unique` - value is unique in the table column; (_true_ | _false_)
- `autoincrement` - value is autoincrement an is calculated with database. (_true_ | _false_)

Also you can set here such definition as:
- `notStorable` - the column of field with this field type wont be created in the database; (_true_ | _false_)
- `readOnly` - field is not editable; (_true_ | _false_)
- `layoutListDisabled` - field can notbe displayed on the list view. (_true_ | _false_)

### translatedOptions

(_true_ | _false_)

Does field have options, which can be translated


### hookClassName

If field value has to be set before saving, here you need to set a class name of hook

#### Example

```
"hookClassName": "\\Espo\\Core\\Utils\\FieldManager\\Hooks\\NumberType"
```

### actualFields

### notActualFields

### fields

### naming

_"suffix"_ | _"prefix"_ ("suffix" is default)
