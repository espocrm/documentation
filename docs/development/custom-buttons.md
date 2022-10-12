# Custom buttons & dropdown actions for detail, list, edit views

## In top-right corner

How to add buttons (or dropdown actions) that will appear in the top-right corner.

An example for the detail view of a *Lead* entity type.

### Definition

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

The `acl` parameter defines that a user needs an 'edit' access level to see the button. You can omit this parameter.

In order to add dropdown action, you need to use the `dropdown` key instead of *buttons*.

Avaible `style` values:

* default
* success
* danger
* warning

In the parameter `accessDataList` it's possible to define rules that determine whether an action item is visible to a user. See the `module:utils~AccessDefs` JSDoc type in the [source file](https://github.com/espocrm/espocrm/blob/master/client/src/utils.js).

The parameter `labelTranslation` defines a label translation path. Useful if you don't want to incorporate a new label but use an existing one. Example: `Global.scopeNamesPlural.Opportunity`. 

Menu items defined in the `Global.json` file will be applied for all entity types.

Available views (object keys in definitions):

* detail
* edit
* list

### Handler class

Create a file `client/custom/src/my-action-handler.js`:

```js
define('custom:my-action-handler', ['action-handler'], function (Dep) {

   return Dep.extend({

        actionSomeName: function (data, e) {
            Espo.Ajax
                .getRequest('Lead/' + this.view.model.id)
                .then(response => {
                    console.log(response);
                });
        },

        initSomeName: function () {
            this.controlButtonVisibility();
            
            this.view.listenTo(
                this.view.model,
                'change:status',
                this.controlButtonVisibility.bind(this)
            );
        },

        controlButtonVisibility: function () {
            if (~['Converted', 'Dead', 'Recycled'].indexOf(this.view.model.get('status'))) {
                this.view.hideHeaderActionItem('someName');
                
                return;
            }

            this.view.showHeaderActionItem('someName');
        },
   });
});
```

## Dropdown action in detail view

An action item next to the edit button.

An example for a *Lead* entity type.

### Definition

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

The parameter *acl* set to *edit* means that a user need an *edit* access level to see the action. You can omit it.

As of v7.2 it's possible to define a `checkVisibilityFunction` parameter. The values should be a handler method name that. The method determines whether the action is visible. It will be called every time the record is synced with the backend and hide or show the action depending on a value returned by the method. The `initFunction` is not needed in this case. 

### Handler class

Create a file `client/custom/src/my-action-handler.js`:

```js
define('custom:my-action-handler', ['action-handler'], function (Dep) {

   return Dep.extend({

        actionTest: function (data, e) {
            Espo.Ajax
                .getRequest('Lead/' + this.view.model.id)
                .then(response => {
                    console.log(response);
                });
        },

        initTest: function () {
            this.controlActionVisibility();
            
            this.view.listenTo(
                this.view.model,
                'change:status',
                this.controlActionVisibility.bind(this)
            );
        },

        controlActionVisibility: function () {
            if (~['Converted', 'Dead', 'Recycled'].indexOf(this.view.model.get('status'))) {
                this.view.hideActionItem('test');
                
                return;
            }

            this.view.showActionItem('test');
        },
   });
});
```

## Dropdown action in detail modal view

Available as of v7.2.

Everything is the same as for the detail view. The only difference is that the metadata parameter name is `modalDetailActionList`.

## Mass action in list view

An action will available in the *Actions* dropdown when you select records on the list view.

Available as of v7.0.

An example for *Meeting* entity type.

Create a file (if it doesn't exist) `custom/Espo/Custom/Resources/metadata/clientDefs/Meeting.json`:

```json
{
    "massActionList": [
        "__APPEND__",
        "test"
    ],
    "checkAllResultMassActionList": [
        "__APPEND__",
        "test"
    ],
    "massActionDefs": {
        "test": {
            "handler": "custom:test-handler",
            "initFunction": "initTest"
        }
    }
}
```

Create a handler `client/custom/src/test-handler.js`:

```js
define('custom:test-handler', [], function () {

    var TestHandler = function (view) {
        this.view = view;
    };

    _.extend(TestHandler.prototype, {

        initTest: function () {
            // called when the list view is loaded

            // here you can remove the action on a specific condition
            // this.view.removeMassAction('test');
            
            // var acl = this.view.getAcl();
            // var currentUser = this.view.getUser();
        },

        actionTest: function (data) {           
            console.log(data); // data to be sent to the back-end
            
            // here you can show a modal or send ajax request
            // this.view.createView( ... )
            // Espo.Ajax.postRequest( ...)
        },

    });

    return TestHandler;
});

```

Create a language file `custom/Espo/Custom/Resources/i18n/en_US/Meeting.json`:

```json
{
    "massActions": {
        "test": "Test"
    }
}
```

Clear cache.

You can use *Mass Action* framework to handle mass actions in the back-end. Available since v6.2.0. Send a POST request to `MassAction` URL with data passed into the action method.

