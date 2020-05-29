# Modal view (dialog)

## Modal form


Modal view: `client/custom/src/views/modals/my-dialog.js`

```js

define('custom:views/modals/my-dialog', ['views/modal', 'model'], function (Dep, Model) {

    return Dep.extend({

        className: 'dialog dialog-record',

        // template content can be defined right here or externally
        templateContent: '<div class="record">{{{record}}}</div>',

        // template content can be defined in external file client/custom/res/templates/my-dialog.tpl 
        // template: 'custom:modals/my-dialog',

        // if true, clicking on the backdrop will close the dialog
        backdrop: true, // 'static', true, false

        setup: function () {
            // action buttons
            this.buttonList = [
                {
                    name: 'doSomething', // handler for 'doSomething' action is bellow
                    html: this.translate('Some Action', 'labels', 'MyScope'), // button label 
                    style: 'danger',
                },
                {
                    name: 'cancel',
                    label: 'Cancel',
                },
            ];
            
            var title = this.options.title || ''; // passed from the parent view

            this.headerHtml = this.getHelper().escapeString(title); // escape to prevent XSS

            this.formModel = new Model();
            this.formModel.name = 'None'; // dummy name

            // define fields
            this.formModel.setDefs({
                fields: {
                    'someString': {
                        type: 'varchar', // field type
                        view: 'views/fields/varchar', // can define custom view
                        required: true, // field params
                        trim: true,
                    },
                    'someCheckbox': {
                        type: 'bool',
                    },
                }
            });

            this.createView('record', 'views/record/edit-for-modal', {
                scope: 'None', // dummy name
                model: this.formModel,
                el: this.getSelector() + ' .record',
                // define layout
                detailLayout: [
                    {
                        rows: [
                            [
                                {
                                    name: 'someString',
                                    labelText: this.translate('someString', 'fields', 'MyScope'),
                                },
                                {
                                    name: 'someCheckbox',
                                    labelText: this.translate('Some Checkbox', 'labels', 'MyScope'),
                                }
                            ]
                        ]
                    }
                ],
            });
        },

        actionDoSomething: function () {
            // fetch data from form to model and validate
            var isValid = this.getView('record').processFetch();

            if (isValid) { 
                // make POST request
                Espo.Ajax.postRequest('MyScope/action/doSomething', {
                    id: this.options.id, // passed from the parent view
                    someString: this.formModel.get('someString'),
                    someCheckbox: this.formModel.get('someCheckbox'),
                }).then(
                    function (response) {
                        Espo.Ui.success(this.translate('Done'));
                        // event 'done' will be catched by the parent view
                        this.trigger('done', response);
                        this.close();
                    }.bind(this)
                );
            }
        },
    });
});

```

Parent view calling our modal view:

```js

...
            this.createView('dialog', 'custom:views/modals/my-dialog', {
                id: this.model.id,
                title: this.model.get('name'),                
            }, function (view) {
                view.render();

                this.listenToOnce(view, 'done', function (response) {
                    console.log(response);
                }, this)
            });

...

```

## Simple dialog w/o separate view

Available since 5.7.0.

```js

        this.createView('dialog', 'views/modal', {
            templateContent: '<p>{{complexText viewObject.options.message}}</p>',
            headerText: 'Hello world',
            backdrop: true,
            message: 'Some *message*\n\nHello world!',
            buttonList: [
                {
                    name: 'close',
                    label: this.translate('Close'),
                }
            ],
        }, function (view) {
            view.render();
        });
```
