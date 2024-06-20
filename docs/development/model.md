# Model

A model instance usually represents a single entity record. See the [class](https://github.com/espocrm/espocrm/blob/stable/client/src/model.js).

## Methods

### set

Sets an attribute or multiple attributes.

```js
model.set('attributeName', value);

model.set({
    attributeName1: value1,
    attributeName2: value2,
});

// Options.
model.set(attributes, {
    'silent': true, // suppresses 'change' events
});
```

You can pass custom options and check them in 'change' event listeners.

### get

Gets an attribute.

```js
const value = model.get('attributeName');

// all attributes
const attributes = Espo.Utils.cloneDeep(model.attributes);
```

### save

Saves a model (to the back-end).

```js
// Assuming model.id is set.
model.save()
    .then(() => {
        // callback on success
    })
    .catch(() => {
        // callback on fail
    });
```

### fetch

Fetches a model (from the backend). Loads attribute values to the model. Returns a promise.

```js
// assuming model.id is set
model.fetch()
    .then(() => {
    });
```

### getClonedAttributes

Get cloned attributes. Returns an object.

```js
const attributes = model.getClonedAttributes();
```

### populateDefaults

Populate default values.

### setDefs

Sets field and link defs. May be needed if a model instantiated explicitly, not by the factory.

```js
model.setDefs({
    fields: {},
    links: {},
};
```

## Properties

### id

*string*

A record ID.

### name

*string*

A name. Usually, it is an entity type.

### urlRoot

*string*

A root API URL.

## Instantiating

Model-factory is available in views. The model-factory allows to create a model instance of a specific entity type.

```js
define('custom:views/some-custom-view', ['view'], function (Dep) {

    return Dep.extend({
    
        setup: function () {
            const entityType = 'Account';
            
            // use wait to hold off rendering until model is loaded            
            this.wait(
                this.getModelFactory().create(entityType)
                    .then(model => {
                        const entityType = model.entityType; // entityType property is set by the factory

                        this.model = model;                    
                        model.id = this.options.id;

                        return model.fetch(); // this will make API call using an appropriate URL
                    })
                    .then(() => {
                        // here you can do some stuff with model
                    })
            );
        },
    });
});
```

Instantiating w/o factory:

```js
define('custom:views/some-custom-view', ['view', 'model'], function (Dep, Model) {

    return Dep.extend({
    
        setup: function () {
            const model = new Model;
            
            model.urlRoot = 'MyModel'; // URL will be used when fetching and saving
            model.id = 'someId';
            
            this.wait(
                model.fetch(); // this makes a `GET MyModel/someId` API call
            );
        },
    });
});
```

## Events

Note: `listenTo` and `listenToOnce` are methods of the *view* class.

### change

When model attributes get changed (not necessarily synced with backend).

```js
this.listenTo(model, 'change', (model, options) => {
    if (this.model.hasChanged('someAttribute')) {
        // someAttribute is changed
    }
    
    if (options.ui) {
        // changed via UI
        // this options is set by field view
    }
});

this.listenToOnce(model, 'change:someAttribute', (model, value, options) => {
    // someAttribute is changed
});
```

### sync

Model synced with backend.

```js
this.listenTo(model, 'sync', (model, response, options) => {
    // synced with backend (fired after fetch or save)
});
```

### destroy

Once model is removed (after *DELETE* request).

## Additional events

Defined in the application.

### after:relate

Once relationship panel updated. Available on detail/edit views.

### update-all

This event is not fired. But you can fire it to update all relationship panels. Available on detail/edit views.

## Other

Passing model to a child view:

```js
this.createView('someName', 'custom:views/some-view', {
    model: this.model,
});
```
