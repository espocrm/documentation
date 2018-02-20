# Pag-lika ng uri ng Kustom na Field

### Depinisyon ng Field 

Lumika ng isang file `/custom/Espo/Custom/Resources/metadata/fields/{field-type}.json` na may mga kinakailangang parameter.
```
{
   "view": "custom:views/fields/{field-type}"`
}
```

Gamitin ang mga uri ng out-of-the-box field bilang mga halimbawa: `/application/Espo/Resources/metadata/fields`.
 
### Pagsasalin

Ang label na ginagamit sa Entity Manager ay maaaring ma-set sa `custom/Espo/Custom/Resources/i18n/en_US/Admin.json` sa seksyon ng `fieldTypes`.
Kung kailangan mong magdagdag ng pagsasalin sa ibang lengguwahe, gamitin ang kinakailangang lengguwahe [code ng lengguwahe](https://en.wikipedia.org/wiki/ISO_639-1)_[country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) sa halip na `en_US`. Sa `data/config.php` sa seksyon ng `languageList` maaari mong makita ang listahan ng mga kasama na lengguwahe. 

### Pag-view

Lumikha ng view para sa field `client/custom/src/views/fields/{field-type}.js` at tukuyin ang mga template nito.
```
Espo.define('custom:views/fields/[field-type]', 'views/fields/base', function (Dep) {
    
    return Dep.extend({
        
    });
});
```

Gamitin ang mga out-of-the-box na uri ng field bilang mga halimbawa:
- `/client/src/views/fields` - mga view;
- `/client/res/templates/fields` - mga template.

Pagkatapos ay kailangan mong patakbhuin ang rebuild sa administration panel.
