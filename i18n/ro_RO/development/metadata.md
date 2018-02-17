# Metadate

Metadatele sunt pentru: stocarea datelor sistemului cum ar fi câmpurile entității și relațiile; specificați controalele frontend, vizualizări, panouri; definirea câmpurilor, dashlets; și alte date necesare pentru aplicație.


## Cum se pot accesa

#### Backend

Obiectul metadatelor din clasa `Espo\Core\Utils\Metadata` poate fi accesat din Container. Calea către un parametru necesar este specificată folosind puncte `.`.

```php
$metadata->get('entityDefs.Account.fields.name.type')
```
will return `'varchar'`.

```php
$metadata->get('entityDefs.Account.fields')
```
will return an associative array of all fields.

#### Frontend

Obiectul metadatelor este accesibil din toate obiectele prin metoda `#getMetadata`. Merge la fel ca cel din backend.

```JavaScript
this.getMetadata().get('entityDefs.Account.fields.name.type')
```


## Cum este stocat

Metadatele sunt stocate în fișierul JSON care poate fi plasat în locuri diferite:

* application/Espo/Resources/metadata/
* custom/Espo/Custom/Resources/metadata/
* application/Espo/Modules/{MODULE_NAME}/Resources/metadata/

Când accesați datele din calea `clientDefs.Account.views.edit` primul lexeme `clientDefs` corespunde dir name, al doilea `Account` în numele fișierului `Account.json`. Toate urmând corespondentele lexemes în calea JSON.
```json
{
  "views": {
    "edit": "crm:views/account/views/edit" 
  }
}
```

Toate fișierele JSON din aceste directoare sunt unite recusiv într-un array php și stocate în fișierul cache.


## Extindere

Deoarece metadatele sunt unite recursiv prin redefinire obiectelor json și arrays in _custom_ and in your _module_. De asemenea, poți a you can adăuga în array deja existente folosind `__APPEND__` (since version 2.6.0) ca primul element din array.

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
