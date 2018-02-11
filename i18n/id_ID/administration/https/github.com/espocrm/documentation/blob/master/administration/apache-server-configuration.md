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
