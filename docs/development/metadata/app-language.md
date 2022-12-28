# app > language

Path: metadata > app > language.

Application languages.

## list

*string*

A list of available languages available in the application. The name format: `en_US`.

## aclDependencies

*Object.<string, Object\>\>*

Rules making language translations available for a user when they don't have access to a scope.

Example:

```json
{
    "aclDependencies": {
        "Lead.options.source": {
            "scope": "Opportunity",
            "field": "leadSource"
        },
        "Account.options.industry": {
            "scope": "Lead",
            "field": "industry"
        },
        "Meeting": {
            "anyScopeList": ["Call"]
        }
    }
}
```

Keys are paths to translation data.

### scope

*string*

If a user have access to the scope, they will have access to translations defined by a key.

### field

*string*

If a user have access to the field (of a scope), they will have access to translations defined by a key.

### anyScopeList

*string[]*

If a user have access to any of listed scopes, they will have access to translations defined by a key.
