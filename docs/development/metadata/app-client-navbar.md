# app > clientNavbar

*As of v8.1.*

Navbar definitions.

Example:

```json
{
    "itemDefs": {
        "quickCreate": {
            "view": "views/site/navbar/quick-create",
            "class": "dropdown hidden-xs quick-create-container"
        }
    },
    "itemList": [
        "quickCreate"
    ]
}
```

## itemDefs

*Object*

Definitions.

### view

*string*

A frontend view. By setting to *null*, it's possible to disable a specific item.

### class

*string*

A CSS class or multiple classes for the LI tag.

## itemList

*string[]*

An actual item list. Use `"__APPEND__"` for extending.
