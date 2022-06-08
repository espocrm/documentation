# View


The View is the most oftenly used class in frontend. Every page is rendered by multiple view objects. Views can have child views. Child views can have their own child views. And so on. When a parent view is rendered (by calling the `render` method), it generates HTML from all children and adds it to the DOM.


A view file `client/custom/src/views/test/my-custom-view.js`:

```js
define('custom:views/test/my-custom-view', 'view', function (Dep) {

    return Dep.extend({

        // A template file, see its content.
        template: 'custom:test/my-custom-view',

        // Altertatively a template content can be defined right here.
        //templateContent: `<div class="some-test-container">{{{someKeyName}}}</div>`,

        // initializing logic
        setup: function () {
            // Calling the parent `setup` method, you can omit it.
            Dep.prototype.setup.call(this);
            
            this.someParam1 = 'test 1';

            // When we create a child view in the setup method, rendering of the view is held off
            // until the child view is loaded (ready).
            this.createView('someKeyName', 'custom:test/my-custom-child-view', {
                el: this.getSelector() + ' .some-test-container', // define a selector of the container element
                someParam: 'test', // pass some parameter
            });
            
            // The `createView` method returns a promise that resolves to a view object.
            
            // Options passed from the parent view.
            console.log(this.options); 
            
            // A model can be passed from the parent view.
            console.log(this.model);
            
            // All event listeners are recommended to be initialized in the `setup` method.

            // Use listenTo & listenToOnce methods for listening to events of another object
            // to prevent memory leakage.

            // Subscribe to model change.
            this.listenTo(this.model, 'change', () => {
                // Whether a specific attribute changed.
                if (this.model.hasChanged('someAttribute')) {
                    let value = this.model.get('someAttribute');
                }
            });
            
            // Subscribe to model sync (saved or fetched).
            this.listenTo(this.model, 'sync', () => {});
        },

        // Called after contents is added in DOM.
        afterRender: function () {
            // View container (DOM element).
            console.log(this.$el); 
            
            // Getting a child view.
            let childView = this.getView('someKeyName'); 
            
            // Destroying a child view, also removes it from DOM.
            this.clearView('someKeyName');
        },
        
        // Data to be passed to the template.
        data: function () {
            return {
                someParam2: 'test 2',
            };
        },
        
        // DOM event handlers.
        events: {
            'click a[data-action="test"]': function (e) {
                console.log(e.currentTarget);
                this.actionTest();
            },
        },
        
        // Called when the view is removed.
        // Useful for destroying some event listeners inialized for the view.
        onRemove: function () {},
        
        // A custom method.
        actionTest: function () {},
    });
});
```

Template file `client/custom/res/templates/test/my-custom-view.tpl`:

```html
<div class="some-test-container">{{{someKeyName}}}</div>

<p>{{viewObject.someParam1}}</p>
<p>{{someParam2}}</p>
<p>
    <a class="action" data-action="test">Test Action</a>
</p>
```

[Handlebars](https://handlebarsjs.com/) library is used for template rendering.

Note: When you extend a view that already has its *events* and you want to add more events, do it the following way:

```js
    events: _.extend({
        'click a[data-action="test"]': function () {
        
        },
    }, Dep.prototype.events),
```

## Waiting for some data loaded before rendering

Sometimes we need to get some data loaded asynchronously before the view is rendered. For this purpose we can use `wait` method inside `setup` method. 

Wait method can receive a promise:

```js
    setup: function () {
        this.wait(
            Promise.all([
                this.model.fetch(),
                this.model.collection.fetch(),
            ])
        );
    },
```

Model factory returns a promise.

```js
    setup: function () {
        this.wait(
            this.getModelFactory().create('Case')
                .then(model => {
                    model.id = this.model.id;

                    return model.fetch();
                })
                .then(data => {
                    console.log(data);
                })
        );
    },
```

Wait for model is fetched. Fetch returns a promise.

```js
    setup: function () {
        this.wait(
            this.model.fetch()
        );
    },

```

Wait for multiple independent promises:

```js
    setup: function () {
        this.wait(
            this.model.fetch()
        );
        
        this.wait(
            Espo.Ajax.getRequest('SomeUrl')
        );
    },

```

```js
    setup: function () {
        this.wait(
            Promise.all([
                this.model.fetch(),
                Espo.Ajax.getRequest('SomeUrl')
            ])
        );
    },
```

A simple way to wait:

```js
    setup: function () {
        // this holds off the rendering
        this.wait(true);

        Espo.Ajax.getRequest('Some/Request')
            .then(response => {
                // this cancels waiting and proceeds to rendering
                this.wait(false);                
            });
    },

```

## Events

```js
    setup: function () {
        // Use this way only when the view subscribes to self.
        this.on(eventName, callback); // subscribe to self
        this.once(eventName, callback); // subscribe once
        this.off(eventName, callback); // unsubscribe
        
        // Use this way to subscribe to another object. Prevents memory leaking.
        this.listenTo(object, eventName, callback); // subscribe to another object
        this.listenToOnce(object, eventName, callback); 
        this.stopListening(object, eventName); // unsubscribe
        
        // Triggering event.
        this.trigger(eventName);  
        this.trigger(eventName, objectWithEventData); // passing data        
    },
```

### Built-in events

* `after:render` – after the view is rendered;
* `remove` – when the view is removed (destroyed); use it for cleaning up.

