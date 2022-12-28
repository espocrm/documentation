# app > currency

Path: metadata > app > currency.

Currency definitions.

## symbolMap

*Object<string, string\>*

A currency-name => symbol mapping.

Example:

```json
{
    "EUR":"€",
    "GBP":"£"
}
```

## list

*string[]*

A list of currencies available in the system. Values defined as 3-letter currency codes in ISO 4217 standard. Use `__APPEND__` to add new currencies w/o deleting existing.

Example:

```json

{
    "list": [
        "__APPEND__",
        "COD"
    ]
}
```
