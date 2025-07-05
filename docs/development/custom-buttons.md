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
                    "label": "My Action",
                    "name": "myAction",
                    "style": "default",
                    "acl": "edit",
                    "aclScope": "Lead",
                    "handler": "custom:my-action-handler",
                    "initFunction": "initMyAction",
                    "actionFunction": "myAction",
                    "checkVisibilityFunction": "isMyActionVisible"
                }
            ]
        }
    }
}
```

Parameters:

* `name` – A name. Mandatory if a handler is used.
* `handler` – A handler.
* `initFunction` – A handler method to run on initialization. Omit if not needed. 
* `acl` – Defines what access level is required to see the button. You can omit this parameter.
* `aclScope` – What scope to check access to. If omitted, the current scope is used.
* `checkVisibilityFunction` – A handler method that will be used to determine whether an item is visible. The method should return a boolean value. As of v8.1.
* `actionFunction` – An action method in the handler. As of v8.1.

In order to add dropdown action, you need to use the `dropdown` key instead of *buttons*.

Available `style` values:

* default
* success
* danger
* warning

In the parameter `accessDataList`, it's possible to define rules that determine whether an action item is visible to a user. See the `module:utils~AccessDefs` JSDoc type in the [source file](https://github.com/espocrm/espocrm/blob/master/client/src/utils.js).

The parameter `labelTranslation` defines a label translation path. Useful if you don't want to incorporate a new label but use an existing one. Example: `Global.scopeNamesPlural.Opportunity`. 

Menu items defined in the `Global.json` file will be applied for all entity types.

Available views (object keys in definitions):

* detail
* edit
* list

### Handler class

Create a file `client/custom/src/my-action-handler.js`:

```js
define(['action-handler'], (Dep) => {

    return class extends Dep {

        initMyAction() {}

        async myAction() {
            this.view.disableMenuItem('myAction');

            let response;

            try {
                response = await Espo.Ajax.getRequest('Lead/' + this.view.model.id);
            } catch (e) {
                this.view.enableMenuItem('myAction');

                return;
            }

            console.log(response);

            this.view.enableMenuItem('myAction');
        }       

        isMyActionVisible() {
            return !['Converted', 'Dead', 'Recycled'].includes(this.view.model.attributes.status);
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
            "handler": "custom:my-action-handler",
            "initFunction": "initTest",
            "checkVisibilityFunction": "isTestVisible",
            "actionFunction": "test"
        }
    ]
}
```

Parameters:

* `name` ~ A name. Important if a handler is used.
* `handler` – A handler.
* `initFunction` – A handler method to run on initialization. Omit if not needed. 
* `acl` – Defines what access level is required to see the button. You can omit this parameter.
* `checkVisibilityFunction` – A handler method that will be used to determine whether an item is visible. The method should return a boolean value. As of v8.1.
* `actionFunction` – An action method in the handler. As of v8.1.

### Handler class

Create a file `client/custom/src/my-action-handler.js`:

```js
define(['action-handler'], (Dep) => {

   return class extends Dep {

        initTest() {}

        async test() {
            const response = await Espo.Ajax.getRequest('Lead/' + this.view.model.id);

            console.log(response);
        }       

        isTestVisible() {
            return !['Converted', 'Dead', 'Recycled'].includes(this.view.model.attributes.status);
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
            "initFunction": "initTest",
            "actionFunction": "test"
        }
    }
}
```

Create a handler `client/custom/src/test-handler.js`:

```js
define('custom:test-handler', [], () => {

    return class {

        constructor(view) {
            this.view = view;
        }

        initTest() {
            // called when the list view is loaded

            // here you can remove the action on a specific condition
            // this.view.removeMassAction('test');
            
            // const acl = this.view.getAcl();
            // const currentUser = this.view.getUser();
        }

        /**
         * @param {{entityType: string, action: string, params: Record}} data
         */
        test(data) {           
            // Here you can show a modal or send an ajax request.
            // this.view.createView( ... )
            // Espo.Ajax.postRequest( ...)
        }
    }
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

In Advanced Pack it's possible to create detail view buttons and dropdown items that run workflow actions. A button can be configured to be visible only if specific conditions are met.
