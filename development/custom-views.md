# Custom Views

## Record Views

EspoCRM framework provides flexible abilities to define custom views for certail entity types. They must be defined it `clientDefs` category of metadata.

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

`client/custom/src/views/your-entity-type/record/detail.js`

Record/Detail view contains all panels with fields, relations and other data you can see on detail view. It doesn't contain header and buttons in the top-right corner.

```javascript
Espo.define('custom:views/your-entity-type/record/detail', 'views/record/detail', function (Dep) {

  template: 'custom:your-entity-type/record/detail', // Here is your custom template. Omit if you don't need it.
  
  return Dep.extend({
    setup: function () {
      Dep.prototype.setup.call(this);
      
      this.hideField('someField');
      this.showField('someField');
      
      // Custom initalization logic here. Like binding listening to model changes.
      this.listenTo(this.model, 'change:myField', function () {
        this.model.set('anotherField', this.model.get('myField') + ' Hello');
         
        this.hideField('someField');
        this.showField('someField');
        this.setFieldRequired('someField');
        this.setFieldNotRequired('someField');
        
        this.setFieldReadOnly('someField');
        this.setFieldNotReadOnly('someField');
        
        this.hidePanel('activities');
        this.showPanel('history');
      }, this);
    },
    
    afterRender: function () {
      Dep.prototype.afterRender.call(this);
      
      // Custom code to be invoked right after rendering, when DOM is avaiable.
      this.$el.find('label[data-name="myField"]').addClass('hidden');
    }
  });
});

```


`client/custom/src/views/your-entity-type/detail.js`

Detail view contains Record/Detail view and Header.


`client/custom/src/views/your-entity-type/edit.js`
`client/custom/src/views/your-entity-type/record/edit.js`

The same as detail but is used when record is being created or edied not in inline-edit mode.


`client/custom/src/views/your-entity-type/list.js`

List view contains Record/List view, Header and Search Form View.


`client/custom/src/views/your-entity-type/record/list.js`

List/Record view contains rows of records.


It worths to mention that you need to inherit your view class from specific class for your entity if one already exists.

```javascript
Espo.define('custom:views/email/record/detail', 'views/email/record/detail', function (Dep) {

});
```

## Field Views

Custom views for specific fields should be specified in entityDefs section of metadata.

`custom/Espo/Custom/Resources/metadata/entityDefs/YourEntityType.json`



```json
{
  "fields": {
    "yourFieldName": {
      "view": "custom:views/your-entity-type/fields/your-field-name"
    }  
  }
}
```

