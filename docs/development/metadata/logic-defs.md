# logicDefs

Path: metadata > logicDefs > {Scope}

[Dynamic logic](../../administration/dynamic-logic.md) definitions for an entity type.

*As of v9.1.*

*Before v9.1, it was defined in clientDefs.*

Example:

```json
{
    "fields": {
        "fieldName": {
            "visible": {
                "conditionGroup": []
            },
            "required": {
                "conditionGroup": []
            },
            "readOnly": {
                "conditionGroup": []
            },
            "readOnly": {
                "conditionGroup": []
            },
            "readOnlySaved": {
                "conditionGroup": []
            }
            "invalid": {
                "conditionGroup": []
            }
        }
    },
    "panels": {
        "panelName": {
            "visible": {
                "conditionGroup": []
            }
        }
    },
    "options": {
        "fieldName": [
            {
                "optionList": [
                    "Value 1",
                    "Value 2"
                ],
                "conditionGroup": []
            },
            {
                "optionList": [
                    "Value 3",
                    "Value 4"
                ],
                "conditionGroup": []
            }
        ]
    }
}
```

## fields

## panels

## options
