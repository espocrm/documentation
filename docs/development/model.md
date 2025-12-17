# Model

A model instance usually represents a single entity record. See the [class](https://github.com/espocrm/espocrm/blob/stable/client/src/model.js).

## Methods

### set

Sets an attribute or multiple attributes.

```js
model.set('attributeName', value);

model.setMultiple({
    attributeName1: value1,
    attributeName2: value2,
});

// Options.
model.setMultiple(attributes, {
    // suppresses 'change' events
    'silent': true, 
});
```

You can pass custom options and check them in 'change' event listeners.

### get

Gets an attribute.

```js
const value = model.get('attributeName');
// or model.attributes.attributeName;

// all attributes
const attributes = Espo.Utils.cloneDeep(model.attributes);
```

### save

Saves a model (to the back-end).

```js
// Assuming model.id is set.
try {
    await model.save()
} catch() {
    // Error occurred.
    return;
}
```

### fetch

Fetches a model (from the backend). Loads attribute values to the model. Returns a promise.

```js
// Assuming model.id is set.
async model.fetch();
```

### getClonedAttributes

Get cloned attributes. Returns an object.

```js
const attributes = model.getClonedAttributes();
```

### populateDefaults

Populate default values.

```js
model.populateDefaults();
```

### setDefs

Sets field and link defs. May be needed if a model instantiated explicitly, not by the factory.

```js
model.setDefs({
    fields: {},
    links: {},
});
```

## Properties

### id

*string*

A record ID.

### entityType

*string*

An entity type.

### urlRoot

*string*

A root API URL to use for syncing with the backend. For non-new records, an ID part will be appended.

### url

*string*

An API URL to use for syncing with the backend. If specified, urlRoot will be omitted.

### attributes

*Record*

Attribute values.

```js
const name = model.attributes.name;
```

## Instantiating

Model-factory is available in views. The model-factory allows to create a model instance of a specific entity type.

```js
export default class extends View {

    setup() {            
        // Use wait to hold off rendering until model is loaded.     
        this.wait(this.loadModel());
    }

    async loadModel() {
        this.model = await this.getModelFactory().create('Account');

        // entityType is set by the factory.
        //const entityType = this.model.entityType;

        this.model.id = this.options.id;

        await model.fetch(); 
    }
}
```

Instantiating w/o factory:

```js
import View from 'view';
import Model from 'model';

export default class extends View {

    setup() {
        const model = new Model();

        // URL will be used when fetching and saving.
        model.urlRoot = 'MyModel'; 
        model.id = 'someId';
        
        this.wait(
            // This performs `GET MyModel/someId` API call.
            model.fetch(); 
        );
    }
}
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

    // The 'action' option indicates how the change originated.
    // Possible values: fetch, save, ui, cancel-edit.
    console.log(options.action);

    // If you want to change the same model within this handler,
    // use setTimeout with a zero delay to avoid a potential loop.
});

this.listenToOnce(model, 'change:someAttribute', (model, value, options) => {
    // someAttribute is changed
});
```

### sync

Model synced with backend.

```js
this.listenTo(model, 'sync', (model, response, options) => {
    // Synced with backend – fired after fetch or save.

    // The 'action' option indicates how the sync originated.
    // Possible values: fetch, save, destroy.
    console.log(options.action);
});
```

### destroy

Once model is removed (after *DELETE* request).

## Additional events

Defined in the application.

### after:relate

Once relationship panel updated. Available on the detail view.

### after:relate:{link}

Once a specific relationship panel updated. Available on the detail view.

### update-all

This event is not fired. But you can fire it to refresh all relationship panels. Available on the detail view.

### update-related:{link}

Fire this event to refresh a specific relationship panel. Available on the detail view.


## Other

Passing model to a child view:

```js
this.createView('someName', 'custom:views/some-view', {
    model: this.model,
});
```

Or:

```js
const view = new MyView({model});
```
