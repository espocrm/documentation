# Respaldar y Restaurar

## Como respaldar EspoCRM manualmente

EspoCRM consiste en archivos y datos de bases de datos. Todos estos datos son necesarios para crear una copia de seguridad completa de EspoCRM. Aquí hay instrucciones sobre cómo hacerlo en el servidor Ubuntu con MySQL.

### Paso 1. Respaldar archivos

Cree un archivo del contenido del directorio de EspoCRM instalado. Para Ubuntu, la ruta predeterminada es `/var/www/html`. Puedes usar este comando:
```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Paso 2. respaldar base de datos

Para hacer una copia de seguridad de todos sus datos, debe conocer el nombre de la base de datos y las credenciales de acceso. Puede encontrar el nombre de la base de datos en el archivo de configuración `/ESPOCRM_DIRECTORY/data/config.php` en la sección `base de datos`. Puede usar este comando para hacer una copia de seguridad de su base de datos:

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### Paso 3. Copiar el Respaldo

Esto es todo. Ahora, tu tienes que copiar el respaldo creado en un sitio seguro.


## Como respaldar EspoCRM con un script

Puedes usar un script para respaldar todos los datos necesarios. Inicia sesión via SSH y ejecute los comandos (probados en un servidor Ubuntu).

### Descargar el script

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Ejecutar el script

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
donde
 * `PATH_TO_ESPOCRM` es la direccion del directorio de instalacion de EspoCRM.
 * `BACKUP_PATH` es la direccion al directorio del respaldo.

Para el servidor Ubuntu es:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Nota: Si su usuario de MySQL no tiene los derechos necesarios para volcar su base de datos, se le pedirá que ingrese las credenciales de otro usuario de MySQL.

Despues de una creacion exisota, obtendrá una ruta a la copia de seguridad creada.

## Restaurar EspoCRM desde un respaldo

Puede restaurar EspoCRM desde la copia de seguridad creada como se describe arriba.

### Paso 1. Desarchivar archivos de copia de seguridad

Para desarchivar archivos, puede usar Archive Manager o ejecutar el siguiente comando. Los archivos deben colocarse en el directorio del servidor web.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
donde:
 * `/var/www/html` es el directorio del servidor web.

### Paso 2. Establecer los permisos requeridos

Los archivos deben ser propiedad de un usuario del servidor web y tener los permisos correctos. Por favor, configure los permisos requeridos siguiendo estas [instrucciones](server-configuration.md/#user-content-required-permissions-for-unix-based-systems).

### Paso 3. Importar el volcado de la base de datos

El volcado de la base de datos se debe importar a la misma base de datos con las mismas credenciales de usuario; de lo contrario, la corrección se debe realizar en el archivo de configuración `ESPOCRM_DIRECTORY/data/config.php`. Para importar su base de datos desde el volcado, ejecute el siguiente comando en una terminal:
```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### Paso 4. Verificar/configurar crontab

Compruebe si su crontab está configurado correctamente. Ejecute el siguiente comando y compruebe si una ruta a EspoCRM es correcta:

```bash
sudo crontab -l -u www-data
```
Donde:
 * `www-data` es tu usuario del servidor web.

Si tiene que hacer algún cambio, use este comando:

```bash
sudo crontab -l -u www-data
```

Aquí se describen más detalles sobre la configuración de [crontab](server-configuration.md/#user-content-setup-a-crontab) para EspoCRM.
