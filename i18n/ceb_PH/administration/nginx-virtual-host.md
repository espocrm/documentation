# Pag-configure sa usa ka Virtual Host nga naa sa Nginx para sa EspoCRM

Sa kani nga giya, ipakita namo unsaon pag-configure sa usa ka virtual host nga naa sa Nginx para sa EspoCRM nga naa sa Ubuntu server.

## Himo og usa ka server block file

Para himoon ni nga file, pag-abli ug terminal ug ipadagan ni nga mga command:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Karon, ablihi ang kani nga file (/etc/nginx/sites-available/espocrm.conf) ug usba ang code nga gikinahanglang musunod sa format nga giprint sa ubos (ang ubang mga setting kay pwede lahi base sa inyohang configuration):

```
server {
    listen 80;
    listen [::]:80;
 
    server_name espocrm.local; # Ilisi ang espocrm.local ngadto sa inyohang domain name
    root /var/www/html/espocrm; # Ispecify inyohang EspoCRM document root
 
    index index.php index.html index.htm;
 
    # SSL configuration
    #
    # listen 443 ssl;
    # listen [::]:443 ssl;
    # include snippets/snakeoil.conf;    

    # I-specify ang inyohang PHP (php-cgi or php-fpm) basi sa inyohang configuration
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
 
        # With php7.0-cgi alone:
        # fastcgi_pass 127.0.0.1:9000;
 
        # With php7.0-fpm:
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }    
 
    # Puno og rewrite nga mga rule
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

## I-enable ang kaning server block

Himo og usa ka symbolic link:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Ipadagan ni nga command para tan-awon kong ang tanan kay nigana ra:

```
sudo nginx -t
```

Ug i-restart ang Nginx nga server:

```
sudo service nginx restart
```

## I-configure ang imohang mga local host (opsyonal, para ra sa local domain)

Kung nagdugang ka og local domain, gikinahanglan nimo i-configure ni sa imohang local nga computer (dili sa server). Para sa Ubuntu, ablihi ang file `/etc/hosts` ug ipuno ang kani nga linya:

```
192.168.1.1 espocrm.local  # specify the IP address of your Nginx server
```

Para sa Windows, sunda kini nga mga [instruction](http://support.microsoft.com/kb/923947).
