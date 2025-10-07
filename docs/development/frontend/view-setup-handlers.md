# View Setup Handlers

*As of v7.0*

ViewSetupHandlers framework provides the ability to customize existing views w/o extending. Multiple handlers can be attached to a view.

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

* list – main list view;
* detail – main detail view;
* edit – main edit view;
* record/list – list record view;
* record/search – search view;
* record/detail – detail record view;
* record/edit – detail record view;
* record/kanban – kanban record view;
* login – the login view; only in Global scope; as of v8.3.0;

!!! important

    The `__APPEND__` element is needed in the beginning of arrays to establish extending of existing items that can be defined by other modules.

Handler example:

```js

define('custom:some-handler', [], () => {

    class Handler {
        
        /**
         * @param {import('view').default} view
         */
        constructor(view) {
            this.view = view;
        }

        process() {
            this.listenTo(this.view, 'after:render', () => {
                // Do something with view after render.
            });

            this.view.listenTo(this.view.model, 'change', () => {});
        }
    }

    // Establish event support.
    Object.assign(Handler.prototype, Backbone.Events);

    return Handler;
});
```

The `process` method can return Promise. In this case the view will wait until the promise is resolved before proceeding to rendering.
