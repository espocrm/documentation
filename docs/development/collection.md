# Collection

A collection is a list of models. See the [class](https://github.com/espocrm/espocrm/blob/stable/client/src/collection.js).

## Methods

### fetch

Fetches a collection (from the back-end). Returns a promise.

```js

collection.fetch();

collection.fetch({
    remove: false,
    more: true,
});
```

Options:

* remove – false will prevent removing current models;
* more – load next portion of records (show-more).

You can pass custom options and check them in 'change' event listenters.

### clone

Clone a collection. Models are kept identical. Returns a collection instance.

### get

Get a model from a collection by an id.

```js
let model = collection.get(id);
```

### at

Get a model by its position in a collection.

```js
let model = collection.at(index);
```

### forEach

Iterates through a collection.

```js
collection.forEach(model => {});
```

### add

Add a model or multiple models to a collection. Firing an 'add' event for each model, and an 'update' event afterwards.

```js
collection.add(model);
collection.add([model]);
```

### remove

Remove a model from a collection. Fires a 'remove' event for a model, and an 'update' event afterwards.

```js
collection.remove(id);
collection.remove(model, {
    silent: true, // Suppresses events.
});
```

### reset

Empties a collection.

### push

Add a model to the end.

### pop

Remove and return the last model.

### unshift

Add a model at the beginning.

### shift

Remove and return the first model.

### resetOrderToDefault

Resets order parameters to default.

### setOrder

Sets order parameters.

```
@param {string|null} orderBy
@param {boolean|'asc'|'desc'|null} [order]
@param {boolean} [setDefault]
```

### abortLastFetch

Abort the last fetch.

### hasMore

Whether more records can be fetched.

### setOffset

Set an offset.

```js
collection.setOffset(offset);
```

### getWhere

Get a where-clause.

## Properties

### entityType

*string*

An entity type.

### length

*number*

A current length of a collection.

### total

*number*

A total number of records in the backend.

### offset

*number*

A current offset (for pagination).

### maxSize

*number*

A max size to fetch (for pagination).

### where

*Object*

A where clause.

## Instantiating

With a factory:

```js
define('custom:views/some-custom-view', ['view'], function (Dep) {

    return Dep.extend({

        setup: function () {
            let entityType = 'Account';

            this.wait(
                this.getCollectionFactory().create(entityType)
                    .then(collection => {
                        this.collection = collection;

                        return collection.fetch();
                    })
                    .then(() => {

                    })
            );
        },
    });
});
```

Without factory:

```js
define('custom:views/some-custom-view', ['view', 'collection'], function (Dep, Collection) {

    return Dep.extend({

        setup: function () {
            let collection = new Collection;

            collection.url = 'MyEntityType/someEndPoint'; // URL will be used when fetching

            this.wait(
                collection.fetch()
            );
        },
    });
});
```

## Events

Note: `listenTo` and `listenToOnce` are methods of the *view* class.

### sync

Once a collection is fetched.

```js
this.listenTo(collection, 'sync', (collection, response, options) => {});
```

### update

Once a collection is updated.
