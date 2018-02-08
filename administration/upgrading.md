# Cómo actualizar EspoCRM

EspoCRM se puede actualizar a la última versión mediante los siguientes pasos:

### Paso 1. Verifica tu versión actual

Para verificar su versión actual, vaya a Administración> página Actualizar.

### Paso 2. Descargar los paquetes de actualización necesarios

Vaya a la página de actualización https://www.espocrm.com/download/upgrades/ y de acuerdo con su versión correcta descargue los paquetes necesarios.

### Paso 3. Crear una copia de seguridad (opcional)

Cree una copia de seguridad de sus archivos y datos de EspoCRM antes de la actualización. Siga [estas instrucciones] (https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md) para completarlo.

### Paso 4. Proceso de actualización

Vaya a Administración> Actualizar. Cargue e instale paquetes de actualización uno por uno.

Puede verificar si tiene la última versión en Menú> Acerca de.

## Actualizar a través de CLI

También puede ejecutar la actualización a través de la interfaz de línea de comando. Debe ejecutar el siguiente comando desde el directorio raíz de EspoCRM:

```
php upgrade.php /path/to/upgrade/package.zip
```
