# Configurar un host virtual en Nginx para EspoCRM

En esta guía mostraremos cómo configurar un host virtual en Nginx para EspoCRM en el servidor de Ubuntu.

## Crear un archivo de bloque de servidor

Para crear este archivo, abra un terminal y ejecute el comando:

```
sudo cp /etc/nginx/sites-available/default/etc/nginx/sites-available/espocrm.conf
```

Ahora, abra este archivo (/etc/nginx/sites-available/espocrm.conf) y modifique el código siguiendo el formato impreso a continuación (algunas configuraciones pueden ser diferentes en función de su configuración):

```
server {
    listen 80;
    listen [::]:80;
 
    server_name espocrm.local; # Replace espocrm.local to your domain name
    root /var/www/html/espocrm; # Specify your EspoCRM document root
 
    index index.php index.html index.htm;
 
    # SSL configuration
    #
    # listen 443 ssl;
    # listen [::]:443 ssl;
    # include snippets/snakeoil.conf;    
 
    # Specify your PHP (php-cgi or php-fpm) based on your configuration
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
 
        # With php7.0-cgi alone:
        # fastcgi_pass 127.0.0.1:9000;
 
        # With php7.0-fpm:
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }    
 
    # Add rewrite rules
    location / {
        try_files $uri $uri/ =404;
    }
 
    location /api/v1/ {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/index.php last; break;
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

## Habilita este bloque de servidor

Crea un enlace simbólico:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Run this command to check if everything is fine:

```
sudo nginx -t
```

And restart Nginx server:

```
sudo service nginx restart
```

## Configure sus hosts locales (opcional, solo para un dominio local)

Si agregó un dominio local, debe configurarlo en su computadora local (no en el servidor). Para Ubuntu, abra el archivo `/ etc/hosts` y agregue la línea:

```
192.168.1.1 espocrm.local  # especifique la dirección IP de su servidor Nginx
```

Para Windows, siga estas [instrucciones](http://support.microsoft.com/kb/923947).
