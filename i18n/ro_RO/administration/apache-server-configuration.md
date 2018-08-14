# Configurările server-ului Apache pentru EspoCRM

Aceste instrucțiuni sunt suplimentare la ghidul [Configurare Server] (server-configuration.md). Rețineți că toate setările configurațiilor listate aici, sunt făcute pe server-ul Ubuntu.

## Cerințe PHP 

Pentru a instala toate librăriile necesare, rulează aceste comenzi în terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## Repararea problemei “API Error: EspoCRM API is unavailable”: 

Efectuează doar pașii necesari. După fiecare pas, verifică dacă a fost rezolvată problema.

### 1. Activează suportul “mod_rewrite” în Apache

Pentru a activa “mod_rewrite,” rulează aceste comenzi într-un terminal:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. Activează suportul .htaccess

Pentru a activa suportul .htaccess, adaugă/editează Setările de Configurare ale Serverului /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf sau /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Apoi, rulează această comandă într-un terminal:

```
sudo service apache2 restart
```

### 3. Adaugă calea RewriteBase

Deschide un fișier /ESPOCRM_DIRECTORY/api/v1/.htaccess și înlocuiește următoarea linie:

```
# RewriteBase /
```

cu

```
RewriteBase /REQUEST_URI/api/v1/
```

unde REQUEST_URI face parte din URL, ex. pentru “http://example.com/espocrm/”, REQUEST_URI este “espocrm”.


## Activează suport pentru Autorizația HTTP (numai pentru FastCGI).

FastCGI nu acceptă Autorizația HTTP implicit. Dacă folosești FastCGI, trebuie să activezi în VirtualHost sau /etc/apache2/apache2.conf (httpd.conf) prin adăugarea următorului cod:

Pentru modul Fcgid:

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

Pentru modul FastCgi:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

Pentru a verifica care modul este folosit în momentul actual, rulează această comandă pentru a găsi modulul:

```
apache2ctl -M
```
