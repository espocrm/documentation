# Dynamic Handler (complex dynamic forms)

Dynamic Handler provides the ability to manipulate the form (detail/edit views) appearance.

Note, that you can make forms dynamic with [Dynamic Logic](../administration/dynamic-logic.md) feature. Dynamic Handler is intended for more complex tasks where Dynamic Logic can be useless.

An example for Account entity type.

Create a file `custom/Espo/Custom/Resources/metadata/clientDefs/Account.json`:

```json
{
    "dynamicHandler": "custom:account-dynamic-handler"
}
```

Create a file `client/custom/src/account-dynamic-handler.js`:

```js

define('custom:account-dynamic-handler', ['dynamic-handler'], function (Dep) {

    return Dep.extend({

        // called on initialization
        init: function () {
            this.controlFields();

            // invoke controlFields method every time assignedUserId gets changed
            this.recordView.listenTo(
                this.model,
                'change:assignedUserId',
                () => this.controlFields()
            );
        },

        controlFields: function (model, value, options) {
            // options.ui will be set to true if the change was initiated by a user interaction
        
            // if assigned user is not empty
            if (this.model.get('assignedUserId')) {
                
                this.recordView.showField('sicCode');

                this.recordView.setFieldRequired('type');
                this.recordView.setFieldReadOnly('teams');

                // set options for enum/array/multi-enum/checklist fields
                this.recordView.setFieldOptionList('type', [
                    'Test',
                    'Hello',
                ]);

                this.recordView.showPanel('activities');
                
                return;
            }

            this.recordView.hideField('sicCode');

            this.recordView.setFieldNotRequired('type');
            this.recordView.setFieldNotReadOnly('teams');
            this.recordView.setFieldOptionList('type', [
                'Test',
            ]);

            this.recordView.hidePanel('activities');
        },
    });
});

```

Clear cache after all.


## Multiple dynamic handlers

As of v5.8 it's possible to add multiple dynamic handlers to for one entity type. This allows different extensions to have their own dynamic handler.

In metadata > YourEntityType > clientDefs:

```json
{
    "dynamicHandlerList": [
        "__APPEND__",
        "custom:my-dynamic-handler"
    ]
}
```

## See also

* [Example for multi-enum fields](examples/dynamic-logic-multi-enum.md)
