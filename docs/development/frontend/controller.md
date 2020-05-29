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
define('custom:controllers/account', ['controllers/record'], function (Dep) {

    return Dep.extend({

        actionHello: function (options) {
            console.log('action: hello');
            console.log(options);
        },

        actionTest: function (options) {
            if (!options.id) throw new Espo.Exceptions.NotFound();

            console.log('action: test');
            console.log(options);
        },

    });
});

```

Clear cache.

If you open in the browser URL `your-espo-url#Account/hello` it will execute *actionHello* method.

`#Account/hello` – *options* variable value is an empty object
`#Account/hello/p1=one&p2=two` – *options* variable value is an object `{p1: 'one', p2: 'two'}`

## Custom route

Create a file `custom/Espo/Custom/Resources/metadata/app/clientRoutes.json`:

```json
    "Account/test/:id": {
        "params": {
            "controller": "Account",
            "action": "test"
        }
    }
```

Clear cache.

If you open in the browser URL `your-espo-url#Account/test/myId` it will execute *actionTest* method. Argument *options* will be the object `{id: 'myId'}`

## Rendering view

In controller:
```js
        actionTest: function (options) {
            if (!options.id) throw new Espo.Exceptions.NotFound();

            var id = options.id;

            // we need to define view in client/custom/src/views/account/test.js
            var viewName = 'custom:views/account/test'; 

            // this will render view in the main container element #main
            // id will be passed to the view
            this.main(viewName, {
                id: id,
            });
        },
```

Create a view `client/custom/src/views/account/test.js`:

```js
define('custom:views/account/test', ['view'], function (Dep) {

    return Dep.extend({

        templateContent: 'Id: {{id}}, name: {{name}}',

        data: function () {
            return {
                id: this.options.id,
                name: this.model.get('name')
            }
        },

        setup: function () {
            this.wait(
                this.getModelFactory().create('Account')
                .then(
                    function (model) {
                        this.model = model;
                        model.id = this.options.id;
                        return model.fetch();
                    }.bind(this)
                )
            );
        },
        
    });
});

```
