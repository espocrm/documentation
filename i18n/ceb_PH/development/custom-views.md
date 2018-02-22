# Mga Custom nga View

## Mga Record View

Ang EspoCRM framework naghatag ug mga flexible nga abilidad aron itakda ang mga custom view alang sa pipila nga matang sa entity. Kini kinahanglan nga gihubat sa `clientDefs` nga kategoriya sa metadata.

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

Ang Record/Detail view naglakip sa tanan nga mga panel nga adunay mga field, mga relasyon ug ubang mga datos nga imong makita sa detail view. Wala kini'y header ug mga buton sa tuo nga bahin.

```javascript
Espo.define('custom:views/your-entity-type/record/detail', 'views/record/detail', function (Dep) {
  
  return Dep.extend({
    template: 'custom:views/your-entity-type/record/detail', // Here is your custom template. Omit if you don't need it.
    middleView: 'custom:views/your-entity-type/record/detail-middle', // Here is your custom view. Omit if you don't need it.
    sideView: 'custom:views/your-entity-type/record/detail-side',     // Here is your custom view. Omit if you don't need it.
    bottomView: 'custom:views/your-entity-type/record/detail-bottom', // Here is your custom view. Omit if you don't need it.
    
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

Makahimo ka sa pagbuhat sa usa ka custom nga template uban sa mosunod nga path:
`client/custom/res/templates/your-entity-type/record/detail.tpl`



`client/custom/src/views/your-entity-type/detail.js`

Ang Detail view adunay Record/Detail view ug Header.


`client/custom/src/views/your-entity-type/edit.js`
`client/custom/src/views/your-entity-type/record/edit.js`

Sama ra sa detail apan gamiton ra sa dihang ang rekord nga gimugna o gi-edit dili sa inline-edit mode.


`client/custom/src/views/your-entity-type/list.js`

Ang List view adunday Record/List view, Header ug Search Form View.


`client/custom/src/views/your-entity-type/record/list.js`

Ang List/Record view naglangkob sa mga laray sa mga rekord.


Kini angay nga isulti nga kinahanglan nimong makuha ang imong view class gikan sa espesipiko nga klase sa imung entity kung ang usa naa na.

```javascript
Espo.define('custom:views/email/record/detail', 'views/email/record/detail', function (Dep) {

});
```

## Mga Field View

Ang mga Custom views alang sa mga espesipiko nga mga field kinahanglan nga matino sa seksyon sa entityDefs sa metadata.

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

