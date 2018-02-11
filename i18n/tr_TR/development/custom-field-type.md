# Özel Alan Türü Oluşturmak

### Alan Tanımlaması

Gerekli parametrelerle `/custom/Espo/Custom/Resources/metadata/fields/{field-type}.json` dosyasını oluşturunuz.

```
{
   "view": "custom:views/fields/{field-type}"`
}
```

Kutudan çıkmış alan türlerini örnek olarak kullanımı: `/application/Espo/Resources/metadata/fields`.
 
### Çeviri

Etiket, Varlık Yöneticisi'nde, `fieldTypes` bölümündeki `custom/Espo/Custom/Resources/i18n/en_US/Admin.json` ayarında kullanılabilir.
Başka bir dile çeviri eklemeniz gerekiyorsa, `en_US` yerine gerekli dili [dil kodu] kullanınız (https://en.wikipedia.org/wiki/ISO_639-1)_[ülke kodu](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). `LanguageList` bölümündeki` data/ config.php` bölümünde bulunan dillerin listesini bulabilirsiniz.

### Görünüm

`client/custom/src/views/fields/{field-type}.js`  alanı için görünümü oluşturun ve şablonlarını tanımlayınız.
```
Espo.define('custom:views/fields/[field-type]', 'views/fields/base', function (Dep) {
    
    return Dep.extend({
        
    });
});
```

Kutudan çıkmış alan türlerini örnek olarak kullanımı:
- `/client/src/views/fields` - görünümler;
- `/client/res/templates/fields` - şablonları.

Sonra yeniden yönetim panelinde çalıştırmanız gerekmektedir.
