# app > currency

Path: metadata > app > currency.

Currency definitions.

## symbolMap

*Object<string, string\>*

A currency-code => symbol mapping.

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

## precisionMap

*Object<string, number\>*

*As of v9.3.*


A currency-code => precision mapping. If not specified, 2 is used as a fallback value.

Example:

```json
{
    "precisionMap": {
        "BHD": 3
    }
}
```
