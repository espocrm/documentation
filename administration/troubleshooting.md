# Solución de problemas

## Verificar registros

Para averiguar el problema, debe verificar los archivos de registro de errores.

#### Registros de errores de EspoCRM

Los registros de EspoCRM se encuentran en `<DIROCRM_DIRECTORY>/logs/* Log` y contienen algunos datos de error.

#### Registros de errores de Apache

Para el servidor Ubuntu, un registro de error de apache se encuentra en `/var/log/apache2/error.log` y contiene toda la información de error. La ubicación de los archivos de registro puede ser diferente en otros sistemas.

## Habilitar el modo de depuración

Para habilitar el modo de depuración, vaya al directorio EspoCRM instalado, abra el archivo `data/config.php` y cambie el valor:

```
'logger' => [
    ...
    'level' => 'WARNING',
    ...
]
```
to
```
'logger' => [
    ...
    'level' => 'DEBUG',
    ...
]
```

## Los Trabajos Programados no funcionan

#### Problema #1:: Tu crontab no está configurado

1. Ingresa a través de SSH a tu servidor.

2. Configure su crontab siguiendo estos pasos: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Nota: Crontab debe configurarse en usuario del servidor web, p. `crontab -e -u www-data`.

3. Espere un momento y revise los trabajos programados para ver si se ejecutó alguna tarea (vea un panel de registro).

#### Problema # 2. Crontab está configurado, pero los trabajos programados no funcionan

Para asegurarse de que no haya errores cuando se está ejecutando cron, intente ejecutar el comando cron en una terminal:

1. Ingresa a través de SSH a tu servidor.

2. Configure su crontab siguiendo estos pasos: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Nota: Crontab debe configurarse en usuario del servidor web, p. `crontab -e -u www-data`.

3. Espere un momento y revise los trabajos programados para ver si se ejecutó alguna tarea (vea un panel de registro).

#### Problema # 2. Crontab está configurado, pero los trabajos programados no funcionan

Para asegurarse de que no haya errores cuando se está ejecutando cron, intente ejecutar el comando cron en una terminal:

1. Ingresa a través de SSH a tu servidor.

2. Vaya al directorio donde está instalado EspoCRM. P.ej. para el directorio `/var/www/html/espocrm` el comando es:

```bash
cd /var/www/html/espocrm
```

3. Ejecute el comando crontab:

```bash
php cron.php
```

Nota: debe ejecutarse en usuario del servidor web. Si ha iniciado sesión como root, el comando debería ser (por ejemplo, para Ubuntu):

```bash
sudo -u www-data php cron.php
```

donde `www-data` es un usuario del servidor web.

4. Si no hay errores, revise los trabajos programados para ver si se ejecutó algún trabajo (consulte un panel de registro).

## EspoCRM no se carga después del updgare

Esto puede suceder a veces en algunos alojamientos compartidos.

Verifique los permisos de los archivos:
/index.php
/api/v1/index.php

Deben ser 644. Si alguno de esos archivos tiene permiso 664, debe cambiarlo a 644. Utilice el panel de control de su hosting o el comando chmod.

```
chmod 644 /path/to/file
```
Más información sobre permisos de archivos: [aquí] (server-configuration.md # required-permissions-for-unix-based-systems).
