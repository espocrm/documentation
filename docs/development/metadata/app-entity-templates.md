# app > entityTemplates

Path: metadata > app > entityTemplates

*As of v8.0.*

Definitions for entity type templates.

Example:

```json
{
    "BasePlus": {
        "entityClassName": "Espo\\Core\\Templates\\Entities\\BasePlus",
        "repositoryClassName": "Espo\\Core\\Templates\\Repositories\\BasePlus"
    }
}
```

## entityClassName

*class-string<Espo\\ORM\\Entity\>*

An entity class to use for a template.

## repositoryClassName

*class-string<Espo\\ORM\\Repository\\Repository\>*

A repository class to use for a template.
