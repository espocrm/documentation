# Apache server configuration for EspoCRM

These instructions are supplementary to the [server configuration](server-configuration.md) guidelines. Note that all configuration settings listed here are made on Ubuntu server.

## PHP requirements

To install all necessary libraries, run these commands in the terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-zip php-imap php-mbstring php-curl php-exif php-ldap
sudo phpenmod imap mbstring
sudo service apache2 restart
```

## Enabling rewrite rules

When you are trying to install EspoCRM via browser, you may encounter *'API Error: EspoCRM API is unavailable'* error.

To fix it, try the following steps **one by one**. After each step check if the issue is solved. If it works, then further steps are not needed.

### 1. Enable *mod_rewrite* support for Apache

To enable *mod_rewrite*, run these commands in a terminal:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. Enable *.htaccess* support

To enable .htaccess support, add/edit the server configuration settings `/etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf` or `/etc/apache2/apache2.conf` (or `/etc/httpd/conf/httpd.conf`):

```
<Directory /PATH_TO_ESPO/>
  AllowOverride All
</Directory>
```

You need to change */PATH_TO_ESPO/* to the full path to your EspoCRM instance, e.g. */var/www/html/*.

Then restart Apache:

```
sudo service apache2 restart
```

### 3. Add RewriteBase path (a last resort, not needed in most cases)

Open the file `/ESPOCRM_DIRECTORY/api/v1/.htaccess` and replace the following line:

```
# RewriteBase /
```

with

```
RewriteBase /REQUEST_URI/api/v1/
```

where *REQUEST_URI* is a part of URL, e.g. for `https://example.com/espocrm/`, REQUEST_URI is *'espocrm'*.


## Enable HTTP AUTHORIZATION support (only for FastCGI)

FastCGI does not support HTTP AUTHORIZATION by default. If you use FastCGI, you have to enable it in your VirtualHost or `/etc/apache2/apache2.conf` (or httpd.conf) by adding the following code:

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

## For EspoCRM v7

On a **production** environment the following configuration is recommended:

* The document root should be set to `/path/to/espo/public/`.
* An alias `/client/` => `/path/to/espo/client/` should be added.

Apache config example:

```
DocumentRoot /path_to_espo/public/
Alias /client/ /path_to_espo/client/

<Directory /var/www/html/>
    AllowOverride None
</Directory>

<Directory /path_to_espo/public/>
    AllowOverride All
</Directory>
```
Note, that `/path_to_espo` should be changed to the absolute path of the EspoCRM instance on your server. It can be `/var/www/html` if you exctracted EspoCRM package to the default Apache root directory.

You need to have *mod_rewrite* enabled. You can do it by running in the terminal:
```
sudo a2enmod rewrite
sudo service apache2 restart
```
