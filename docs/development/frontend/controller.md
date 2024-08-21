# Client controller & routing 

## Custom controller

Define a custom controller for the needed entity type (Account in our example).

Create a file `custom/Espo/Custom/Resources/metadata/clientDefs/Account.json`:

```json
{
    "controller": "custom:controllers/account"
}
```

Create a file `client/custom/src/controllers/account.js`:

```js
define(['controllers/record'], (Dep) => {

    return class extends Dep {

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

If you open in the browser URL `your-espo-url#Account/hello` it will execute *actionHello* method.

`#Account/hello` – *options* variable value is an empty object
`#Account/hello/p1=one&p2=two` – *options* variable value is an object `{p1: 'one', p2: 'two'}`

## Custom route

Create a file `custom/Espo/Custom/Resources/metadata/app/clientRoutes.json`:

```json
{
    "Account/test/:id": {
        "params": {
            "controller": "Account",
            "action": "test"
        },
        "order": 1
    }
}
```

Clear cache.

If you open in the browser URL `your-espo-url#Account/test/myId` it will execute *actionTest* method. Argument *options* will be the object `{id: 'myId'}`.

Note that it's also possible to specify a specific controller class in `controller` instead of a scope name. As of v8.2.

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
define('custom:views/account/test', ['view'], (Dep) => {

    return class extends Dep {

        // language=Handlebars
        templateContent = `Id: {{id}}, name: {{name}}`

        data() {
            return {
                id: this.options.id,
                name: this.model.attributes.name,
            }
        }

        setup() {
            this.wait(this.loadModel());
        }

        async loadModel() {
            this.model = await this.getModelFactory().create('Account');
            this.model = this.options.id;

            await this.model.fetch();
        }
    }
});
```
