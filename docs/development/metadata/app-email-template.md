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
