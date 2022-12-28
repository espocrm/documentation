# app > formula

Path: metadata > app > formula.

Definitions for the formula editor.

## functionList

*Object[]*

Functions available in the editor.

Example:

```json
{
    "functionList": [
        "__APPEND__",
        {
            "name": "myNamespace\\myFunction",
            "insertText": "myNamespace\\myFunction(STRING)",
            "returnType": "string"
        }
    ]

}
```
