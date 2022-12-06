# View Setup Handlers

*As of v7.0*

ViewSetupHandlers framework provides the ability to customize existing views w/o extending. Multiple handlers can be attached to the view.

In clientDefs:

```json
{
    "viewSetupHandlers": {
        "list": [
            "__APPEND__",
            "custom:some-handler-1"
        ],
        "record/search": [
            "__APPEND__",
            "custom:some-handler-2"
        ]
    }
}
```

Can be defined:

* for a scope (clientDefs > {ScopeName})
* globally (clientDefs > Global)

Handlers are processed in the `setup` method of the view.

The following types are supported:

* list
* detail
* edit
* record/list
* record/search
* record/detail
* record/edit
* record/kanban

Important: The `*__APPEND__*` element is needed in the beginning of arrays to establish extending of existing items that can be defined by other modules.

Handler example:

```js

define('custom:some-handler', [], function () {

    let Handler = function (view) {
        this.view = view;
    };

    _.extend(Handler.prototype, {

        process: function () {
            // Do something with view.

            this.listenTo(this.view, 'after:render', () => {
                // Do something with view after render.
            });
        },
    });

    _.extend(Handler.prototype, Backbone.Events);

    return Handler;
});
```

The `process` method can return Promise. In this case the view will wait until the promise is resolved before proceeding to rendering.
