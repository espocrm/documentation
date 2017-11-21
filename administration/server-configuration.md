# Server Configuration for EspoCRM

EspoCRM can be installed on the Apache ([instructions](apache-server-configuration.md)), Nginx ([instructions](nginx-server-configuration.md)), or IIS server with support PHP version 5.6 or greater and MySQL version 5.1 or greater.

## Configuration Recommendations

### PHP Requirements

EspoCRM requires PHP 5.6 or greater, with the following extensions enabled:

* [PDO](http://php.net/manual/en/book.pdo.php) – to access MySQL in PHP;
* [JSON](http://php.net/manual/en/book.json.php) – resources use this format (metadata, layout, languages, and others);
* [GD](http://php.net/manual/en/book.image.php) – to manipulate images;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – to ensure the highest protection;
* [Zip](http://php.net/manual/en/book.zip.php) – to be able to upgrade EspoCRM and install extensions;
* [IMAP](http://php.net/manual/en/book.imap.php) – to monitore mailboxes in EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

It's also recommended to have [mailparse](https://pecl.php.net/package/mailparse) pecl extension installed. It's needed for smooth working of email fetching feature.

php.ini settings:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### MySQL Requirements

EspoCRM supports MySQL version 5.1 or greater.
These are no special peculiarities. All default settings are good for EspoCRM.

## Required Permissions for Unix-based Systems

The files and directories should have the following permissions:

* `/data`, `/custom`, `/client/custom` – should be writable all files, directories and subdirectories (664 for files, 775 for directories, including all subdirectories and files);
* `/application/Espo/Modules`, `/client/modules` – should be writable the current directory (775 for the current directory, 644 for files, 755 for directories and subdirectories);
* All other files and directories should be readable (644 for files, 755 for directories).

To set the permissions, execute these commands in the terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

All files should be owned and group-owned by the webserver process. It can be “www-data”, “daemon”, “apache”, “www”, etc.  
Note: On Bitnami Stack, files should be owned and group-owned by “daemon” user.  
Note: On shared hosts, files should be owned and group-owned by your user account.

To set the owner and group-owner, execute these commands in the terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## Setup a crontab

To setup a crontab on a UNIX system, take the following steps:

* 1. Login as administrator into your EspoCRM instance.
* 2. Go to the Scheduled Jobs section in the administrator panel (Menu > Administration > Scheduled Jobs) and copy the string for the crontab. It looks like this one:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. Open a terminal and run this command:
```
crontab -e -u WEBSERVER_USER
```
WEBSERVER_USER can be one of the following “www”, “www-data”, “apache”, etc (depends on your webserver).
* 4. Paste the copied string (from step 2) and save the crontab file (Ctrl+O, then Ctrl+X for nano editor).

## Configuration instructions based on your server:

* [Apache server configuration](apache-server-configuration.md).
* [Nginx server configuration](nginx-server-configuration.md).
