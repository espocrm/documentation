# Customizing existing fields

## Customizing field type

An example for the *Address* field type.

Create a file `custom/Espo/Custom/Resources/metadata/fields/address.json`.

```json
{
    "view": "custom:views/fields/address"
}
```

Create a file `client/custom/src/views/fields/address.js`.

```js
define('custom:views/fields/address', ['views/fields/address'], function (Dep) {

   return Dep.extend({
   
        detailTemplate: 'custom:fields/address/detail', // omit if you don't need custom template
        editTemplate: 'custom:fields/address/edit', // omit if you don't need custom template
        listTemplate: 'custom:fields/address/list', // omit if you don't need custom template
        listLinkTemplate: 'custom:fields/address/list-link', // omit if you don't need custom template
  
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

## Customizing specific field

### Changing field type of existing field

An example for the *Meeting*'s *Name* field.

Create (or edit if exists) a file `custom/Espo/Custom/Resources/metadata/entityDefs/Meeting.json`.

```json
{
    "fields": {
        "name": {
            "type": "enum"
        }
    }
}
```

### Custom view for specific field

An example for the *Meeting*'s *Name* field.

Create (or edit if exists) a file `custom/Espo/Custom/Resources/metadata/entityDefs/Meeting.json`.

```json
{
    "fields": {
        "name": {
            "view": "custom:views/meeting/fields/name.js"
        }
    }
}
```

File `client/custom/src/views/meeting/fields/name.js`:

```js
define('custom:views/meeting/fields/name', ['views/fields/varchar'], function (Dep) {

   return Dep.extend({
  
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
