# app > regExpPatterns

Path: metadata > app > regExpPatterns.

Predefined regular expression patterns. A name => defs map. Predefined patterns can be used for field validation.

Example:

```json
{
    "myPattern": {
        "pattern": "[0-9A-Za-z_@]+",
        "isSystem": false
    }
}
```

## pattern

*string*

A pattern.

## isSystem

*boolean*

If true, the pattern won't be available when defining a validation for a field.
