# Configuration ng Apache server para sa EspoCRM 

Ang mga tagubilin na ito ay pandagdag sa [Server Configuration](server-configuration.md) na guideline. Mangyaring tandaan na lahat ng configuration settings na nakalista dito ay ginawa sa Ubuntu server.

## Mga Requirement sa PHP 

Para i-install ang mga kinakailangang mga library, patakbuhin ang mga command na ito sa isang terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## Pag-ayos sa isyu na "API Error: EspoCRM API is unavailable":

Gawin lamang ang mga kinakailangang hakbang. Pagkatapos ng bawat hakbang, tingnan kung resolba naba ang isyu.

### 1. Paganahin ang "mod_rewrite" support sa Apache

Para paganahin ang "mod-rewrite," patakbuhin ang mga command na ito sa isang terminal: 

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. Paganahin ang .htaccess support

Para paganahain ang .htaccess support, i-add o i-edit ang Server Configuration Settings /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf or /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Pagkatapos nito, patakbuhin and command na ito sa isang terminal: 

```
sudo service apache2 restart
```

### 3. Pagdagdag ng RewriteBase path

Buksan ang file na /ESPOCRM_DIRECTORY/api/v1/.htaccess at palitan ang sumusunod na linya: 

```
# RewriteBase /
```

ng

```
RewriteBase /REQUEST_URI/api/v1/
```

kung saan ang REQUEST_URI ay parte ng URL, e.g. para sa “http://example.com/espocrm/”, ang REQUEST_URI ay "espocrm".

## Paganahin ang HTTP Authorization support (para lamang sa FastCGI)

Ang FastCGI ay hindi sumusuporta ng HTTP AUTHORIZATION batay sa default. Kung gagamitin mo ng FastCGI, kailangan mo itong paganahin sa iyong Virtualhost or /etc/apache2/apache2.conf (httpd.conf) sa pamamagitan ng pagdagdag ng mga sumusunod na code:

Para sa Fcgid module: 

```
<IfModule mod_fcgid.c>
  FcgidPassHeader Authorization
  FcgidPassHeader Proxy-Authorization
  FcgidPassHeader HTTP_AUTHORIZATION  
</IfModule>
```

Para sa FastCgi module:

```
<IfModule mod_fastcgi.c>
   FastCgiConfig -pass-header Authorization \
                        -pass-header Proxy-Authorization \
                        -pass-header HTTP_AUTHORIZATION  
</IfModule>
```

Upang suriin kung aling module ang kasalukuyang ginagamit, patakbuhin ang command na ito at hanapin ang module:

```
apache2ctl -M
```