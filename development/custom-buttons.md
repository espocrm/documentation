# Custom buttons and dropdown actions for detail, list, edit views

How to add buttons (or dropdown actions) that will appear in the top-left corner.

An example for the detail view of Lead entity type.

Create the file (if doesn't exist) `custom/Espo/Custom/Resources/metadata/clientDefs/Lead.json` with the following content:

```json
{
    "menu": {
        "detail": {
            "buttons": [
                "__APPEND__",
                {
                    "label": "Some Label",
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

In order to add dropdown action you need to use `dropdown` key instead of *buttons*.

Create the file `client/custom/src/my-action-handler.js` with the follwing content:

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
