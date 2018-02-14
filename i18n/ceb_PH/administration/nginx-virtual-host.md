# Pag-konpigyur sa usa ka Virtual Host nga naa sa Nginx para sa EspoCRM

Sa kani nga giya, ipakita namo unsaon pag-konpigyur sa usa ka virtual host nga naa sa Nginx para sa EspoCRM nga naa sa Ubuntu serber.

## Himo og usa ka serber block nga file

Para himoon ni nga file, pag-abli ug terminal ug ipadagan ni nga mga komand:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Karon, ablihi ang kani nga file (/etc/nginx/sites-available/espocrm.conf) ug usba ang code nga gikinahanglang musunod sa format nga giprint sa ubos (ang ubang mga setting kay pwede lahi base sa inyohang konpigurasyon):

```
server {
    listen 80;
    listen [::]:80;
 
    server_name espocrm.lokal; # Ilisi ang espocrm.lokal ngadto sa inyohang domain name
    root /var/www/html/espocrm; # Ispecify inyohang EspoCRM document root
 
    index index.php index.html index.htm;
 
    # SSL konpigurasyon
    #
    # listen 443 ssl;
    # listen [::]:443 ssl;
    # include snippets/snakeoil.conf;    

    # I-specify ang inyohang PHP (php-cgi or php-fpm) basi sa inyohang konpigurasyon
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

## I-enable ang kaning serber block

Himo og usa ka symbolic link:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Ipadagan ni nga komand para tan-awon kong ang tanan kay nigana ra:

```
sudo nginx -t
```

Ug i-restart ang Nginx nga serber:

```
sudo service nginx restart
```

## I-konpigyur ang imohang mga lokal host (opsyonal, para ra sa lokal domain)

Kung nagdugang ka og lokal domain, gikinahanglan nimo i-konpigyur ni sa imohang lokal nga kompyuter (dili sa serber). Para sa Ubuntu, ablihi ang file `/etc/hosts` ug ipuno ang kani nga linya:

```
192.168.1.1 espocrm.lokal  # specify the IP address of your Nginx serber
```

Para sa Windows, sunda kini nga mga [giya](http://support.microsoft.com/kb/923947).
