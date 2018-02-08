# Vistas Personalizadas

## Historial de Vistas

El marco metodológico de EspoCRM facilita habilidades flexibles para definir vistas personalizadas para ciertos tipos de entidad. Estos deben definirlo en la categoría `clientDefs` de metadata.

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

La vista Historial/Detalle contiene todos los paneles con campos, relaciones y otros datos que podrá ver en vista detallada. No contiene encabezado y los botones están en la esquina superior derecha. 

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

Se le permite crear una plantilla personalizada con la ruta siguiente:
`client/custom/res/templates/your-entity-type/record/detail.tpl`



`client/custom/src/views/your-entity-type/detail.js`

La vista detallada contiene vista de Historial/Detalle y Encabezado.


`client/custom/src/views/your-entity-type/edit.js`
`client/custom/src/views/your-entity-type/record/edit.js`

Lo mismo que detallada pero es utilizada cuando se está creando o editando un historial, no en el modo de edición en línea.


`client/custom/src/views/your-entity-type/list.js`

La vista de Lista contiene vista de Historial/Lista, Encabezado y Vista en Forma de Búsqueda.


`client/custom/src/views/your-entity-type/record/list.js`

La vista de Lista/Historial contiene filas de historial.


Vale la pena mencionar que usted necesita heredar su clase de vista de una clase específica para su entidad si ya existe alguna.

```javascript
Espo.define('custom:views/email/record/detail', 'views/email/record/detail', function (Dep) {

});
```

## Vistas de Campo

Las vistas personalizadas para campos específicos deberían ser especificadas en la sección entityDefs de metadata.

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

