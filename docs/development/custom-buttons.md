# Custom buttons & dropdown actions for detail, list, edit views

## In top-right corner

How to add buttons (or dropdown actions) that will appear in the top-right corner.

An example for the detail view of the *Lead* entity type.

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

Parameters:

* `acl` – Defines that a user needs the *edit* access level to see the button. You can omit this parameter.
* `checkVisibilityFunction` – A handler method that will be used to determine whether an item is visible. The method should return a boolean value. As of v8.1.
* `actionFunction` – An action method in the handler. As of v8.1.

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
define('custom:my-action-handler', ['action-handler'], (Dep) => {

    return class extends Dep {

        actionSomeName(data, e) {
            Espo.Ajax.getRequest('Lead/' + this.view.model.id)
                .then(response => {
                    console.log(response);
                });
        }

        initSomeName() {
            this.controlButtonVisibility();
            
            this.view.listenTo(this.view.model, 'change:status', () => this.controlButtonVisibility());
        }

        controlButtonVisibility() {
            if (['Converted', 'Dead', 'Recycled'].includes(this.view.model.get('status'))) {
                this.view.hideHeaderActionItem('someName');
                
                return;
            }

            this.view.showHeaderActionItem('someName');
        }
    }
});
```

## Dropdown action in detail view

An action item next to the edit button.

An example for the *Lead* entity type. Menu items defined in the `Global.json` file will be applied for all entity types.

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

As of v7.2 it's possible to define a `checkVisibilityFunction` parameter. The values should be a handler method name that returns a boolean value. The method determines whether the action is visible. It will be called every time the record is synced with the backend and will hide or show the action depending on a value returned by the method. The `initFunction` is not needed in this case. 

### Handler class

Create a file `client/custom/src/my-action-handler.js`:

```js
define('custom:my-action-handler', ['action-handler'], (Dep) => {

   return class extends Dep {

        actionTest(data, e) {
            Espo.Ajax.getRequest('Lead/' + this.view.model.id)
                .then(response => {
                    console.log(response);
                });
        }

        initTest() {
            this.controlActionVisibility();
            
            this.view.listenTo(this.view.model, 'change:status', () => this.controlActionVisibility());
        }

        controlActionVisibility() {
            if (['Converted', 'Dead', 'Recycled'].includes(this.view.model.get('status'))) {
                this.view.hideActionItem('test');
                
                return;
            }

            this.view.showActionItem('test');
        }
    }
});
```

## Dropdown action in detail modal view

*As of v7.2.*

Everything is the same as for the detail view. The only difference is that the metadata parameter name is `modalDetailActionList`.

## Mass action in list view

An action will available in the *Actions* dropdown when you select records on the list view.

*As of v7.0.*

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

You can use *Mass Action* framework to handle mass actions in the back-end. Available as of v7.0. Send a POST request to the `MassAction` endpoint with data passed to the action method.

## See more

As of Advanced Pack v2.12 it's possible to create detail view buttons and dropdown items that run workflow actions. A button can be configured to be visible only if specific conditions are met.

