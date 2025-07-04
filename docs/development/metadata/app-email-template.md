# metadata > app > emailTemplate

Email template definitions.

## placeholders

Placeholders.

Example:

```json

{
    "placeholders": {
        "today": {
            "className": "Espo\\Tools\\EmailTemplate\\Placeholders\\Today",
            "order": 0
        },
        "now": {
            "className": "Espo\\Tools\\EmailTemplate\\Placeholders\\Now",
            "order": 1
        },
        "currentYear": {
            "className": "Espo\\Tools\\EmailTemplate\\Placeholders\\CurrentYear",
            "order": 2
        }
    }
}
```

### className

*class-string<\Espo\Tools\EmailTemplate\Placeholder\>*

An implementation.

### order

*integer*

An order position.

## entityLinkMapping

*object.<string, object.<string, string\>\>*

*As of v9.2.*

Mappings of entity types to links. Used for placholders.

Example:

```json
{
    "entityLinkMapping": {
        "Opportunity": {
            "Account": "account"
        }
    }
}
```

If an Opportunity record is selected as an email parent, *{Account.\*}* placeholders will be substituted with the Account related to the Opportunity through the *account* link.
