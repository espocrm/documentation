# Apache server configuration for EspoCRM

These instructions are supplementary to the [Server Configuration](server-configuration.md) guideline. Please note that all configuration settings listed here are made on Ubuntu server.

## PHP requirements

To install all necessary libraries, run these commands in a terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-mcrypt php-zip php-imap php-mbstring php-curl
sudo phpenmod mcrypt imap mbstring
sudo service apache2 restart
```

## Fixing the issue “API Error: EspoCRM API is unavailable”:

Take only necessary steps. After each step check if the issue is solved.

### 1. Enable “mod_rewrite” support in Apache

To enable “mod_rewrite,” run these commands in a terminal:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. Enable .htaccess support

To enable .htaccess support, add/edit the Server Configuration Settings /etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf or /etc/apache2/apache2.conf (/etc/httpd/conf/httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Afterward, run this command in a terminal:

```
sudo service apache2 restart
```

### 3. Add RewriteBase path

Open a file /ESPOCRM_DIRECTORY/api/v1/.htaccess and replace the following line:

```
# RewriteBase /
```

with

```
RewriteBase /REQUEST_URI/api/v1/
```

where REQUEST_URI is a part of URL, e.g. for “http://example.com/espocrm/”, REQUEST_URI is “espocrm”.


## Enable HTTP AUTHORIZATION support (only for FastCGI).

FastCGI does not support HTTP AUTHORIZATION by default. If you use FastCGI, you have to enable it in your VirtualHost or /etc/apache2/apache2.conf (httpd.conf) by adding the following code:

For Fcgid module:

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

To check which module is currently being used, run this command and find the module:

```
apache2ctl -M
```
