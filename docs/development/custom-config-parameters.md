# Custom config parameters

In this article it will be shown how to add custom config parameters and how to make them available on the administration panel.

### entityDefs > settings

Create a file `custom/Espo/Modules/MyModule/Resources/metadata/entityDefs/Settings.json`:

```json
{
    "fields": {
        "myParameter": {
            "type": "enum",
            "options": ["Option 1", "Option 2"]
        }
    }
}
```

### app > config

Create a file `custom/Espo/Modules/MyModule/Resources/metadata/app/config.json`:

```json
{
    "params": {
        "myParameter": {
            "level": "admin"
        }
    }
}
```

Setting the *level* parameter to `"admin"` make the parameter available only for admin users. Available values: `global`, `system`, `admin`, `superAdmin`.
