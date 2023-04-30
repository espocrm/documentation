# Modal view (dialog)

## Modal form


Modal view: `client/custom/src/views/modals/my-dialog.js`

```js

define('custom:views/modals/my-dialog', ['views/modal', 'model'], function (Dep, Model) {

    return Dep.extend({

        className: 'dialog dialog-record',

        // template content can be defined right here or externally
        templateContent: `
            <div class="record no-side-margin">{{{record}}}</div>
        `,

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
            
            let title = this.options.title || ''; // assuming it's passed by our parent view

            this.headerText = title;             
            // this.headerHtml = this.getHelper().escapeString(title);

            this.formModel = new Model();
            this.formModel.name = 'None'; // dummy name, important

            // define fields
            this.formModel.setDefs({
                fields: {
                    'someString': {
                        type: 'varchar', // field type
                        view: 'views/fields/varchar', // optional, to define custom view
                        required: true, // field param
                        trim: true, // field param
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
                detailLayout: [ // form layout
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
            let isValid = this.getView('record').processFetch();

            if (!isValid) { 
                return;
            }
            
            // make POST request
            Espo.Ajax
                .postRequest('MyScope/action/doSomething', {
                    id: this.options.id, // passed from the parent view
                    someString: this.formModel.get('someString'),
                    someCheckbox: this.formModel.get('someCheckbox'),
                })
                .then(response => {
                    Espo.Ui.success(this.translate('Done'));
                    // event 'done' will be caught by the parent view
                    this.trigger('done', response);
                    this.close();
                });
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
            }, view => {
                view.render();

                this.listenToOnce(view, 'done', response => {
                    console.log(response);
                })
            });

...

```

## Simple dialog w/o separate view

```js

        this.createView('dialog', 'views/modal', {
            templateContent: '<p>{{complexText viewObject.options.message}}</p>',
            headerText: 'Hello world',
            backdrop: true,
            message: 'Some *message*\n\nHello world!',
            buttonList: [
                {
                    name: 'doSomething',
                    label: this.translate('Do Something'),
                    onClick: () => {
                        // Do something.
                        this.close();
                    },
                    style: 'primary',
                },
                {
                    name: 'close',
                    label: this.translate('Close'),
                }
            ],
        }, view => {
            view.render();
        });
```
