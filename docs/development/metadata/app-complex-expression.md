# app > complexExpression

Path: metadata > app > complexExpression.

Definitions for the [complex expression](../user-guide/complex-expressions.md) editor.

## functionList

*Object[]*

Functions available in the editor when editing complex expression.

Example:

```json
{
    "functionList": [
        "__APPEND__",
        {
            "name": "MY_CUSTOM_FUNCTION",
            "insertText": "MY_CUSTOM_FUNCTION:(VALUE1, VALUE2)",
            "returnType": "bool"
        }
    ]
}
```
