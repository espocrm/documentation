# Paquetes de Extensión

Las extensiones le permiten añadir más funcionalidad a EspoCRM. Estas pueden ser instaladas por el panel del Administrador bajo la sección `Customization`.

## Cómo crear un paquete de extensión

Una estructura de archivo de paquete:

* `/manifest.json` – un archivo que contiene propiedades de extensión;
* `/files` – un directorio que contiene propiedades de extensión;
* `/scripts` – contiene los scripts de extensión.

### Manifiesto
```json
{
 "name": "Extension Name",
 "version": "1.0.0",
 "acceptableVersions": [
   ">=3.7.2"
 ],
 "releaseDate": "2015-10-15",
 "author": "Your Name",
 "description": "Description of your extension",
 "delete": []
}
```

* La sintaxis de la `version` y `acceptableVersions` es descrita por la especificación de v2.0.0 que se puede encontrar en http://semver.org.
* `delete` - es la lista de archivos centrales que necesitan ser borrados. No se recomienda el uso de este parámetro. Los puede omitir.

### Archivos

Todos los archivos de extensión deberían ser colocados en el directorio de `files`. Serán copiados al directorio central de EspoCRM.

### Scripts

Para diferentes propositos EspoCRM respalda los siguientes tipos de script. Todos estos deberían ser colocados en el directorio de `scripts`.

* `BeforeInstall.php` – un script ejecutado antes de un proceso de instalación;
* `AfterInstall.php` – ejecutado una vez que el proceso de instalación finalice;
* `BeforeUninstall.php` – ejecutado antes del proceso de desinstalación;
* `AfterUninstall.php` – ejecutado una vez que el proceso de desinslación finalice.

Ejemplo:

```php
class AfterInstall
{
  public function run($conatiner)
  {
    $config = $conatiner->get('config');
 
    $tabList = $config->get('tabList');
    if (!in_array('My Custom Entity', $tabList)) {
      $tabList[] = 'My Custom Entity';
      $config->set('tabList', $tabList);
    }
 
    $config->save();
  }
}
```

### Paquete

Al final, necesitamos colocar todos estos archivos en un archivo .zip.
