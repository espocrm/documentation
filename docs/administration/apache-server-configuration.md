# Apache server configuration for EspoCRM

These instructions are supplementary to the [server configuration](server-configuration.md) guidelines. Note that all configuration settings listed here are made on Ubuntu server.

## PHP requirements

To install all necessary libraries, run these commands in the terminal:

```
sudo apt-get update
sudo apt-get install php-mysql php-json php-gd php-zip php-imap php-mbstring php-curl php-exif php-ldap php-xml
sudo phpenmod imap mbstring
sudo service apache2 restart
```

## Server configuration

On a **production** environment the following configuration is recommended:

* The document root should be set to `/path_to_espo/public/`.
* An alias `/client/` => `/path_to_espo/client/` should be added.

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

Note that `/path_to_espo` should be changed to the absolute path of the EspoCRM instance on your server. It can be `/var/www/html` if you extracted EspoCRM package to the default Apache root directory.

The location of the Apache config is usually `/etc/apache2/apache2.conf` (on Ubuntu) but can be different.

You need to have **mod_rewrite** enabled. You can do it by running in the terminal:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

For **non-production environment** you can just set `AllowOverride All` for the root directory. Then the `.htaccess` file in the root directory will handle all rewrite rules.

## Enabling rewrite rules

EspoCRM requires *mod_rewrite* being enabled in Apache. W/o it you may encounter *'API Error: EspoCRM API is unavailable'* error during installation or see an information page prompting to configure your webserver.

To fix it, try the following steps **one by one**. After each step check if the issue is solved. If it works, then further steps are not needed.

### 1. Enable *mod_rewrite* support for Apache

To enable *mod_rewrite*, run these commands in a terminal:

```
sudo a2enmod rewrite
sudo service apache2 restart
```

### 2. Enable *.htaccess* support

To enable .htaccess support, add or edit the server configuration file. It can be:

* `/etc/apache2/apache2.conf` 
* `/etc/httpd/conf/httpd.conf`
* `/etc/apache2/sites-available/ESPO_VIRTUAL_HOST.conf`

Add the following code:

```
<Directory /PATH_TO_ESPO/>
  AllowOverride All
</Directory>
```

You need to change `/PATH_TO_ESPO/` to the full path to your EspoCRM instance. It can be `/var/www/html/`.

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

