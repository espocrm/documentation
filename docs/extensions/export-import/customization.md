# Customization

Some additional features can be configured in the metadata defs. The path is `custom/Espo/Custom/Resources/metadata/exportImportDefs`.

## Export additional fields

If need to export additional fields that out of the standard functionality.

#### exportAdditionalFieldList

Example for Quotes: `custom/Espo/Custom/Resources/metadata/exportImportDefs/Quote.json`

```json
{
    "exportAdditionalFieldList": [
        "itemList"
    ]
}
```

## Skip export list

If need to skip some records like `system` user or others.

#### exportSkipLists

Example for User: `custom/Espo/Custom/Resources/metadata/exportImportDefs/User.json`

```json
{
    "exportSkipLists" : {
        "id": [
            "system"
        ],
        "userName": [
            "tester"
        ]
    }
}
```

## Placeholders

Edit the file: `custom/Espo/Custom/Resources/metadata/exportImportDefs/ENTITY.json`.

### Config

#### Get

```json
{
    "fields": {
        "amountCurrency": {
            "placeholderAction": "Config\\Get",
            "placeholderData": {
                "key": "defaultCurrency",
                "default": null
            }
        }
    }
}
```

### User

#### Password

```json
{
    "fields": {
        "password": {
            "placeholderAction": "User\\Password",
            "placeholderData": {
                "value": "1"
            }
        }
    }
}
```

#### Active

```json
{
    "fields": {
        "isActive": {
            "placeholderAction": "User\\Active"
        }
    }
}
```

### Datetime

#### Now

```json
{
    "fields": {
        "dateStart": {
            "placeholderAction": "DateTime\\Now"
        }
    }
}
```

#### ExportDifference

The difference between the record date and the export date.
E.g. record date = `2025-05-01`, export date = `2025-08-01`. When import data at `2025-12-01`, the record data will be `2025-09-01`.

```json
{
    "fields": {
        "dateStart": {
            "placeholderAction": "DateTime\\ExportDifference"
        }
    }
}
```

#### ExportDifferenceField

The same logic as `ExportDifference`, but the initial value gets from another field.

```json
{
    "fields": {
        "createdAt": {
            "placeholderAction": "DateTime\\ExportDifferenceField",
            "placeholderData": {
                "field": "dateStart"
            }
        }
    }
}
```

To get the initial value from a couple fields. The value will be obtained from the first defined field.

```json
{
    "fields": {
        "createdAt": {
            "placeholderAction": "DateTime\\ExportDifferenceField",
            "placeholderData": {
                "fieldList": [
                    "dateStart",
                    "dateEnd",
                    "dateCompleted"
                ]
            }
        }
    }
}
```

#### CurrentMonth

```json
{
    "fields": {
        "dateStart": {
            "placeholderAction": "DateTime\\CurrentMonth"
        }
    }
}
```

#### CurrentYear

```json
{
    "fields": {
        "dateStart": {
            "placeholderAction": "DateTime\\CurrentYear"
        }
    }
}
```
