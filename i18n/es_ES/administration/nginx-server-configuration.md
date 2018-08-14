# Configuración del servidor Nginx para EspoCRM

Estas instrucciones son suplementarias a la guía [Server Configuration] (server-configuration.md). Tenga en cuenta que todos los ajustes de configuración enumerados aquí se realizan en el servidor de Ubuntu.

## Requisitos de PHP

Para instalar todas las librerias necesarias, ejecute estos comandos en una terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## Solucionando el problema "Error de la API: la API de EspoCRM no está disponible":

Tome solo los pasos necesarios. Después de cada paso, compruebe si el problema está resuelto.

### 1. Habilitar reglas de reescritura en el servidor Nginx

Agregue este código a su archivo de configuración de bloque de servidor Nginx (/etc/nginx/sites-available/TU_SITIO) dentro del bloque "servidor":

```
server {   
    # ...
    
    client_max_body_size 50M;
    
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }
 
    location /api/v1/ {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/index.php last; break;
        }
    }
    
    location /portal/ {
        try_files $uri $uri/ /portal/index.php?$query_string;
    }

    location /api/v1/portal-access {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/portal-access/index.php last; break;
        }
    }
 
    location ~ /reset/?$ {
        try_files /reset.html =404;
    }
 
    location ^~ (data|api)/ {
        if (-e $request_filename){
            return 403;
        }
    }
    location ^~ /data/logs/ {
        deny all;
    }
    location ^~ /data/\.backup/ {
        deny all;
    }
    location ^~ /data/config.php {
        deny all;
    }
    location ^~ /data/cache/ {
        deny all;
    }
    location ^~ /data/upload/ {
        deny all;
    }
    location ^~ /application/ {
        deny all;
    }
    location ^~ /custom/ {
        deny all;
    }
    location ^~ /vendor/ {
        deny all;
    }
    location ~ /\.ht {
        deny all;
    }
}
```

Si no tiene este archivo, debe crearlo. Para esto abra una terminal y ejecute el comando:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Y agregue el código enumerado arriba. Para obtener más información sobre cómo configurar un nuevo host virtual en Nginx, lea esta [guía](nginx-virtual-host.md).

Ejecute este comando en una terminal para verificar si todo está bien:

```
sudo nginx -t
```

Si es así, ejecute el comando para reiniciar el servidor nginx:

```
sudo service nginx restart
```

### 2. Agregue la ruta RewriteBase

Abra un archivo /ESPOCRM_DIRECTORY/api/v1/.htaccess y reemplace la siguiente línea:

```
# RewriteBase /
```
con 

```
RewriteBase /REQUEST_URI/api/v1/
```

donde REQUEST_URI es parte de la URL, p. para "http://example.com/espocrm/", REQUEST_URI es "espocrm".
