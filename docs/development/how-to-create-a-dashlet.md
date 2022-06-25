# How to create a dashlet

Create a file `custom/Espo/Custom/Resources/metadata/dashlets/{DASHLET_NAME}.json` with your dashlet configuration.

Here you need to define `"view"`, and you can set 'aclScope', and 'options'.

If it's typical list dashlet, use `"view":"views/dashlets/abstract/record-list"`, if not, create own [view](custom-views.md).

## Options

By default in dashlet options you can set _Title_ and _Auto-refresh Interval_.

Additional option fields you can set in `"options"` > `"fields"`.

Also you can define other options, if your view needs more data. You will be able to access options data from a view with the method `getOption('optionName')`.

## Example

Create a file `custom/Espo/Custom/Resources/metadata/dashlets/MyDashlet.json`:

```
{
    "view": "custom:views/dashlets/my-dashlet",
    "aclScope": "Account",
    "options": {
        "fields": {
            "title": {
                "type": "varchar",
                "required": true
            },
            "autorefreshInterval": {
                "type": "enumFloat",
                "options": [0, 0.5, 1, 2, 5, 10]
            }
        },
        "layout": [
            {
                "rows": [
                    [
                        {"name": "title"},
                        {"name": "autorefreshInterval"}
                    ]
                ]
            }
        ]
    }
}
```
aclScope set to Account means that only users who have access to Account scope will be able to add this dashlet.


There you can find how default dashlets defined: `application/Espo/Modules/Crm/Resources/metadata/dashlets`.

Create a view file `client/custom/src/views/dashlets/my-dashlet.js`:

```js
define('custom:views/dashlets/my-dashlet', ['views/dashlets/abstract/base'],  function (Dep) {
    return Dep.extend({
        name: 'MyDashlet',
        template: 'custom:dashlets/my-dashlet',
    })
});
```

Create a template file `client/custom/res/templates/dashlets/my-dashlet.tpl`
```
   <iframe src=""></iframe>
```

## Translation

Translation to dashlet is in `Global` scope, in `"dashlets"` section.

__After that don't forget to Clear Cache in Administration.__
