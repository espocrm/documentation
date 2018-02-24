# Metadata

Ang metadata gituyo alang sa: pagtipig sa datos sa sistema sama sa mga field sa entity ug relasyon; pagtakda sa mga frontend nga controller, mga view, mga panel; pagtino sa mga field, mga dashlet; ug ubang mga datos nga gikinahanglan alang sa aplikasyon.


## Unsaon Pag-access

#### Backend

Ang object sa metadata sa `Espo\Core\Utils\Metadata` nga klase mahimong makuha gikan sa Container. Ang path ngadto sa usa ka gikinahanglan nga parametro gitino gamit ang mga tulbok `.`.

```php
$metadata->get('entityDefs.Account.fields.name.type')
```
will return `'varchar'`.

```php
$metadata->get('entityDefs.Account.fields')
```
mobalik ug usa ka associative array sa tanan nga mga field.

#### Frontend

Ang object sa metadata mahimong makuha gikan sa tanan nga mga view object pinaagi sa `#getMetadata`. Kini mugana sa samang paagi sa backend.

```JavaScript
this.getMetadata().get('entityDefs.Account.fields.name.type')
```


## Giunsa kini pagtipig

Ang metadata gitipigan sa mga file sa JSON nga nahimutang sa lainlaing mga dapit

* application/Espo/Resources/metadata/
* custom/Espo/Custom/Resources/metadata/
* application/Espo/Modules/{MODULE_NAME}/Resources/metadata/

Sa higayon nga ma-access mo ang datos pinaagi sa path `clientDefs.Account.views.edit` ang unang lexeme `clientDefs` mag-uyon sa pangan sa dir, ang ikaduha nga `Account` a pag-file sa ngalan `Account.json`. Ang tanan nga mosunod nga lexemes mag-uyon sa path sa JSON.
```json
{
  "views": {
    "edit": "crm:views/account/views/edit" 
  }
}
```

Ang tanan nga mga JSON nga mga file gikan sa mga directoryo gihiusa sa rekursibo nga pamaagi 
ngadto sa usa ka php array ug gitipigan sa cache file.

## Pag-extend

Sanglit ang metadata gihiusa na sa rekursibo nga pamaagi, dali ra nimu mausab ang mga json object ug mga array sa _custom_ and in your _module_. Mahimo usab nimo ang pagdugang sa mga kasamtangan nga mga arrays pinaagi sa paggamit sa `__APPEND__` (sukad sa bersyon 2.6.0) ingon nga ang una nga elemento sa han-ay.

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
