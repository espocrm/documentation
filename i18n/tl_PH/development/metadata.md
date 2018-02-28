# Ang Metadata

Ang metadata ay para sa: pagtatago ng system data gaya ng mga field ng entity at mga kaugnayan; pagtukoy ng mga frontend controller, view, panel; pagtakda ng mga field, dashlet; at iba pang mga datos na kinakailangan para sa applikasyon.


## Kung Paano Ma-access

#### Backend

Ang object ng metadata ng `Espo\Core\Utils\Metadata` na klase ay maaaring ma-access mula sa lalagyan. Ang path sa isang kinakailangang parametro ay tinutukoy gamit ang mga tuldok `.`.

```php
$metadata->get('entityDefs.Account.fields.name.type')
```
will return `'varchar'`.

```php
$metadata->get('entityDefs.Account.fields')
```
will return an associative array of all fields.

#### Frontend

Ang object ng metadata ay naa-access mula sa lahat ng mga view object sa pamamagitan ng pamamaraan ng `#getMetadata`. Ito ay gumagana sa parehong paraan ng backend.

```JavaScript
this.getMetadata().get('entityDefs.Account.fields.name.type')
```


## Paano ito Tinatago

Ang metadata ay tinatago sa mga file ng JSON na matatagpuan sa iba't ibang lugar:

* application/Espo/Resources/metadata/
* custom/Espo/Custom/Resources/metadata/
* application/Espo/Modules/{MODULE_NAME}/Resources/metadata/

Kapag na-access mo ang data sa pamamagitan ng path na `clientDefs.Account.views.edit` ang unang lexeme `clientDefs` ay tumutugon sa pangalan ng dir, ang pangalawa sa `Account` sa pangalan ng file na `Account.json`. Ang lahat ng sumusunod na mga lexeme ay tumutugon sa path sa JSON.
```json
{
  "views": {
    "edit": "crm:views/account/views/edit" 
  }
}
```

Ang lahat ng JSON file mula sa mga direktoryo na ito ay pinag-samasama sa rekursibong pamamaraan sa isang solong php array at nakatago sa isang cache file 


## Pagpapalawig

Pagkat ang metadata ay pinag-samasama sa rekursibong pamamaraan maaari mong madaling tukuyin muli ang mga json object at array sa _custom_ at sa iyong _module_. Gayundin maaari kang magdagdag sa mga kasalukuyang array sa pamamagitan ng paggamit ng `__APPEND__` (mula bersyon 2.6.0) bilang unang elemento ng array.

`custom/Espo/Custom/Resources/Metadata/entityDefs/Account.json`

```json
{
  "fields": {
    "employeeCount": {
      "type": "int"
    },
    "type": {
      "options": ["__APPEND__", "Drug dealer", "Lawyer"]
    }
  }
}
```
