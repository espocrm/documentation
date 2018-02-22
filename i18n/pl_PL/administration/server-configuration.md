# Konfiguracja serwera dla EspoCRM

EspoCRM może być zainstalowany na serwerze Apache ([instrukcje](apache-server-configuration.md)), Nginx ([instrukcje](nginx-server-configuration.md)), lub IIS ze wsparciem dla PHP 5.6 lub wyżej oraz MySQL wersja  5.1 lub wyżej.

## Zalecana Konfiguracja

### Wymagania PHP

EspoCRM wymaga PHP 5.6 lub wyżej, z następującymi aktywnymi rozszerzeniami:

* [PDO](http://php.net/manual/en/book.pdo.php) – do dostępu do bazy danych MySQL w PHP;
* [JSON](http://php.net/manual/en/book.json.php) – zasoby korzystają z tego formatu (metadane, szablon, języki, i inne);
* [GD](http://php.net/manual/en/book.image.php) – do zarządzania obrazkami;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – aby zapewnić najlepszą ochronę;
* [Zip](http://php.net/manual/en/book.zip.php) – aby można było zaktualizować EspoCRM i zainstalować rozszerzenia;
* [IMAP](http://php.net/manual/en/book.imap.php) – aby monitorować skrzynkę pocztową w EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

Zalecane jest również posiadanie [mailparse](https://pecl.php.net/package/mailparse) zainstalowanego rozszerzenia pecl. Jest wymagane dla sprawnego pobierania wiadomość email.

php.ini settings:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### Wymagania MySQL

EspoCRM wspiera MySQL w wersji 5.1 lub wyższej.
Nie ma specjalnych wymagań. Wszystkie domyśle ustawienia są odpowiednie.

## Required Permissions for Unix-based Systems

Pliki i katalogi powinny posiadać następujące zezwolenia:

* `/data`, `/custom`, `/client/custom` – should be writable all files, directories and subdirectories (664 for files, 775 for directories, including all subdirectories and files);
* `/application/Espo/Modules`, `/client/modules` – should be writable the current directory (775 for the current directory, 644 for files, 755 for directories and subdirectories);
* Wszystkie pozostałe pliki i katalogi powinny być tylko do odczytu (644 dla plików, 755 dla katalogów).

To set the permissions, execute these commands in the terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

Wszystkie pliki powinny należeć do grupy procesu serwera sieciowego. Może to być “www-data”, “daemon”, “apache”, “www”, itd.  
Note: On Bitnami Stack, files should be owned and group-owned by “daemon” user.  
Note: On shared hosts, files should be owned and group-owned by your user account.

Aby ustawić właściciela o grupę właścicieli, uruchom w terminalu tę komendę :

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
