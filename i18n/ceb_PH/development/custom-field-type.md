# Paghimo og Custom nga Field Type

### Field Definition

Himo og usa ka file nga `/custom/Espo/Custom/Resources/metadata/fields/{field-type}.json` nga naa ang gikinahanglan nga mga parametro.
```
{
   "view": "custom:views/fields/{field-type}"`
}
```

Gamit og mga out-of-the-box field nga tipo isip mga example: `/application/Espo/Resources/metadata/fields`.
 
### Paghubad

Ang label nga gigamit sa Entity Manager kay pwede maset sa `custom/Espo/Custom/Resources/i18n/en_US/Admin.json` sa seksyon nga `fieldTypes`.
Kung gikinahanglan nimo pun-an ang paghubad ngadto sa lain nga lengguwahe, gamit og needed language [language code](https://en.wikipedia.org/wiki/ISO_639-1)_[country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) kaysa sa `en_US`. Sa sulod sa `data/config.php` sa seksyon `languageList` pwede ka makapangita sa lista sa mga giapil nga mga lengguwahe.

### View

Himo og view para sa field `client/custom/src/views/fields/{field-type}.js` ug i-define ang mga template niini
```
Espo.define('custom:views/fields/[field-type]', 'views/fields/base', function (Dep) {
    
    return Dep.extend({
        
    });
});
```

Gamit og mga out-of-the-box field nga tipo isip mga example: 
- `/client/src/views/fields` - mga view;
- `/client/res/templates/fields` - mga template.

Dayon, gikinahanglan nimo ipadagan ang rebuild ngadto sa administration nga panel.
