# Creating custom field type

Use the name of your field type instead of `{field-type}`.

### Field definition

Create a file `custom/Espo/Custom/Resources/metadata/fields/{field-type}.json` with needed parameters.

```json
{
   "view": "custom:views/fields/{field-type}"
}
```

Use out-of-the-box field types as examples: `application/Espo/Resources/metadata/fields`.
 
### View

Create a file `client/custom/src/views/fields/{field-type}.js`:

```js
define('custom:views/fields/{field-type}', ['views/fields/base'], function (Dep) {
    
    /**
     * JSDoc enabling code completion in PhpStorm/Webstorm.
     *
     * @class
     * @name Class
     * @extends modules:views/fields/base.Class
     * @memberOf modules:custom:views/fields/{field-type}
     */
    return Dep.extend(/** @lends modules:custom:views/fields/{field-type}.Class# */{
    
        detailTemplate: 'custom:fields/{field-type}/detail',
        
        listTemplate: 'custom:fields/{field-type}/list',
        
        editTemplate: 'custom:fields/{field-type}/edit',
        
        searchTemplate: 'custom:fields/{field-type}/search',
        
        setup: function () {
        
        },
        
        afterRender: function () {
        
        },
    });
});
```

Create detail, list, edit, search  templates (*.tpl extension) in the `client/custom/res/templates/fields/{field-type}/` directory.

Use out-of-the-box field types as examples:

- `client/src/views/fields/` — views
- `client/res/templates/fields/` — templates

### Translation

The label is used in Entity Manager can be set in `custom/Espo/Custom/Resources/i18n/en_US/Admin.json` in the section `fieldTypes`.
If you need to add translation to other language, use [language code](https://en.wikipedia.org/wiki/ISO_639-1)_[Country Code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) instead of `en_US`.

Then you need to clear cache at the administration panel.

### Backend validator

You can define a validator class in a field metadata file in the `validatorClassName` parameter. See the [barcode field](https://github.com/espocrm/espocrm/blob/stable/application/Espo/Resources/metadata/fields/barcode.json) as an expamle.
