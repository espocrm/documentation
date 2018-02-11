# Dinamik Formlar

Not: 4.3.0 versiyonundan bu yana, Varlık Yöneticisi'ndeki yönetici arayüzü aracılığıyla dinamik formu tanımlamak mümkündür.

EspoCRM'de form davranışını tanımlama yeteneği vardır.

## Örnek

> _nextStep_ alanını Fırsat Ayrıntısı görünümünde yalnızca Sahne Alanı  'Closed Won' olduğunda göstermeniz gerekmektedir.
>

Dosya oluşturun `custom/Espo/Custom/Resources/metadata/clientDefs/Opportunity.json`.
```json
{
  "formDependency": {
    "stage": {
      "map": {
        "Closed Won" : [
          {
            "action": "show",
            "fields": ["nextStep"]
          }
        ]
      }, 
      "default": [
         {
             "action": "hide", 
             "fields": ["nextStep"] 
         }
       ]
    }
  }
}
```

Bu, _nextStep_ alanı varsayılan olarak gizleneceğini ve sahne alanı 'Closed Won' ile aynı ise, gösterileceği anlamına gelmektedir.

Kullanılabilir işlemlerin listesi: `show`, `hide`, `setRequired`, `setNotRequired`.

Panelleri hide/show  özelliği de vardır. `fields` ile aynı şekilde, `panels` içindeki panel adlarını belirtiniz.

