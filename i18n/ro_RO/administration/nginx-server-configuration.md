# Configurări server Nginx pentru EspoCRM

Aceste instrucțiuni sunt suplimentare la ghidul de  [Configurare Server](server-configuration.md). Reținețică toate setările de configurare listate aici sunt făcute pe server Ubuntu.

## Cerințe PHP

Pentru a instala librăriile necesare, rulează aceste comenzi într-un terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## Repararea problemei “API Error: EspoCRM API is unavailable”:

Urmează doar pașii necesari. După fiecare pas, verifică dacă a fost rezolvată problema.

### 1. Activează regulile de rescriere din serverul Nginx

Adaugă acest cod în fișierul block de configurarea al serverului Nginx (/etc/nginx/sites-available/YOUR_SITE) în interiorul block “server”:

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

Dacă nu ai acest fișier, trebui să îl creezi. Pentru a face asta, deschide un terminal și rulează comanda:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

Adaugă codul de mai sus. Pentru mai multe informații despre configurarea unei boi Gazde Virtuale pe Nginx, vă rugăm citiți [ guideline](nginx-virtual-host.md).

Rulează această comandă într-un terminal pentru a verifica dacă totul este în regulă:

```
sudo nginx -t
```

Dacă totul este în regulă, ruleză această comandă pentru a restarta serverul nginx:

```
sudo service nginx restart
```

### 2. Adaugă calea RewriteBase

Deschide un fișier /ESPOCRM_DIRECTORY/api/v1/.htaccess și înlocuiește următoarea linie:

```
# RewriteBase /
```
cu

```
RewriteBase /REQUEST_URI/api/v1/
```

unde REQUEST_URI face parte din URL, ex. pentru “http://example.com/espocrm/”, REQUEST_URI este “espocrm”.
