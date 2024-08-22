# Custom views

## Record views

EspoCRM framework provides abilities to define custom views for certain entity types. They must be defined in `clientDefs` category of metadata.

`custom/Espo/Custom/Resources/metadata/clientDefs/YourEntityType.json`

```json
{
    "views": {
        "list": "custom:views/your-entity-type/list",
        "detail": "custom:views/your-entity-type/detail",
        "edit": "custom:views/your-entity-type/edit"
    },
    "recordViews": {
        "list": "custom:views/your-entity-type/record/list",
        "detail": "custom:views/your-entity-type/record/detail",
        "edit": "custom:views/your-entity-type/record/edit"
    }
}
```

### Detail view

`client/custom/src/views/your-entity-type/record/detail.js`

The view 'views/record/detail' contains all panels with fields, relations and other data you can see on detail view. It doesn't contain header and buttons in the top-right corner.

```javascript
define('custom:views/your-entity-type/record/detail', ['views/record/detail'], (DetailRecordView) => {

    return class extends DetailRecordView {

        // custom template, omit if you don't need it
        // template = 'custom:your-entity-type/record/detail'
        
        // custom central view, omit if you don't need it
        // middleView = 'custom:views/your-entity-type/record/detail-middle'
        
        // custom side column view, omit if you don't need it
        // sideView = 'custom:views/your-entity-type/record/detail-side'
        
        // custom bottom view, omit if you don't need it
        // bottomView = 'custom:views/your-entity-type/record/detail-bottom'

        setup() {
            super.setup();

            this.hideField('someField');
            this.showField('someField');

            // custom initialization logic, like binding listening to model changes
            this.listenTo(this.model, 'change:myField', () => {
                this.model.set('anotherField', this.model.get('myField') + ' Hello');

                this.hideField('someField');
                this.showField('someField');
                this.setFieldRequired('someField');
                this.setFieldNotRequired('someField');

                this.setFieldReadOnly('someField');
                this.setFieldNotReadOnly('someField');

                this.hidePanel('activities');
                this.showPanel('history');
            });
        }

        afterRender() {
            super.afterRender();
        }
    }
});

```

You are able to create a custom template with the following path: `client/custom/res/templates/your-entity-type/record/detail.tpl`

`client/custom/src/views/your-entity-type/detail.js`

Detail view contains a record view and header view.

### Edit view

`client/custom/src/views/your-entity-type/edit.js`
`client/custom/src/views/your-entity-type/record/edit.js`

The same as detail but it is used when record is being created or edited not in inline-edit mode.

### List view

`client/custom/src/views/your-entity-type/list.js`

List view contains Record/List view, Header and Search Form View.

`client/custom/src/views/your-entity-type/record/list.js`

The views 'views/list/record' contains rows of records.

### Extending from specific view

It's worth to mention that you need to inherit your view class from specific class for your entity if one already exists.

```javascript
define('custom:views/email/record/detail', ['views/email/record/detail'], (EmailDetailRecordView) => {
    return class extends EmailDetailRecordView {}
});
```

## Field views

Custom views for specific fields should be specified in entityDefs section of metadata.

Example for Address field of Account entity type.

`custom/Espo/Custom/Resources/metadata/entityDefs/Account.json`


```json
{
    "fields": {
        "address": {
            "view": "custom:views/account/fields/address"
        }  
    }
}
```

`client/custom/src/views/account/fields/address.js`

```js
define('custom:views/fields/address', ['views/fields/address'], (AddressFieldView) => {

   return class extends AddressFieldView {
  
        setup() {
            super.setup();
            // some initialization
        }

        afterRender() {
            super.afterRender();
            // your customizations executed after the field is rendered
        }
    }
});
```

## See also

* [View setup handlers](frontend/view-setup-handlers.md)
