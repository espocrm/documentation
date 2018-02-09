# Mga konpigyurasyon sa Apache nga server para sa EspoCRM

Ang kining mga pag-giya kay pang-puno ra sa [Server Configuration](server-configuration.md) nga mga guideline. Palihug hinumdumi nga ang mga lista sa setting sa kani nga konpigyurasyon kay gihimo sa Ubuntu nga server

## Mga gikinahanglan sa PHP

Para ma install ang tanan gikinahanglan nga mga library, ipadagan ni ang command sa imohang terminal.

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## Pag-ayo sa isyo nga “API Error: EspoCRM API is unavailable”:

Himoa ra ang mga gikinahanglan nga mga lakang. Pagkahuman sa paghimo, susiha og balik kong nasolbad naba an problema.

### 1. E-enable ang suporta sa “mod_rewrite” ni Apache

Para ma tugotan ang "mod_rewrite," ipadagan ni na mga sugo gikan sa terminal:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. E-enable ang .htaccess support

Para ma-enable ang .htaccess support, pun-e o usba ang Server Configuration Settings /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf or /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Pagkahuman, ipadagan ni nga command gikan sa terminal:

```
sudo service apache2 restart
```

### 3. Pun-e ang RewriteBase nga path

Ablihi ang file /ESPOCRM_DIRECTORY/api/v1/.htaccess ug ilisi ang musunod nga linya:

```
# RewriteBase /
```

og

```
RewriteBase /REQUEST_URI/api/v1/
```

kung asa ang REQUEST_URI kay parte sa URL, e.g. for “http://example.com/espocrm/”, REQUEST_URI kay "espocrm".

## E-enable ang HTTP AUTHORIZATION nga suporta (para lang sa FastCGI).

Ang FastCGI kay wala nagsuporta sa HTTP AUTHORIZATION. Kung mugamit ka og FastCGI, gikinahanglan nimo e-enable nimo ni sa imohang VirtualHost o sa /etc/apache2/apache2.conf (httpd.conf) punan sa musunod nga code:

Para sa Fgid nga module:

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

For FastCgi module:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

Para tanawon kong unsa nga module ang gigamit karon, ipadagan ni ang command ug pangitaa ang module:

```
apache2ctl -M
```
