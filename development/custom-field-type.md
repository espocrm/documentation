# Creating Custom Field Type

### Field Definition
Create a file `/custom/Espo/Custom/Resources/metadata/fields/[field-type].json` with your parameters.
Also set `"view"` parameter (`"view":"custom:views/fields/[field-type]"`);
#### Examples from Core:
- `/application/Espo/Resources/metadata/fields`.
 
### Translation
The label is used in Entity Manager you can set in `custom/Espo/Custom/Resources/i18n/en_US/Admin.json` in section `fieldTypes`.
If need to add translation to other language, use needed language [language code](https://en.wikipedia.org/wiki/ISO_639-1)_[country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) instead of `en_US`. In `data/config.php` in section `languageList` you can find the list of included languages.
### View
Create the view for field `client/custom/src/views/fields/[field-type].js` and define its templates
```
Espo.define('custom:views/fields/[field-type]', 'views/fields/base', function (Dep) {
    
    return Dep.extend({
        ///
    });
});
```
#### Examples from Core:
- `/client/src/views/fields` - views;
- `/client/res/templates/fields` - templates.

__Rebuild CRM. After that, this new field type will be available in Entity Manager.__
