# View

The View is the most oftenly used class in the frontend. Every page is rendered by multiple view objects. Views can have child views. Child views can have their own child views and so on. When a parent view is rendered (by calling the `render` method), it generates a single HTML and adds it to the DOM. That HTML contains HTML of all child views. Any view can be re-rendered later.

A view file `client/custom/src/views/test/my-custom-view.js`:

```js
// AMD module definition (ES modules are supported in ext-template). The first argument can be omitted.
// Names should be in a lower case. A hyphen to be used for word separation.
// The `custom:` prefix indicates to the loader that the base path is `client/custom/src`.
// A `my-module:` prefix would correspond to `client/custom/modules/my-module/src`.
define('custom:views/test/my-custom-view', ['view'], (View) => {

    // Extending from the base `view` class.
    return class extends View {

        // Optionally, define an extended constructor.
        constructor(options) {
            super.constructor(options);
        }

        // A template path, see its content.
        // The `custom` prefix indicates that the base path is `client/custom/res/templates`.
        // See the separate article about templates.
        template = 'custom:test/my-custom-view'

        // Alternatively a template content can be defined right here.
        // Use // language=Handlebars to highlight syntax in JetBrains IDEs.
        // templateContent = `<div class="some-test-container">{{{someKeyName}}}</div>`

        // Initializing. Called on view creation, the view is not yet rendered.
        setup() {
            // Calling the parent `setup` method, can be omitted.
            super.setup();
            
            // Instantiate some property.
            this.someParam1 = 'test 1';

            this.addHandler('focus', '.record input[data-name="hello"]', (event, target) => {
                // Do something.
            });

            // When we create a child view in the setup method, rendering of the view is held off
            // until the child view is loaded (ready), the child view will be rendered along with the parent view.
            // The first argument is a key name that can be used to access the view further.
            // The second argument is a view name.
            // The method returns a promise that resolves to a view object.
            this.createView('someKeyName', 'custom:test/my-custom-child-view', {
                // A relative selector of the DOM container.
                selector: '.some-test-container',
                // Or a full selector.
                //fullSelector: '#some-id',
                // Pass some parameter.
                someParam: 'test',
            }); 
            
            // Options passed from the parent view.
            console.log(this.options); 
            
            // A model can be passed from the parent view.
            console.log(this.model);
            
            // All event listeners are recommended to be initialized in the `setup` method.

            // Use listenTo & listenToOnce methods for listening to events of another object
            // to prevent memory leakage.

            // Subscribe to model change.
            // Subscribing with the `listenTo` method guarantees automatic unsubscribing on view removal,
            // so there won't be a memory leak.
            this.listenTo(this.model, 'change', () => {
                // Whether a specific attribute changed.
                if (this.model.hasChanged('someAttribute')) {
                    const value = this.model.get('someAttribute');
                }
            });
            
            // Subscribe to model sync (saved or fetched). Fired only once.
            this.listenToOnce(this.model, 'sync', () => {});
            
            // Subscribe to a DOM event. `cid` contains an ID unique among all views.
            // Requires explicit unsubscribing on view removal.
            $(window).on('some-event.' + this.cid, () => {});

            // Translating a label.
            const translatedLabel = this.translate('myLabel', 'someCategory', 'MyScope');
        }

        // Called after contents is added to the DOM.
        afterRender() {            
            // The view container (DOM element).
            console.log(this.element); 
            
            // Accessing a child view.
            const childView = this.getView('someKeyName');
            
            // Checking whether a view is set.
            const hasSomeView = this.hasView('someKeyName');
            
            // Destroying a child view, also removes it from DOM.
            this.clearView('someKeyName');
            
            // Initializing a reference to some DOM element.
            this.$someElement = this.$el.find('.some-element');
        }
        
        // Data to be passed to the template.
        data() {
            return {
                someParam2: 'test 2',
            };
        }
        
        // Called when the view is removed.
        // Useful for destroying event listeners initialized for the view.
        onRemove() {
            $(window).off('some-event.' + this.cid);
        }
        
        // A custom method.
        someMethod1(value) {
            // Create and render a child view.
            this.createView('testKey', 'custom:test/my-another-custom-child-view', {
                el: this.getSelector() + ' .another-test-container', 
                value: value,
            })
            .then(view => view.render());
        }
        
        someMethod2() {
            // To proceed only when the view is rendered.
            // Useful when the method can be invoked by the caller before the view is rendered.
            this.whenRendered().then(() => {
                // Do something with DOM.
            });
        }
    }
}
```

Template file `client/custom/res/templates/test/my-custom-view.tpl`:

