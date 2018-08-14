# Mga Kustom na View

## Mga Record View

Ang framework ng EspoCRM ay nagbibigay ng mga kakayahan na madaling iakma para matukoy ang mga kustom view para sa mga partikular na uri ng entity. Dapat silang tukuyin bilang `clientDefs` na kategorya ng metadata.

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

Ang rekord/detail view ay naglalaman ng lahat ng mga panel na may mga field, mga kaugnayan at ibang pang datos na makikita mo sa detail view. Hindi ito naglalaman ng header at mga buton sa tuktok na kanang sulok.

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

Maaari kang lumikha ng isang kustom na template kasama ang sumusunod na path:
`client/custom/res/templates/your-entity-type/record/detail.tpl`



`client/custom/src/views/your-entity-type/detail.js`

Ang detail view ay naglalaman ng Rekord/Detail view at Header.


`client/custom/src/views/your-entity-type/edit.js`
`client/custom/src/views/your-entity-type/record/edit.js`

Kagaya ng detail pero ito ay ginagamit kung ang rekord ay nililikha o ini-edit na hindi sa inline-edit na mode.


`client/custom/src/views/your-entity-type/list.js`

Ang list view ay naglalaman ng Rekord/List view, Header at Search Form View.


`client/custom/src/views/your-entity-type/record/list.js`

Ang List/Rekord view ay naglalaman ng mga hanay ng rekord.


Karapat-dapat na banggitin na kailangan mong ma-inherit ang iyong klase ng view mula sa partikular na klase para sa iyong entity kung mayroon na nito.

```javascript
Espo.define('custom:views/email/record/detail', 'views/email/record/detail', function (Dep) {

});
```

## Mga Field View

Ang mga kustom view para sa mga partikular na field ay dapat na matukoy sa entityDefs na seksyon ng metadata.

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

