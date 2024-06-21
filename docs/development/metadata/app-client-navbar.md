# app > clientNavbar

*As of v8.1.*

Navbar definitions.

## items

*Object*

Navbar items (in the top right corner).

Example:

```json
{
    "items": {
        "quickCreate": {
            "view": "views/site/navbar/quick-create",
            "class": "dropdown hidden-xs quick-create-container",
            "order": 0,
            "disabled": false
        }
    }
}
```

### view

*string*

A frontend view.

### class

*string*

A CSS class or multiple classes for the LI tag.

### order

*integer*

An order position.

### disabled

*bool*

Whether is disabled.

## menuItems

*Object*

*As of v8.4.*

Menut items (in the top right corner).

Example:

```json
{
    "menuItems": {
        "myItem": {
            "order": 0,
            "groupIndex": 5,
            "link": "#MyItem",
            "labelTranslation": "Global.labels.My Item"
        }
    }
}
```

## labelTranslation

*string*

A label translation path.

## link

*string*

A link (href).

## order

*integer*

An order position.

## groupIndex

*integer*

A group index. Groups are separated by a divider.

## disabled

*boolean*

An item will be hidden.

## handler

*string*

A handler class.

## actionFunction

*string*

An action function in the handler.

## configCheck

*string*

A config path to check. Path items are separated by a dot. If a config value is not empty, then the action is allowed. The `!` prefix reverses the check.

## accessDataList

*Object[]*

Access rules. See definitions in JSON schema: metadata/clientDefs.json#/definitions/accessDataList.
