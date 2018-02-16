# Crearea unui tip specific de câmp

### Definirea Câmpului

Creați un fișier `/custom/Espo/Custom/Resources/metadata/fields/{field-type}.json` cu parametrii necesari.
```
{
   "view": "custom:views/fields/{field-type}"`
}
```

Folosiți exemplele tipurilor de câmp out-of-the-box: `/application/Espo/Resources/metadata/fields`.
 
### Traducere

Eticheta este folosită în Managerul de Entități și poate fi setată în `custom/Espo/Custom/Resources/i18n/en_US/Admin.json` în secțiunea `fieldTypes`.
Dacă trebuie să adăugați traduceri în altă limbă, folosiți limba de care aveți nevoie [codul limbii](https://en.wikipedia.org/wiki/ISO_639-1)_[country code](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) instead of `en_US`. In `data/config.php` în secțiunea `languageList` puteți găsi lista cu limbile incluse.

### Vizualizare

Creați vizualizare în câmpul `client/custom/src/views/fields/{field-type}.js` și definiți-le șabloanele.
```
Espo.define('custom:views/fields/[field-type]', 'views/fields/base', function (Dep) {
    
    return Dep.extend({
        
    });
});
```

Folosiți ca și exemplu tipurilor de câmp out-of-the-box:
- `/client/src/views/fields` - vizualizări;
- `/client/res/templates/fields` - șabloane.

Apoi va trebui să rulați reconstruirea din panoul de administrare.
