# View


View is the most oftenly used class in frontend. Every page is rendered by multiple view objects. Views can have child views. Child views can have their own child views. And so on. When a parent view is rendered (by calling render() method), it generates HTML from all children and adds it to DOM.


View file `client/custom/src/views/test/my-custom-view.js`:

```js
define('custom:views/test/my-custom-view', 'view', function (Dep) {

    return Dep.extend({

        // template file, contents is printed below
        template: 'custom:test/my-custom-view',

        // altertatively template can be defined right here
        //templateContent: '<div class="some-test-container">{{{someKeyName}}}</div>',

        // initializing logic
        setup: function () {
            // calling parent setup method, you can omit it
            Dep.prototype.setup.call(this);
            
            this.someParam1 = 'test 1';

            // when we create a child view in setup method, rendering of the view will be held off
            // until the child view is loaded (ready)
            this.createView('someKeyName', 'custom:test/my-custom-child-view', {
                el: this.getSelector() + ' .some-test-container',
                someParam: 'test',
            });
            
            console.log(this.options); // options passed from a parent view
            
            // all event listeners are recommended to be initialized here

            this.on('remove', function () {

            }, this);
            
            // use listenTo & listenToOnce methods fore listening to events of another object
            // to prevent memory leakage
            this.listenTo(this.model, 'change', function () {
            
            }, this);
        },

        // called after contents is added to DOM
        afterRender: function () {
            console.log(this.$el); // view container DOM element
            
            var childView = this.getView('someKeyName'); // get child view
            
            this.clearView('someKeyName'); // destroy child view, will also remove it from DOM
        },
        
        // data passed to template
        data: function () {
            return {
                someParam2: 'test 2',
            };
        },
        
        // DOM event handlers
        events: {
            'click a[data-action="test"]': function (e) {
                console.log(e.currentTarget);
                this.actionTest();
            },
        },
        
        // called when the view is removed
        // useful for destroying some event listeners inialized for the view
        onRemove: function () {
            
        },
        
        // custom method
        actionTest: function () {
        
        },
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
                this.model.collection.fetch()
            ])
        );
    },
````

Model factory returs a promise.

```js
    setup: function () {
        this.wait(
            this.getModelFactory().create('Case')
            .then(
                function (model) {
                    model.id = this.model.id
                    return model.fetch();
                }.bind(this)
            )
            .then(
                function (data) {
                    console.log(data);
                }
            )
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
        this.wait(true); // this holds off the rendering

        Espo.Ajax.getRequest('Some/Request').then(
            function (response) {
                this.wait(false); // this cancels waiting and proceeds to rendering
            }.bind(this)
        );
    },

```
