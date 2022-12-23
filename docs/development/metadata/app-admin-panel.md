# app > adminPanel

Path: metadata > app > adminPanel.

Defines what to display on the Administration page.

```json
{
    "panelName": {
        "label": "Some Panel Label",
        "itemList": [
            {
                "url": "#SomeUrl",
                "label": "Some Item Label",
                "iconClass": "fas fa-cogs",
                "description":"descriptionLanguageKey"
            },
            {
                "url": "#Admin/mySettingsPage",
                "label": "My Settings",
                "iconClass": "fas fa-cogs",
                "description":"mySettings",
                "recordView": "custom:views/admin/my-settings"
            }
        ],
        "order": 20
    }
}

```

## label

*string*

A panel label. A translation path: Admin > labels > {label}.

## order

*string*

Used for ordering panels on the page.

## itemList

*Object[]*

### url

*string*

A link URL.

### label

*string*

An item (link) label. A translation path: Admin > labels > {label}. You can use an URL like `#Admin/{myName}`, in this case you also need to define the *recordView*.

### iconClass

*string*

A CSS class for the icon.

### description

*string*

A translation key for a description text. A translation page: Admin > descriptions > {description}.

### recordView

*string*

A record view. Optional. Needed if you defined the URL like `#Admin/{myName}`. The record view displays settings fields. See [more](../custom-config-parameters.md).
