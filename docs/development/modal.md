# Modal view (dialog)

## Modal with a form

Example of a modal dialog with a form.

Modal view: `client/custom/src/views/modals/my-dialog.js`

```js
define('custom:views/modals/my-dialog', ['views/modal', 'model'], (ModalView, Model) => {

    return class extends ModalView {

        className = 'dialog dialog-record'

        // language=Handlebars
        templateContent = `
            <div class="record no-side-margin">{{{record}}}</div>
        `,

        // If true, clicking on the backdrop will close the dialog.
        // Can be 'static', true or false.
        backdrop = true 

        setup() {
            // action buttons
            this.buttonList = [
                {
                    name: 'doSomething', // handler for 'doSomething' action is bellow
                    html: this.translate('Some Action', 'labels', 'MyScope'), // button label 
                    style: 'danger',
                    onClick: () => this.actionDoSomething(),
                },
                {
                    name: 'cancel',
                    label: 'Cancel',
                },
            ];
            
            const title = this.options.title || ''; // assuming it's passed from our parent view

            this.headerText = title;             
            // this.headerHtml = this.getHelper().escapeString(title);

            this.formModel = new Model();

            // define fields
            this.formModel.setDefs({
                fields: {
                    'someString': {
                        type: 'varchar', // field type
                        view: 'views/fields/varchar', // optional, to define custom view
                        required: true, // field param
                    },
                    'someCheckbox': {
                        type: 'bool',
                    },
                }
            });

            this.createView('record', 'views/record/edit-for-modal', {
                scope: 'None', // dummy name
                model: this.formModel,
                selector: '.record',                
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
                                },
                            ],
                        ],
                    },
                ],
            });
        }

        async actionDoSomething() {
            /** @type {import('views/record/edit').default} */
            const recordView = this.getView('record');

            const isValid = recordView.processFetch();

            if (!isValid) { 
                return;
            }

            Espo.Ui.notify(' ... ');
            
            const response = await Espo.Ajax.postRequest('MyScope/action/doSomething', {
                id: this.options.id, // passed from the parent view
                someString: this.formModel.attributes.someString,
                someCheckbox: this.formModel.attributes.someCheckbox,
            });

            Espo.Ui.success(this.translate('Done'));

            // We assume that the event 'done' will be caught by the parent view.
            this.trigger('done', response);

            // Close the modal dialog.
            this.close();
        }
    }
});
```

Parent view calling our modal view:

```js
this.createView('dialog', 'custom:views/modals/my-dialog', {
    id: this.model.id,
    title: this.model.get('name'),                
}, view => {
    view.render();

    this.listenToOnce(view, 'done', response => {
        console.log(response);
    })
});
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
