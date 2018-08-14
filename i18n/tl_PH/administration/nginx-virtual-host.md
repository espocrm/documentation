# Ang pag-konpigyura ng isang Virtual Host sa Nginx para sa EspoCRM

Sa guide na ito, ipapakita namin kung paano i-konpigyura ang isang virtual na host sa Nginx para sa EspoCRM sa Ubuntu serber.

## Lumikha ng isang serber block file

Upang likhain ang file na ito, buksan ang isang terminal at patakbuhin ang command:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Ngayon ay buksan ang file na ito (/etc/nginx/sites-available/espocrm.conf) at baguhin ang code na sumusunod sa format na nakasulat sa ibaba (some settings may be different based on your configuration):

```
serber {
    listen 80;
    listen [::]:80;
 
    serber_name espocrm.local; # Palitan ang espocrm.local ng pangalan ng iyong domain
    root /var/www/html/espocrm; # Tukuyin ang iyong EspoCRM document root
 
    index index.php index.html index.htm;
 
    # configuration ng SSL
    #
    # listen 443 ssl;
    # listen [::]:443 ssl;
    # isama ang mga snippet/snakeoil.conf;    
 
    # Tukuyin ang iyong PHP (php-cgi or php-fpm) batay sa iyong configuration
    lokasyon ~ \.php$ {
        isama ang mga snippet/fastcgi-php.conf;
 
        # Kasama ang php7.0-cgi lamang:
        # fastcgi_pass 127.0.0.1:9000;
 
        # Kasama ang php7.0-fpm:
        fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    }    
 
    # Idagdag ang mga patakaran ng rewrite
    lokasyon / {
        try_files $uri $uri/ =404;
    }
 
    lokasyon /api/v1/ {
        if (!-e $request_filename){
            rewrite ^/api/v1/(.*)$ /api/v1/index.php last; break;
        }
    }
 
    lokasyon ~ /reset/?$ {
        try_files /reset.html =404;
    }
 
    lokasyon ^~ (data|api)/ {
        if (-e $request_filename){
            return 403;
        }
    }
    lokasyon ^~ /data/logs/ {
        deny all;
    }
    lokasyon ^~ /data/\.backup/ {
        deny all;
    }
    lokasyon ^~ /data/config.php {
        deny all;
    }
    lokasyon ^~ /data/cache/ {
        deny all;
    }
    lokasyon ^~ /data/upload/ {
        deny all;
    }
    lokasyon ^~ /application/ {
        deny all;
    }
    lokasyon ^~ /custom/ {
        deny all;
    }
    lokasyon ^~ /vendor/ {
        deny all;
    }
    lokasyon ~ /\.ht {
        deny all;
    }
}
```

## I-enable ang server block

Lumikha ng isang symbolic na link:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Patakbuhin ang command na ito para isigurado kung lahat ay maayos:

```
sudo nginx -t
```

At i-restart ang Nginx server:

```
sudo service nginx restart
```

## I-konpigyura ang iyong mga local host (opsyonal, para sa isang lokal na domain lamang)

Kung nagdagdag ka ng isang lokal na domain, kailangan mong itong i-konpigyura sa iyong lokal na kompyuter (hindi sa iyong serber). Para sa Ubuntu, buksan ang file na `/etc/hosts` at idagdag ang linya na:

```
192.168.1.1 espocrm.local  # tukuyin ang IP address ng iyong Nginx server
```

Para sa windows, mangyaring sunding ang ito [mga instruksyon](http://support.microsoft.com/kb/923947).
