# Visualizações personalizadas

## Registro de Visualizações

O framework EspoCRM oferece habilidades flexíveis para definir visualizações personalizadas para determinados tipos de entidades. Eles devem ser definidos como categoria de metadados `clientDefs`.

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

A exibição de registro/detalhe contém todos os painéis com campos, relações e outros dados que você pode ver na visualização detalhada. Não contém cabeçalho e botões no canto superior direito.

```javascript
Espo.define('custom:views/your-entity-type/record/detail', 'views/record/detail', function (Dep) {
  
  return Dep.extend({
    template: 'custom:views/your-entity-type/record/detail', // Aqui está o seu modelo personalizado. Omita se você não precisa disso.
    middleView: 'custom:views/your-entity-type/record/detail-middle', // Aqui está a sua visão personalizada. Omita se você não precisa disso.
    sideView: 'custom:views/your-entity-type/record/detail-side',     // Aqui está a sua visão personalizada. Omita se você não precisa disso.
    bottomView: 'custom:views/your-entity-type/record/detail-bottom', // Aqui está a sua visão personalizada. Omita se você não precisa disso.
    
    setup: function () {
      Dep.prototype.setup.call(this);
      
      this.hideField('someField');
      this.showField('someField');
      
      // Aqui está a lógica de inicialização personalizada. Como ligar ouvindo mudanças no modelo.
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
      
      // Código personalizado a ser invocado logo após a renderização, quando DOM estiver disponível.
      this.$el.find('label[data-name="myField"]').addClass('hidden');
    }
  });
});

```

Você pode criar um modelo personalizado com o seguinte caminho:
`client/custom/res/templates/your-entity-type/record/detail.tpl`



`client/custom/src/views/your-entity-type/detail.js`

A exibição de detalhes contém exibição de Registro/Detalhe e cabeçalho.


`client/custom/src/views/your-entity-type/edit.js`
`client/custom/src/views/your-entity-type/record/edit.js`

O mesmo que o detalhe, mas é usado quando o registro está sendo criado ou editado não no modo de edição inline.


`client/custom/src/views/your-entity-type/list.js`

A exibição de lista contém exibição de Registro/Lista, cabeçalho e formulário de pesquisa.

`client/custom/src/views/your-entity-type/record/list.js`

A exibição Lista/Registro contém linhas de registros.


Vale a pena mencionar que você precisa herdar sua classe de visualização de uma classe específica para sua entidade se já existe.

```javascript
Espo.define('custom:views/email/record/detail', 'views/email/record/detail', function (Dep) {

});
```

## Visualizações de Campo

As visualizações personalizadas para campos específicos devem ser especificadas na seção entityDefs dos metadados.

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
