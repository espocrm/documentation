# Custom buttons & dropdown actions for detail, list, edit views

## In top-right corner

How to add buttons (or dropdown actions) that will appear in the top-right corner.

An example for the detail view of *Lead* entity type.

Create a file (if it doesn't exist) `custom/Espo/Custom/Resources/metadata/clientDefs/Lead.json`:

```json
{
    "menu": {
        "detail": {
            "buttons": [
                "__APPEND__",
                {
                    "label": "Some Label",
                    "name": "someName",
                    "action": "someName",
                    "style": "default",
                    "acl": "edit",
                    "aclScope": "Lead",
                    "data": {
                        "handler": "custom:my-action-handler"
                    },
                    "initFunction": "initSomeName"
                }
            ]
        }
    }
}
```

`acl` parameter defines that a user needs 'edit' access level to see the button. You can omit this parameter.

In order to add dropdown action, you need to use `dropdown` key instead of *buttons*.

Create a file `client/custom/src/my-action-handler.js`:

```js
define('custom:my-action-handler', ['action-handler'], function (Dep) {

   return Dep.extend({

        actionSomeName: function (data, e) {
            Espo.Ajax.getRequest('Lead/' + this.view.model.id).then(function (response) {
                console.log(response);
            });
        },

        initSomeName: function () {
            this.controlButtonVisibility();
            this.view.listenTo(
                this.view.model, 'change:status', this.controlButtonVisibility.bind(this)
            );
        },

        controlButtonVisibility: function () {
            if (~['Converted', 'Dead', 'Recycled'].indexOf(this.view.model.get('status'))) {
                this.view.hideHeaderActionItem('someName');
            } else {
                this.view.showHeaderActionItem('someName');
            }
        },
   });
});
```

## Dropdown action in detail view 

An action item next to the edit button.

Available since version 5.6.14.

An example for *Lead* entity type.

Create a file (if it doesn't exist) `custom/Espo/Custom/Resources/metadata/clientDefs/Lead.json`:

```json
{
    "detailActionList": [
        "__APPEND__",
        {
            "label": "Test Action",
            "name": "test",
            "acl": "edit",
            "data": {
                "handler": "custom:my-action-handler"
            },
            "initFunction": "initTest"
        }
    ]
}
```

Paremeter *acl* set to *edit* means that a user need *edit* access level to see the action. You can omit it.


Create a file `client/custom/src/my-action-handler.js`:

```js
define('custom:my-action-handler', ['action-handler'], function (Dep) {

   return Dep.extend({

        actionTest: function (data, e) {
            Espo.Ajax.getRequest('Lead/' + this.view.model.id).then(function (response) {
                console.log(response);
            });
        },

        initTest: function () {
            this.controlActionVisibility();
            this.view.listenTo(
                this.view.model, 'change:status', this.controlActionVisibility.bind(this)
            );
        },

        controlActionVisibility: function () {
            if (~['Converted', 'Dead', 'Recycled'].indexOf(this.view.model.get('status'))) {
                this.view.hideActionItem('test');
            } else {
                this.view.showActionItem('test');
            }
        },
   });
});
```
