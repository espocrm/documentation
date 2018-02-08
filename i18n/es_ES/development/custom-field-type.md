# Creando un Campo Personalizado de Tipo

## Definición de Campo

Cree un archivo `/custom/Espo/Custom/Resources/metadata/fields/{field-type}.json` con parametros necesitados.
```
{
   "view": "custom:views/fields/{field-type}"`
}
```

Utilice tipos de campo particulares como ejemplo: `/application/Espo/Resources/metadata/fields`.

`/application/Espo/Resources/metadata/fields`.

### Traducción

La etiqueta se utiliza en el Administrador de Entidad. Puede ser configurada en `custom/Espo/Custom/Resources/i18n/en_US/Admin.json` en la sección `fieldTypes`. Si necesita añadir traducciones a otro idioma, utilice [código de lenguaje](https://en.wikipedia.org/wiki/ISO_639-1)_[código de país](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) en lugar de `en_US`. En `data/config.php` en la sección `languageList` puede encontrar la lista de los lenguajes incluídos.

### Visualización

Cree la visualización para el campo `client/custom/src/views/fields/{field-type}.js` y defina sus plantillas
```
Espo.define('custom:views/fields/[field-type]', 'views/fields/base', function (Dep) {
    
    return Dep.extend({
        
    });
});
```

Utilice tipos de campo particulares como ejemplo
- `/client/src/views/fields` - visualizaciones;
- `/client/res/templates/fields` - plantillass.

Luego necesita ejecutar reconstrucción en el panel de administración.
