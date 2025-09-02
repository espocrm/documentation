# Server Configuration for EspoCRM

EspoCRM can be installed on:

* Webserver
  * [Apache](apache-server-configuration.md)
  * [Nginx](nginx-server-configuration.md)
  * [IIS](iis-server-configuration.md)
* PHP 8.2 - 8.4
* Database
  * MySQL 8.0 - 8.4
  * MariaDB 10.3 and greater
  * PostgreSQL 15

In this article:

* [Recommendations & requirements](#recommendations-requirements)
* [Required permissions for Unix-based systems](#required-permissions-for-unix-based-systems)
* [Setting up crontab](#setting-up-crontab)
* [Configuration instructions based on your server](#configuration-instructions-for-specific-web-servers)
* [See also](#see-also)


## Recommendations & requirements

### PHP requirements

EspoCRM requires PHP with the following extensions:

* [pdo_mysql](https://php.net/manual/en/book.pdo.php) – for database access;
* [gd](https://php.net/manual/en/book.image.php) (with enabled FreeType support) – to manipulate images and render avatars;
* [openssl](https://php.net/manual/en/book.openssl.php) – to ensure the highest protection;
* [zip](https://php.net/manual/en/book.zip.php) – to be able to upgrade EspoCRM and install extensions;
* [mbstring](https://php.net/manual/en/book.mbstring.php);
* [iconv](https://php.net/manual/en/book.iconv.php);
* [curl](https://php.net/manual/en/book.curl.php) – for integrations;
* [xml](https://php.net/manual/en/book.xml.php) – for excel export;
* [xmlwriter](http://php.net/manual/en/book.xmlwriter.php) – for excel export;
* [exif](https://php.net/manual/en/book.exif.php) – for a proper orientation of uploaded images;
* [bcmath](https://www.php.net/manual/en/book.bc.php) – arbitrary precision mathematics;

Optional PHP extensions that could be useful:

* [zmq](http://php.net/manual/en/book.zmq.php) – for WebSocket;
* [pcntl](http://php.net/manual/en/book.pcntl.php) – for parallel job processing and daemon (Unix-like systems only);
* [posix](http://php.net/manual/en/book.posix.php) – for Unix-like systems;
* [ldap](http://php.net/manual/en/book.ldap.php) – for LDAP authentication;
* [ev](https://www.php.net/manual/en/book.ev.php) – for WebSocket if a large number of connections is expected.

Recommended minimum values in php.ini:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```

### Database requirements

EspoCRM supports MySQL and MariaDB. These are no special peculiarities. All default settings are fine for EspoCRM.

EspoCRM also experimentally supports PostgreSQL 15. Though it's planned to become official soon.

## Required permissions for Unix-based systems

!!! note

    In most cases, permissions are set properly after extracting EspoCRM instance from a zip package. You need only to set ownership.

### Permissions

The files and directories should have the following permissions:

* `data`, `custom`, `client/custom` – all files, directories and subdirectories should be writable (664 for files, 775 for directories, including all subdirectories and files);
* `bin/command` – should be executable (754);
* all other files and directories should be readable (644 for files, 755 for directories).

To set the permissions, execute these commands in the terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom client/custom -type d -exec chmod 775 {} + && find data custom client/custom -type f -exec chmod 664 {} +;
chmod 775 application/Espo/Modules client/modules;
chmod 754 bin/command;
```

### Ownership

All files should be owned and group-owned by the webserver process. It can be *www-data*, *daemon*, *apache*, *www*, etc.

!!! note

    On Bitnami Stack, files should be owned and group-owned by *daemon* user.

    On shared hosts, files should be owned and group-owned by your user account.
   

To set the owner and group-owner, execute these commands in the terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## Setting up crontab

More information about jobs in EspoCRM is available [here](jobs.md).

### Unix-like systems

To setup crontab on Unix-like system, take the following steps:

1\. Login as administrator into your EspoCRM instance.

2\. Go to the Scheduled Jobs section in the administrator panel (Menu > Administration > Scheduled Jobs) and copy the string for the crontab. It looks like this one:

```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```

You might need to replace `/var/www/html/espocrm/` with an actual path to your instance.

3\. Open a terminal and run this command:

```
crontab -e -u WEBSERVER_USER
```

WEBSERVER_USER can be one of the following “www”, “www-data”, “apache”, etc (depends on your webserver).

4\. Paste the copied string (from step 2) and save the crontab file (Ctrl + O, then Ctrl + X for nano editor).

### Windows

See in a separate [article](cron-on-windows.md) how to set up Cron on Windows.

## Configuration instructions for specific web servers

* [Apache server configuration](apache-server-configuration.md)
* [Nginx server configuration](nginx-server-configuration.md)
* [IIS server configuration](iis-server-configuration.md)

## See also

* [Jobs](jobs.md)
* [WebSocket](websocket.md)
* [Performance tweaking](performance-tweaking.md)
* [Installation by script](installation-by-script.md)
