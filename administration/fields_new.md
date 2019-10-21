# Fields

## Field types

The list of field types available for creating:

* [Varchar](#varchar) – a single-line text;
* [Enum](#enum) – selectbox, only one value can be selected;
* [Text](#text) – a multiline text with markdown support;
* [Date](#date) – date w/o time;
* [Date-Time](#date-time) – date and time;
* [Currency](#currency) – for currency values, a pair of number and currency;
* [Int](#int) – a whole number;
* [Float](#float) – a number with a decimal part;
* [Boolean](#boolean) – a checkbox;
* [Multi-Enum](#multi-enum) – a list of values, multiple values can be selected;
* [Checklist](#checklist) – a list of checkboxes;
* [Array](#array) – a list of values, similar to Multi-Enum field;
* [Address](#address) – an address with street, city, state, postal code and country;
* [Address City](#addressCity)
* [Address Country](#addressCountry)
* [Address PostalCode](#addressPostalCode)
* [Address State](#addressState)
* [Address Street](#addressStreet)
* [Address Map](#addressMap)
* [Url](#url) – for storing links;
* [Wysiwyg](#wysiwyg) – similar to Text field, but with HTML support;
* [File](#file) – for file uploading;
* [Image](#image) – for image uploading;
* [Attachment-Multiple](#attachment-multiple) – for multiple file uploading;
* [Number](#number) – an auto-incrementing number of string type with a possible prefix and specific length;
* [Auto-increment](#auto-increment) – a generated read-only auto-incrementing integer number.
* [Foreign](#foreign) – shows a value of the related record. 

Field types not available for creating directly:

* [Email](#email) – a set of email addresses;
* [Email Address Is Opted Out](#emailAddressIsOptedOut)
* [Phone](#phone) – a set of phone numbers;
* [Phone Number Is Opted Out](#phoneNumberIsOptedOut)
* [Link](#link) – a record related through *Belongs-To* (*many-to-one* or *one-to-one*) relationship;
* [Link-Parent](#link-parent) – a record related through *Belongs-To-Parent* relationship; can be of different entity types;
* [Link-Multiple](#link-multiple) – a set of records related through *Has-Many* relationship.

Defined dinamic logic in field:

* [Dynamic logic](#dynamicLogic)

----

## Varchar

Field parameters in JSON format:
```
{
    "name": "varchar",
    "type": "varchar",
    "trim": true,
    "options": [],
    "isCustom": true,
    "required": false,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "dynamicLogicOptions": null,
    "inlineEditDisabled": false,
    "default": null,
    "maxLength": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

## Enum

Field parameters in JSON format:
```
{
    "name": "enum",
    "type": "enum",
    "options": [
    "Test_1",
    "Test_2"
    ],
    "style": {
    "Test_1": null,
    "Test_2": null
    },
    "default": "Test_1",
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "dynamicLogicOptions": null,
    "displayAsLabel": true,
    "audited": true,
    "tooltipText": "test_enum",
    "inlineEditDisabled": false,
    "required": false,
    "isSorted": false,
    "readOnly": false,
    "tooltip": true
}
```

## Text

Field parameters in JSON format:
```
{
    "name": "text",
    "type": "text",
    "rowsMin": 2,
    "cutHeight": 200,
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "maxLength": 100,
    "default": "ABC",
    "rows": 5,
    "inlineEditDisabled": false,
    "required": false,
    "seeMoreDisabled": false,
    "displayRawText": false,
    "readOnly": false,
    "tooltip": false
}
```

## Date

Field parameters in JSON format:
```
{
    "name": "date",
    "notNull": false,
    "type": "date",
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "useNumericFormat": true,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "after": null,
    "before": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

## Date-Time

Field parameters in JSON format:
```
{
    "name": "dateTime",
    "notNull": false,
    "type": "datetime",
    "minuteStep": 30,
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "required": false,
    "useNumericFormat": true,
    "inlineEditDisabled": false,
    "default": null,
    "after": null,
    "before": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

## Currency

Field parameters in JSON format:
```
{
    "name": "currency",
    "type": "currency",
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "min": 100,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "max": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

## Int

Field parameters in JSON format:
```
{
    "name": "integer",
    "type": "int",
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "min": 1,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "max": null,
    "disableFormatting": false,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

## Float

Field parameters in JSON format:
```
{
    "name": "float",
    "notNull": false,
    "type": "float",
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "min": null,
    "max": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

## Boolean

Field parameters in JSON format:
```
{
    "name": "boolean",
    "notNull": true,
    "type": "bool",
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicReadOnly": null,
    "inlineEditDisabled": false,
    "default": false,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

## Multi-Enum

Field parameters in JSON format:
```
{
    "name": "multiEnum",
    "type": "multiEnum",
    "storeArrayValues": true,
    "options": [
    "test_1",
    "test_2"
    ],
    "style": {
    "test_1": null,
    "test_2": null
    },
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "dynamicLogicOptions": null,
    "inlineEditDisabled": false,
    "required": false,
    "isSorted": false,
    "allowCustomOptions": false,
    "maxCount": null,
    "displayAsLabel": false,
    "displayAsList": false,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

## Checklist

Field parameters in JSON format:
```
{
    "name": "checklist",
    "type": "checklist",
    "storeArrayValues": true,
    "options": [
        "test_1",
        "test_2",
        "test_3"
    ],
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "dynamicLogicOptions": null,
    "inlineEditDisabled": false,
    "required": false,
    "isSorted": false,
    "maxCount": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

## Array

Field parameters in JSON format:
```
{
    "name": "array",
    "type": "array",
    "storeArrayValues": true,
    "options": false,
    "isCustom": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "dynamicLogicOptions": null,
    "inlineEditDisabled": false,
    "required": false,
    "noEmptyString": false,
    "maxCount": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```
## Address

Field parameters in JSON format:
```
{
    "name": "address",
    "type": "address",
    "dynamicLogicVisible": null,
    "dynamicLogicReadOnly": null,
    "inlineEditDisabled": false,
    "tooltip": true,
    "isCustom": true
}
```
### addressCity

Field parameters in JSON format:
```
{
    "name": "addressCity",
    "type": "varchar",
    "trim": true,
    "maxLength": 255,
    "view": "views/fields/address-city",
    "customizationOptionsDisabled": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "dynamicLogicOptions": null,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```
### addressCountry

Field parameters in JSON format:
```
{
    "name": "addressCountry",
    "type": "varchar",
    "trim": true,
    "maxLength": 255,
    "view": "views/fields/address-country",
    "customizationOptionsDisabled": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "dynamicLogicOptions": null,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

### addressPostalCode

Field parameters in JSON format:
```
{
    "name": "addressPostalCode",
    "type": "varchar",
    "maxLength": 40,
    "trim": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "dynamicLogicOptions": null,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "options": [],
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

### addressState

Field parameters in JSON format:
```
{
    "name": "addressState",
    "type": "varchar",
    "trim": true,
    "maxLength": 255,
    "view": "views/fields/address-state",
    "customizationOptionsDisabled": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "dynamicLogicOptions": null,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

### addressStreet

Field parameters in JSON format:
```
{
    "name": "addressStreet",
    "type": "text",
    "maxLength": 255,
    "dbType": "varchar",
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "seeMoreDisabled": false,
    "rows": null,
    "cutHeight": null,
    "displayRawText": false,
    "readOnly": false,
    "tooltip": false
}
```

### addressMap

Field parameters in JSON format:
```
{
    "name": "addressMap",
    "type": "map",
    "notStorable": true,
    "readOnly": true,
    "layoutListDisabled": true,
    "provider": "Google",
    "height": 300,
    "exportDisabled": true,
    "importDisabled": true,
    "dynamicLogicVisible": null,
    "dynamicLogicReadOnly": null,
    "inlineEditDisabled": false,
    "tooltip": false
}
```

## Url

Field parameters in JSON format:
```
{
    "name": "url",
    "type": "url",
    "isCustom": true,
    "strip": true,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "maxLength": null,
    "audited": false,
    "readOnly": false,
    "tooltip": false
}
```

## Wysiwyg

Field parameters in JSON format:
```
{
    "name": "wysiwyg",
    "type": "wysiwyg",
    "isCustom": true,
    "useIframe": false,
    "dynamicLogicVisible": null,
    "dynamicLogicRequired": null,
    "dynamicLogicReadOnly": null,
    "inlineEditDisabled": false,
    "required": false,
    "default": null,
    "height": null,
    "minHeight": null,
    "readOnly": false,
    "tooltip": false
}
```

## File

Field parameters in JSON format:
```
{
    "type": "file",
    "sourceList": [
        "Document"
    ],
    "accept": [
        "image/*",
        ".pdf"
    ],
    "isCustom": true,
    "maxFileSize": 6,
    "label": "File"
}
```

## Image

Field parameters in JSON format:
```
{
    "type": "image",
    "previewSize": "small",
    "isCustom": true,
    "maxFileSize": 3,
    "label": "Image"
}
```

## Attachment-Multiple

Field parameters in JSON format:
```
{
    "type": "attachmentMultiple",
    "previewSize": "medium",
    "sourceList": [],
    "accept": [],
    "isCustom": true,
    "label": "Attachment Multiple"
}
```
## Number

Field parameters in JSON format:
```
{
    "type": "number",
    "len": 36,
    "notNull": false,
    "unique": false,
    "nextNumber": 4,
    "padLength": 5,
    "isCustom": true,
    "prefix": "Q-",
    "label": "Number (auto-increment)"
}
```

## Auto-increment

Field parameters in JSON format:
```
{
    "type": "autoincrement",
    "autoincrement": true,
    "unique": true,
    "isCustom": true,
    "label": "Auto-increment"
}
```

## Email

Field parameters in JSON format:
```
{
    "type": "email",
    "isPersonalData": true,
    "label": "Email"
}
```
### emailAddressIsOptedOut

Field parameters in JSON format:
```
{
    "type": "bool",
    "notStorable": true,
    "layoutDetailDisabled": true,
    "layoutDefaultSidePanelDisabled": true,
    "mergeDisabled": true,
    "foreignAccessDisabled": true,
    "customizationDefaultDisabled": true,
    "customizationReadOnlyDisabled": true,
    "label": "Email Address is Opted-Out"
}
```

## Phone

Field parameters in JSON format:
```
{
    "type": "phone",
    "typeList": [
        "Office",
        "Mobile",
        "Fax",
        "Other"
    ],
    "defaultType": "Office",
    "label": "Phone"
}
```

### phoneNumberIsOptedOut

Field parameters in JSON format:
```
{
    "type": "bool",
    "notStorable": true,
    "layoutDetailDisabled": true,
    "layoutDefaultSidePanelDisabled": true,
    "foreignAccessDisabled": true,
    "mergeDisabled": true,
    "customizationDefaultDisabled": true,
    "customizationReadOnlyDisabled": true,
    "label": "Phone Number is Opted-Out"
}
```

## Link

Field parameters in JSON format:
```
{
    "type": "link",
    "required": true,
    "view": "views/fields/assigned-user",
    "label": "Assigned User"
}
```

## Link-Parent

Field parameters in JSON format:
```
{
    "type": "linkParent",
    "entityList": [
        "Account",
        "Contact",
        "Lead",
        "Opportunity",
        "Case",
        "Person"
    ],
    "label": "Parent"
}
```

## Link-Multiple

Field parameters in JSON format:
```
{
    "type": "linkMultiple",
    "view": "views/fields/teams",
    "label": "Teams"
}
```

## Foreign

Field parameters in JSON format:
```
{
    "readOnly": true,
    "type": "foreign",
    "link": "createdBy",
    "field": "isAdmin",
    "view": "views/fields/foreign-bool",
    "isCustom": true,
    "label": "Foreign"
}
```

## dynamicLogic

Dynamic Logic parameters in JSON format:
```
{
    "dynamicLogicVisible": {
    "conditionGroup": [
      {
        "type": "isEmpty",
        "attribute": "addressCity"
      }
    ]
    },
    "dynamicLogicRequired": {
    "conditionGroup": [
      {
        "type": "and",
        "value": [
          {
            "type": "isNotEmpty",
            "attribute": "addressCity"
          },
          {
            "type": "isEmpty",
            "attribute": "addressStreet"
          }
        ]
      }
    ]
    },
    "dynamicLogicReadOnly": {
    "conditionGroup": [
      {
        "type": "not",
        "value": {
          "type": "isEmpty",
          "attribute": "assignedUserId",
          "data": {
            "field": "assignedUser"
          }
        }
      }
    ]
    }
}
```