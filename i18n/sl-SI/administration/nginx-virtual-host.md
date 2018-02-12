# Kako skonfigurirati Virtual Host na Nginx strežniku za EspoCRM

V tem priročniku bomo pokazali, kako skonfigurirati virtual host na Nginx-u za EspoCRM na Ubuntu strežniku.

## Ustvarite datoteko s strežniškim blokom

Da bi ustvarili to datoteko, v terminalu zaženite naslednji ukaz:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Sedaj odprite to datoteko (/etc/nginx/sites-available/espocrm.conf) in spremenite kodo, da bo ustrezala spodnjemu formatu (nekatere nastavitve bodo morda drugačne, odvisno od vaše konfiguracije):

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

## Omogočite ta strežniški blok

Ustvarite simbolično povezavo:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Zaženite ta ukaz, da bi preverili, ali je vse v redu:

```
sudo nginx -t
```

In ponovno zaženite Nginx strežnik:

```
sudo service nginx restart
```

## Skonfigurirajte "local hosts" (kot opcija, samo v primeru lokalne domene)

Če ste dodali lokalno domeno, jo morate skonfigurirati na svojem računalniku (ne na strežniku). Za Ubuntu odprite datoteko `/etc/hosts` in dodajte vrstico:

```
192.168.1.1 espocrm.local  # specify the IP address of your Nginx server
```

Za Windows, prosimo, upoštevajte ta [navodila](http://support.microsoft.com/kb/923947).
