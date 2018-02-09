# Configuración del Servidor para EspoCRM

EspoCRM se puede instalar en Apache ([instrucciones](apache-server-configuration.md)), Nginx ([instrucciones](nginx-server-configuration.md)), o servidor IIS con compatibilidad con PHP versión 5.6 o posterior y MySQL versión 5.1 o superior.

## Recomendaciones de Configuración

### Requisitos de PHP

EspoCRM requiere PHP 5.6 o superior, con las siguientes extensiones habilitadas:

* [PDO](http://php.net/manual/en/book.pdo.php) – para acceder a MySQL en PHP;
* [JSON](http://php.net/manual/en/book.json.php) – los recursos usan este formato (metadatos, diseño, idiomas y otros);
* [GD](http://php.net/manual/en/book.image.php) – para manipular imágenes;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – para garantizar la mayor protección;
* [Zip](http://php.net/manual/en/book.zip.php) – para poder actualizar EspoCRM e instalar extensiones;
* [IMAP](http://php.net/manual/en/book.imap.php) – para monitorear buzones de correo en EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

También se recomienda tener instalada la extensión pecl [mailparse](https://pecl.php.net/package/mailparse). Es necesario para el funcionamiento sin problemas de la función de búsqueda de correo electrónico.

configuración de php.ini:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### Requerimientos de MySQL

EspoCRM es compatible con MySQL versión 5.1 o superior.
Estas no son peculiaridades especiales. Todas las configuraciones predeterminadas son buenas para EspoCRM.

## Permisos Requeridos para Sistemas basados en Unix

Los archivos y directorios deben tener los siguientes permisos:

* `/data`, `/custom`, `/client/custom` - deben poderse escribir todos los archivos, directorios y subdirectorios (664 para archivos, 775 para directorios, incluidos todos los subdirectorios y archivos);
* `/application/Espo/Modules`, `/client/modules` - debería poder escribirse el directorio actual (775 para el directorio actual, 644 para archivos, 755 para directorios y subdirectorios);
* Todos los demás archivos y directorios deben ser legibles (644 para archivos, 755 para directorios).

Para establecer los permisos, ejecuta estos comandos en la terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

Todos los archivos deben ser de propiedad y propiedad del grupo por el proceso del servidor web. Puede ser "www-data", "daemon", "apache", "www", etc.  
Nota: En Bitnami Stack, los archivos deben ser de propiedad y propiedad del grupo por el usuario "daemon".
Nota: en los hosts compartidos, los archivos deben ser de propiedad y propiedad del grupo de suu cuenta de usuario.

Para configurar el propietario y el propietario del grupo, ejecuta estos comandos en la terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## Configurar un crontab

Para configurar un crontab en un sistema UNIX, siga estos pasos:

* 1. Inicie sesión como administrador en su instancia de EspoCRM.
* 2. Vaya a la sección de Trabajos Programados en el panel del administrador (Menú > Administración > Trabajos Programados) y copie la cadena para el crontab. Se ve como esta:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. Abra una terminal y ejecute este comando:
```
crontab -e -u WEBSERVER_USER
```
WEBSERVER_USER puede ser uno de los siguientes "www", "www-data", "apache", etc. (depende de su servidor web).
* 4. Pegue la cadena copiada (desde el paso 2) y guarde el archivo crontab (Ctrl + O, luego Ctrl + X para el editor nano).

## Instrucciones de configuración basadas en su servidor:

* [Configuración del servidor Apache](apache-server-configuration.md).
* [Configuración del servidor Nginx](nginx-server-configuration.md).
