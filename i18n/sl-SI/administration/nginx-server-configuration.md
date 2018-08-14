# Konfiguracija Nginx strežnika za EspoCRM

Ta navodila dopolnjujejo navodila [Konfiguracija strežnika](server-configuration.md). Upoštevajte, prosimo, da so vse tukaj omenjene nastavitve narejene na Ubuntu strežniku.

## PHP zahteve

Za namestitev vseh potrebnih knjižnic vnesite v terminalu naslednje ukaze:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service nginx restart
```

## Odprava napake “API Error: EspoCRM API is unavailable”:

Naredite samo potrebne korake. Po vsakem koraku preverite, ali je napaka odpravljena.

### 1. Omogočite pravila za prepisovanje (rewrite rules) na Nginx strežniku

Dodajte naslednjo kodo v konfiguracijsko datoteko za Nginx strežniški blok (/etc/nginx/sites-available/YOUR_SITE) znotraj “server” bloka:

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

Če ta datoteka ne obstaja, jo morate ustvariti. To lahko storite tako, da v terminalu zaženete ta ukaz:

```
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/espocrm.conf
```

In dodajte kodo, ki je navedena zgoraj. Za več informacij, kako skonfigurirati nov Virtual Host na Nginx strežniku, prosimo, preberite ta [ navodila](nginx-virtual-host.md).

Zaženite ta ukaz v terminalu, da bi preverili, ali je vse v redu:

```
sudo nginx -t
```

Če je, z naslednjim ukazom ponovno zaženite nginx strežnik:

```
sudo service nginx restart
```

### 2. Dodajte RewriteBase pot

Odprite datoteko /ESPOCRM_DIRECTORY/api/v1/.htaccess in zamenjajte naslednjo vrstico:

```
# RewriteBase /
```
z

```
RewriteBase /REQUEST_URI/api/v1/
```

pri čemer je REQUEST_URI del URL-ja, na primer za “http://example.com/espocrm/” je REQUEST_URI “espocrm”.
