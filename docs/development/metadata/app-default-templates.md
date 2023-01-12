# app > defaultTemplates

Path: metadata > app > defaultTemplates

Default templates (for PDF printing) for entity types. Pre-inserted when creating a new template.

Example:

```json
{
    "MyEntityType": {
        "body": "Some contents.",
        "header": null,
        "footer": "{pageNumber}"
    }
}
```