```html
<div class="some-test-container">{{{someKeyName}}}</div>

<p>{{viewObject.someParam1}}</p>
<p>{{someParam2}}</p>
<p>
    <a class="action" data-action="test">Test Action</a>
</p>

<div class="another-test-container"></div>
```

See more about [templates](frontend/templates.md).

Note: When you extend a view that already has its *events* and you want to add more events, do it the following way:

```js    
    setup() {
        super.setup();
        
        this.events['click a[data-action="test"]'] = (e) => {
        
        };
    }
```

See [the source file](https://github.com/yurikuzn/bull/blob/master/src/bull.view.js) of the view class.

## Waiting for some data loaded before rendering

Sometimes we need to get some data loaded asynchronously before the view is rendered. For this purpose we can use the `wait` method inside the `setup` method. 

The `wait` method can receive a promise:

```js
    setup() {
        this.wait(
            Promise.all([
                this.model.fetch(),
                this.model.collection.fetch(),
            ])
        );
    }
```

The model factory returns a promise, so we can pass it to the `view` method:

```js
    setup() {
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
    }
```

Wait until a model is fetched. The `fetch` method returns a promise.

```js
    setup() {
        this.wait(
            this.model.fetch()
        );
    }
```

Wait for multiple independent promises:

```js
    setup() {
        this.wait(
            this.model.fetch()
        );
        
        this.wait(
            Espo.Ajax.getRequest('SomeUrl')
        );
    }
```

```js
    setup() {
        this.wait(
            Promise.all([
                this.model.fetch(),
                Espo.Ajax.getRequest('SomeUrl'),
            ])
        );
    }
```

A simple way to wait:

```js
    setup() {
        // This holds off the rendering.
        this.wait(true);

        Espo.Ajax.getRequest('Some/Request')
            .then(response => {
                // This cancels waiting and proceeds to rendering.
                this.wait(false);                
            });
    }

```

### setup

Called internally on initialization. Put initialization logic here. Options passed by the parent view are available in `this.options`.

### afterRender

Called internally after render. Put manipulation with DOM here.

### onRemove

Called internally on view removal. Reasonable for unsubscribing.

### createView

Creates a child view. When we create a child view in the setup method, rendering of the view is held off until the child view is loaded (ready), the child view will be rendered along with the parent view. The first argument is a key name that can be used to access the view further (with `getView` method). The second argument is a view name. The method returns a promise that resolves to a view object.

Arguments:

* *viewKey* – a view key;
* *viewName* – a view name (path);
* *options* – options.

Standard options (all are optional):

* *selector* – a relative CSS to the view selector (as of v7.3);
* *model* – a model;
* *collection* – a collection.

It's important that every view have their actual selector so that the application knows how to access them (for re-rendering).

### clearView

Removes a child view.

Arguments:

* *viewKey* – a view key.

### getView

Get a child view by a key.

Arguments:

* *viewKey* – a view key.

### assignView

*As of v7.5.*

Assign a view instance as a child view.

Arguments:

* *viewKey* – a view key;
* *view* – a view instance;
* *selector* – a relative CSS selector.

```js
this.assignView('someKey', new SomeView(options), 'some-selector');
```

### reRender

Re-renders a view. Usually, called from inside the view. Returns a promise resolved once rendering is finished.

Arguments:

* *force* – *boolean* – force rendering if the view was not rendered before.

### render

Render a view. Should be called if the view is called not in the *setup* method (after the view is already ready or rendered). Returns a promise resolved once rendering is finished.

### whenRendered

Returns the promise resolving when the view is rendered.

```js
this.whenRendered().then(() => doSomethingWithDom());
```

### data

Method should is called internally when rendering. Should return a key => value data (*Object.<string, mixed>*) that will be passed to a template.


```js
templateContent = `
    <div data-name="someName">{{{someKeyName}}}</div>
`

setup() {
    this.createView('someKeyName', 'custom:test/my-custom-child-view', {}); 
}

actionShowModal() {
    this.createView('dialog', 'custom:test/my-modal-view', {selector: '> [data-name="someName]'})
        .then(view => {
            view.render();
            
            this.listenToOnce(view, 'some-event', eventData => {
                console.log(eventData);
                
                this.clearView('dialog');
            });
        });
}
```

### addHandler

*As of v8.0.*

Adds a DOM event handler.

```js
this.addHandler('click', 'selector', 'methodName');
this.addHandler('mousedown', 'selector', (event, target) => { ... });
```

## Events

```js
    setup() {
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
    }
```

Multiple events can be specified separated by a whitespace.

### Built-in events

* `after:render` – after the view is rendered;
* `remove` – when the view is removed (destroyed); use it for cleaning up.

  

