# Customizing standard field

Example for Account's Address field.

Create a file `custom/Espo/Custom/Resources/metadata/fields/address.json`.

```json
{
    "view": "custom:views/fields/address"
}
```

Create a file `client/custom/src/views/fields/address.js`.

```js
define('custom:views/fields/address', 'views/fields/address', function (Dep) {

   return Dep.extend({
   
        detailTemplate: 'custom:fields/address/detail', // omit if you don't need custom template
        editTemplate: 'custom:fields/address/edit', // omit if you don't need custom template
        listTemplate: 'custom:fields/address/list', // omit if you don't need custom template
  
        setup: function () {
            Dep.prototype.setup.call(this);
            // some initialization
        },

        afterRender: function () {
            Dep.prototype.afterRender.call(this);
            // your customizations executed after the field is rendered
        },
    });
});
```

Create a template file (if needed) `client/custom/res/templates/fields/address/detail.tpl`.
