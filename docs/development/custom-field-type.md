# Creating custom field type

### Field definition

Create a file `/custom/Espo/Custom/Resources/metadata/fields/{field-type}.json` with needed parameters.
```
{
   "view": "custom:views/fields/{field-type}"`
}
```

Use out-of-the-box field types as examples: `/application/Espo/Resources/metadata/fields`.
 
### View

Create a file `client/custom/src/views/fields/{field-type}.js`
```js
define('custom:views/fields/{field-type}', 'views/fields/base', function (Dep) {
    
    return Dep.extend({
    
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

Create detail/list/edit/search  templates (*.tpl extension) in `client/custom/res/templates/fields/{field-type}/` directory.

Use out-of-the-box field types as examples:
- `/client/src/views/fields/` - views
- `/client/res/templates/fields/` - templates

### Translation

The label is used in Entity Manager can be set in `custom/Espo/Custom/Resources/i18n/en_US/Admin.json` in section `fieldTypes`.
If you need to add translation to other language, use needed language [language code](https://en.wikipedia.org/wiki/ISO_639-1)_[country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) instead of `en_US`. In `data/config.php` in section `languageList` you can find the list of included languages.

Then you need to clear cache at the administration panel.
