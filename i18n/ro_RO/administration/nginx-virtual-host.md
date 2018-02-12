# Configurarea unei Gazde Virtuale pe Nginx pentru EspoCRM

În acest ghid vei putea să vezi cum se configurează gazda vitruală pe Nginx în EspoCRM pe server Ubuntu.

## Creează un fișier block

Pentru a creea acest fișier, deschide un terminal și rulează această comandă:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Acum, deschide acest fișier (/etc/nginx/sites-available/espocrm.conf) și modifică codul, urmând formatul de mai jos (unele setări ar putea fi diferite, în funcție de configurările tale):

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

## Activează acest block server

Creează un link simbolic:

```
sudo ln -s /etc/nginx/sites-available/espocrm.conf /etc/nginx/sites-enabled/
````

Rulează această comandă pentru a vedea dacă totul este în regulă:

```
sudo nginx -t
```

Restartează serverul Nginx:

```
sudo service nginx restart
```

## Configurează gazda locală (opțional, doar pentru un domeniu local)

Dacă ai adăugat un domeniu local, trebuie să îl configurezi pe computerul local (nu pe server). Pentru Ubuntu, deschide acest fișier `/etc/hosts` și adaugă această linie:

```
192.168.1.1 espocrm.local  # specifică adresa IP a serverului Nginx al tau
```

Pantru Windows, urmați aceste [instrucțiuni](http://support.microsoft.com/kb/923947).
