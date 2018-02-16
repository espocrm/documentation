# Vizualizări Personalizate

## Vizualizări înregistrare

Cadrul de lucru EspoCRM oferă abilități flexibile de a defini vizualizări personalizate pentru anumite tipuri de entități. Trebuie să fie definite în categoria `clientDefs` a metadatelor.

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

Vizulaizarea Înregistrare/Detaliu conține toate panourile cu câmpuri, relații și alte date pe care le poți vedea în vizualizarea detaliată. Nu conține header și butoane în colțul de sus din dreapta.

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

Ai posibilitatea de a creea un șablon personalizat cu următoarea cale:
`client/custom/res/templates/your-entity-type/record/detail.tpl`



`client/custom/src/views/your-entity-type/detail.js`

Vizualizarea detaliată conține vizualizarea Înregistrare/Detaliu și Header.


`client/custom/src/views/your-entity-type/edit.js`
`client/custom/src/views/your-entity-type/record/edit.js`

La fel ca detaliul dar este folosit atunci când o înregistrare este creată sau editată dar nu în modul de editare inline.


`client/custom/src/views/your-entity-type/list.js`

Ultima vizulaizare conține vizualizarea Înregistrare/Listă, Header și Vizualizarea Formularului de Căutare.


`client/custom/src/views/your-entity-type/record/list.js`

Vizualizarea Listă/Înregistrare conține rânduri din înregistrări.


Merită menționat faptul că trebuie să moșteniți clasa de vizualizare din clasa specifică pentru entitatea dumneavoastră, dacă aceasta există deja.

```javascript
Espo.define('custom:views/email/record/detail', 'views/email/record/detail', function (Dep) {

});
```

## Vizualizare Câmpuri

Vizualizările personalizate pentru anumite câmpuri ar trebui specificate în secțiunea entityDefs a metadatelor.

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

