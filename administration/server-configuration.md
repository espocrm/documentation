#Server Configuration

EspoCRM can be installed on the Apache, Nginx, or IIS server with support PHP version 5.4 or greater and MySQL version 5.1 or greater.

##Configuration Recommendations for EspoCRM

###PHP requirements

EspoCRM requires PHP 5.4 or greater, with the following extensions enabled:

* [PDO](http://php.net/manual/en/book.pdo.php) – to access MySQL in PHP;
* [JSON](http://php.net/manual/en/book.json.php) – resources use this format (metadata, layout, languages, and others);
* [GD](http://php.net/manual/en/book.image.php) – to manipulate images;
* [Mcrypt](http://php.net/manual/en/book.mcrypt.php) – to ensure the highest protection.


php.ini:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


###MySQL Requirements


EspoCRM supports MySQL version 5.1 or greater. These are no any special peculiarities. All default settings are good for EspoCRM.

##Required Permissions for Unix-based Systems

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

Also, all files should be owned and group-owned by the webserver process. It can be `www`, `www-data`, `apache`, etc.
Note: On shared hosts, files should be owned and group-owned by your user account.

To set the owner and group-owner, execute these commands in the terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

##Fixing the issue “API Error: EspoCRM API unavailable”.

Do only necessary steps. After each step check if the issue is solved.

###1. Enable “mod_rewrite” support in Apache

To enable “mod_rewrite,” run these commands in a Terminal:

```
a2enmod rewrite
service apache2 restart
```

###2. Enable .htaccess support

To enable .htaccess support, add/edit the Server Configuration Settings (apache2.conf, httpd.conf):

```
<Directory /PATH_TO_ESPO/>
AllowOverride All
</Directory>
```

Afterward, run this command in a terminal:

```
service apache2 restart
```

###3. Add RewriteBase path

Open a file api/v1/.htaccess and replace the following line:

```
# RewriteBase /
```

to

```
RewriteBase /REQUEST_URI/api/v1/
```

where `REQUEST_URI` is a part of URL, e.g. for `http://example.com/espocrm/`, REQUEST_URI is /espocrm.
