# Konfiguracija Apache strežnika za EspoCRM

Ta navodila dopolnjujejo navodila [Konfiguracija strežnika](server-configuration.md). Upoštevajte, prosimo, da so vse tukaj omenjene nastavitve narejene na Ubuntu strežniku.

## PHP zahteve

Za namestitev vseh potrebnih knjižnic vnesite v terminalu naslednje ukaze:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## Odprava napake “API Error: EspoCRM API is unavailable”:

Naredite samo potrebne korake. Po vsakem koraku preverite, ali je napaka odpravljena.

### 1. Omogočite “mod_rewrite” podporo v Apache

Da bi omogočili “mod_rewrite”, zaženite v terminalu naslednja ukaza:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. Omogočite podporo za .htaccess

Da bi omogočili podporo za .htaccess, dodajte/uredite nastavitve za konfiguracijo strežnika /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf ali /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Zatem zaženite v terminalu naslednji ukaz:

```
sudo service apache2 restart
```

### 3. Dodajte RewriteBase pot

Odprite datoteko /ESPOCRM_DIRECTORY/api/v1/.htaccess in zamenjajte naslednjo vrstico:

```
# RewriteBase /
```

z

```
RewriteBase /REQUEST_URI/api/v1/
```

pri čemer je REQUEST_URI del URL-ja, na primer za “http://example.com/espocrm/” je REQUEST_URI “espocrm”.


## Omogočite podporo za HTTP AUTHORIZATION (samo za FastCGI).

FastCGI ne podpira HTTP AUTHORIZATION kot privzeto nastavitev. Če uporabljate FastCGI, jo morate omogočiti v datoteki VirtualHost ali /etc/apache2/apache2.conf (httpd.conf), tako da dodate naslednjo kodo:

Za Fcgid modul:

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

Za FastCgi modul:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

Da bi preverili, kateri modul je trenutno v uporabi, zaženite ta ukaz in poiščite ustrezni modul:

```
apache2ctl -M
```
