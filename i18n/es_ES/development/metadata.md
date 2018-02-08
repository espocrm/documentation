# Metadatos

Los metadatos están destinados a: almacenar datos del sistema como los campos y relaciones de la entidad; especificando controladores de frontend, vistas, paneles; definir campos, dashlets; y otros datos necesarios para la aplicación.


## Cómo accesar

#### Backend

Los metadatos objeto de la clase `Espo \ Core \ Utils \ Metadata` se pueden acceder desde Contenedor. La ruta a un parámetro necesario se especifica usando los puntos `.`.

```php
$metadata->get('entityDefs.Account.fields.name.type')
```
retornará `'varchar'`.

```php
$metadata->get('entityDefs.Account.fields')
```
retornará una matriz asociativa de todos los campos.

#### Frontend

El objeto metadatos es accesible desde todos los objetos de vista por el método `#getMetadata`. Funciona de la misma manera que uno de backend.

```JavaScript
this.getMetadata().get('entityDefs.Account.fields.name.type')
```


## Cómo es almacenado

Los metadatos se almacenan en archivos JSON que pueden ubicarse en diferentes lugares:

* application/Espo/Resources/metadata/
* custom/Espo/Custom/Resources/metadata/
* application/Espo/Modules/{MODULE_NAME}/Resources/metadata/

Cuando accede a los datos por la ruta `clientDefs.Account.views.edit`, el primer lexema `clientDefs` corresponde al nombre de la carpeta, la segunda `Cuenta` al nombre de archivo `Account.json`. Todos los siguientes lexemas corresponden a la ruta en el JSON.
```json
{
  "views": {
    "edit": "crm:views/account/views/edit" 
  }
}
```

Todos los archivos JSON de estos directorios se fusionan recursivamente en una única matriz php y se almacenan en un archivo de caché.


## Extendiendo

Dado que los metadatos se fusionan recursivamente, puede redefinir fácilmente los objetos json y las matrices en _perzonalizar_ y en su _módulo_. También puede agregar a las matrices existentes utilizando `__ADJUNTAR__` (desde la versión 2.6.0) como primer elemento de la matriz.

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
