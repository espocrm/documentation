# Custom config parameters

In this article it will be shown how to add custom config parameters and how to make them available on the administration panel.

In the example it's supposed that your module is named `MyModule`. Replace `MyModule` and `my-module` with your real module name.

### 1. Metadata entityDefs > settings

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

### 2. Metadata app > config

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

The *level* parameter defines availability of the config parameter in the front-end.

* `default` –  available for logged-in users (applied by default);
* `global` – available even before logging in;
* `system` – never available;
* `internal` – never available for read, admin can write (useful for passwords, secrets; recommended to use the *password* field type) (as of v7.3);
* `admin` – available only for admin (read and write);
* `superAdmin` – available only for super-admin (read and write).

The *readOnly* [parameter](metadata/app-config.md#readonly) disables the ability to change a parameter value for admin users. 

### 3. Metadata app > adminPanel

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

### 4. Language files

Create a file `custom/Espo/Modules/MyModule/Resources/i18n/en_US/Admin.json`:

```json
{
    "keywords": {
        "myPanel": "some search keyword,another search keyword"
    },
    "descriptions": {
        "myPanel": "Description text for my panel."
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

### 5. View

Create a file `client/custom/modules/my-module/src/views/admin/my-settings.js`:

```js
define('my-module:views/admin/my-settings', ['views/settings/record/edit'], function (Dep) {

    return Dep.extend({

        detailLayout: [
            {
                rows: [
                    [
                        {
                            name: 'myParameter'
                        },
                        false
                    ]
                ]
            }
        ],

        // Dynamic logic can de defined.
        dynamicLogicDefs: {},

        setup: function () {
            Dep.prototype.setup.call(this);
            
            // Some custom logic can be written here.
        },
    });
});
```

### 6. Final step

Clear cache.

The parameter value now can be read in the back-end:

```php
<?php
/** @var \Espo\Core\Utils\Config $config */
$config->get('myParameter');
```
