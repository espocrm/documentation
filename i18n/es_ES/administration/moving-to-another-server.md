# Mover EspoCRM a otro servidor

Siga estos pasos para mover EspoCRM a otro servidor:

### Paso 1. Copia de seguridad de archivos

Abra un administrador de archivos o inicie sesión a través de SSH para archivar todos los archivos disponibles desde el directorio de EspoCRM. [Más detalles](backup-and-restore.md#paso-1-respaldar-archivos).

### Paso 2. Haz una copia de seguridad de tu base

Los datos almacenados en la base de datos (MySQL, MariaDB) se deben respaldar. Por favor, siga esta [recomendación](backup-and-restore.md#paso-2-respaldar-base-de-datos).

### Paso 3. Copie los archivos y las copias de seguridad de la base de datos a otro servidor

Copia copias de seguridad de archivos y de tu base de datos a un nuevo servidor.

### Paso 4. Desarchivar archivos de copia de seguridad

Para desarchivar los archivos de copia de seguridad, puede usar Archive Manager o esta [instrucción](backup-and-restore.md#paso-1-desarchivar-archivos-de-copia-de-seguridad).

Nota: Los archivos deben colocarse en el directorio del servidor web.

### Paso 5. Configurar un servidor

Configure un nuevo servidor según las [recomendaciones aquí](server-configuration.md)

### Paso 6. Corregir permisos

Establecer los [permisos](server-configuration.md#permisos-requeridos-para-sistemas-basados-en-unix) requeridos y el propietario de los archivos.

### Paso 7. Importa tu copia de seguridad de la base de datos

Primero, debe crear una nueva base de datos con un usuario en MySQL. Para importar su base de datos desde la copia de seguridad, siga la [instucción](backup-and-restore.md#paso-3-importar-el-volcado-de-la-base-de-datos).

### Paso 8. Corregir las configuraciones de EspoCRM

Después de importar y configurar con éxito el servidor, corrija las configuraciones de EspoCRM en el archivo `ESPOCRM_DIRECTORY/data/config.php`:

 * configuración de conexión de base de datos:

  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'YOUR_DATABASE_NAME',
        'user' => 'YOUR_USER',
        'password' => 'YOUR_DATABASE_PASSWORD',
        'host' => 'localhost',
        'port' => ''
    ],
  ```

   * "siteUrl" - si se cambia su nombre de dominio (URL):

  ```php
  'siteUrl' => 'https://new-link.com',
  ```

  * propietario de archivos predeterminado (solo si es diferente):

  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  donde `www-data` es su usuario del servidor web.

### Paso 9. Configura un crontab

Configura un [crontab](server-configuration.md#configurar-un-crontab).

Nota: debe ser configurado bajo su usuario del servidor web.

Eso es todo. Ahora, su instancia de EspoCRM se está ejecutando en un nuevo servidor.
