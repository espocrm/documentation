# Client controller & routing

## Routes

Client routes are defined in metadata > app > clientRoutes.

Example:

```json
{
    "MyEntityType/test/:id": {
        "params": {
            "controller": "custom:controllers/my-controller",
            "action": "test"
        },
        "order": 1
    },
    "MyEntityType/hello/:id": {
        "params": {
            "controller": "MyEntityType",
            "action": "hello"
        },
        "order": 2
    }
}
```

If a controller name starts with a capital letter, then the value is treated as a scope name — the class name will be determined by the *controller* parameter: metadata > clientDefs > {scope} > controller. 

## Custom route

Create a file `custom/Espo/Custom/Resources/metadata/app/clientRoutes.json`:

```json
{
    "Account/test/:id": {
        "params": {
            "controller": "custom:controllers/my-controller",
            "action": "test"
        },
        "order": 1
    }
}
```

Create a client controller `client/custom/src/controllers/my-controller`:

```js
define(['controller'], (Controller) => {

    return class extends Controller {

        actionTest(options) {
            console.log(options);
        }
    }
});
```

Clear cache.

If you open the URL `your-espo-url#Account/test/myId`  in the browser, it will execute the *actionTest* method. The *options* argument will be the object `{id: 'myId'}`.

## Custom controller

A scope controller.

Define a custom controller for the needed entity type (MyEntityType in our example).

Create a file `custom/Espo/Custom/Resources/metadata/clientDefs/MyEntityType.json`:

```json
{
    "controller": "custom:controllers/my-entity-type"
}
```

Create a file `client/custom/src/controllers/my-entity-type.js`:

```js
define(['controllers/record'], (RecordController) => {

    return class extends RecordController {

        actionHello(options) {
            console.log('action: hello');
            console.log(options);
        }

        actionTest(options) {
            if (!options.id) {
                throw new Espo.Exceptions.NotFound();
            }

            console.log('action: test');
            console.log(options);
        }
    }
});
```

Clear cache.

If you open in the browser URL `your-espo-url#MyEntityType/hello` it will execute *actionHello* method.

`#MyEntityType/hello` – *options* variable value is an empty object
`#MyEntityType/hello/p1=one&p2=two` – *options* variable value is an object `{p1: 'one', p2: 'two'}`

## Rendering view

In controller:
```js
    actionTest(options) {
        if (!options.id) {
            throw new Espo.Exceptions.NotFound();
        }

        const id = options.id;

        // we need to define the view in client/custom/src/views/account/test.js
        const viewName = 'custom:views/account/test'; 

        // this will render view in the main container element #main
        // id will be passed to the view
        this.main(viewName, {id: id});
    }
```

Create a view `client/custom/src/views/account/test.js`:

```js
define('custom:views/account/test', ['view'], (View) => {

    return class extends View {

        // language=Handlebars
        templateContent = `Id: {{id}}, name: {{name}}`

        data() {
            return {
                id: this.model.id,
                name: this.model.attributes.name,
            }
        }

        setup() {
            this.wait(this.loadModel());
        }

        async loadModel() {
            this.model = await this.getModelFactory().create('Account');
            this.model.id = this.options.id;

            await this.model.fetch();
        }
    }
});
```
