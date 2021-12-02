# Custom config parameters

In this article it will be shown how to add custom config parameters and how to make them available on the administration panel.

### 1. entityDefs > settings

Create a file `custom/Espo/Modules/MyModule/Resources/metadata/entityDefs/Settings.json`:

```json
{
    "fields": {
        "myParameter": {
            "type": "enum",
            "options": ["Option 1", "Option 2"],
            "tooltip": true
        }
    }
}
```

### 2. app > config

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

### 3. app > adminPanel

Create a file `custom/Espo/Modules/MyModule/Resources/metadata/app/adminPanel.json`:

```json
{
    "myPanel": {
        "label": "My Panel",
        "itemList": [
            {
                "url": "#Admin/mySettings",
                "label": "My Settings",
                "iconClass": "fas fa-cog",
                "description": "myPanel",
                "recordView": "my-module:views/admin/my-settings"
            }
        ],
        "order": 101
    }
}
```

### 4. language files

Create a file `custom/Espo/Modules/MyModule/Resources/i18n/en_US/Admin.json`:

```json
{
    "keywords": {
        "myPanel": "some keyword,another keyword"
    },
    "descriptions": {
        "support": "Support Pack settings."
    },
    "labels": {
        "My Settings": "My Settings",
        "My Panel": "My Panel"
    }
}
```


Create a file `custom/Espo/Modules/MyModule/Resources/i18n/en_US/Settings.json`:

```json
{
    "fields": {
        "myParameter": "My Parameter"
    },
    "tooltips": {
        "myParameter": "My parameter tooltip text. Markdown supported."
    },
    "options": {
        "myParameter": {
            "Option 1": "Option 1",
            "Option 2": "Option 2"
        }
    }
}
```
