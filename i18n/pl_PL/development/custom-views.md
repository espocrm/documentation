# Spersonalizowane widoki

## Widoki rekordów

Framework EspoCRM dostarcza elastyczne możliwości definiowania spersonalizowanych widoków dla konkrentych rekordów. Muszą być zdefioniowane w kategorii matadanych `clientDefs`.

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

Rekord/Szczegółowy widok zawiera wszystkie panele z polami, relacjami i innymi danymi, które możesz zobaczyćw widoku szczegółowym. Nie zawiera nagłówka i przycisków w górnym prawym narożniku.

```javascript
Espo.define('custom:views/your-entity-type/record/detail', 'views/record/detail', function (Dep) {
  
  return Dep.extend({
    template: 'custom:views/your-entity-type/record/detail', // Tu jest Twój spersonalizowany szablon. Omiń to jeśli go nie potrzebujesz.
    middleView: 'custom:views/your-entity-type/record/detail-middle', // Tu jest Twój spersonalizowany widok. Omiń to jeśli go nie potrzebujesz.
    sideView: 'custom:views/your-entity-type/record/detail-side',     // Tu jest Twój spersonalizowany widok. Omiń to jeśli go nie potrzebujesz.
    bottomView: 'custom:views/your-entity-type/record/detail-bottom', // Tu jest Twój spersonalizowany widok. Omiń to jeśli go nie potrzebujesz.
    
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

Spersonalizowany szablon możesz stworzyć pod tym linkiem:
`client/custom/res/templates/your-entity-type/record/detail.tpl`



`client/custom/src/views/your-entity-type/detail.js`

Widok szczegółowy zawiera widok rekordu/szczegółów i nagłówek.


`client/custom/src/views/your-entity-type/edit.js`
`client/custom/src/views/your-entity-type/record/edit.js`

Tak samo jak w szczegółach ale jest wykorzystywane kiedy rekord został stworzony lub zedytowany nie w trybie edycji bezpośredniej.


`client/custom/src/views/your-entity-type/list.js`

Widok list zawiera widok Rekordu/Listy, Nagłówek oraz widok Formularza Wyszukującego.


`client/custom/src/views/your-entity-type/record/list.js`

Widok Listy/Rekordu zawiera wiersze z rekordami.


Warto wspomnieć, że musisz dziedziczyć klasę widoku z klasy konkretnego podmiotu, jeśli już istnieje.

```javascript
Espo.define('custom:views/email/record/detail', 'views/email/record/detail', function (Dep) {

});
```

## Widoki Pól

Sperfonalizowane widoki pól powinny być zdefiniowane w sekcji matadanych entityDefs.

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

