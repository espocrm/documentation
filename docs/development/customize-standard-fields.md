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
define(['views/fields/address'], (AddressFiedView) => {

   return class extends AddressFiedView {

        //detailTemplateContent = ' ... '
        //editTemplateContent = ' ... '
        //listTemplateContent = ' ... '
        //listLinkTemplateContent = ' .. '
  
        setup() {
            super.setup();
        }

        afterRender() {
            super.afterRender();
            // your customizations executed after the field is rendered
        }
    }
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
define(['views/fields/varchar'], (VarcharFieldView) => {

   return class extends VarcharFieldView {
  
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
