# Configurarea Server pentru EspoCRM

EspoCRM poate fi instalat pe Apache ([instrucțiuni](apache-server-configuration.md)), Nginx ([instrucțiuni](nginx-server-configuration.md)), sau server IIS cu suport PHP versiunea 5.6 sau mai nouă și MySQL versiunea 5.1 sau mai nouă.

## Recomandări Configurare

### Cerințe PHP

EspoCRM necesită PHP 5.6 sau mai nouă, cu următoarele extensii activate:

* [PDO](http://php.net/manual/en/book.pdo.php) – pentru a accesa MySQL în PHP;
* [JSON](http://php.net/manual/en/book.json.php) – resursele folosesc următoarele formate (metadata, aspect, limbi, și altele);
* [GD](http://php.net/manual/en/book.image.php) – să manipuleze imagini;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – pentru a asigura protecția cea mai înaltă;
* [Zip](http://php.net/manual/en/book.zip.php) – pentru a actualiza EspoCRM și a instala extensii;
* [IMAP](http://php.net/manual/en/book.imap.php) – să monitorizeze căsuțele poștale în EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

Este de asemenea recomandat [mailparse](https://pecl.php.net/package/mailparse) pecl extensia instalată. Este necesară pentru email fetching și o muncă ușoară.

php.ini setări:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### Cerințe MySQL

EspoCRM suportă MySQL versiunea 5.1 sau mai nouă.
Nu există particularități speciale. Toate setările implicite sunt bune pentru EspoCRM.

## Permisiuni necesare pentru Sisteme Unix-bazate

Fișierele și directoarele ar trebui să aibă următoarele permisiuni:

* `/data`, `/custom`, `/client/custom` – ar trebui să fie scrise fișiere, directoare și subdirectoare(664 pentru fișiere, 775 pentru directoare, inclusiv pentru subdirectoare și fișiere);
* `/application/Espo/Modules`, `/client/modules` – trebuie să scrieți directorul actual (775 pentru directorul actual, 644 pentru fișiere, 755 pentru directoare și subdirectoare);
* Toate celelalte fișiere și directoare trebuie să poată fi citite (644 pentru fișiere, 755 pentru directoare).

Pentru a seta permisiunile, execută următoarele comenzi în terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

Toate fișierele ar trebui să fie deținute și deținute de grup prin procesul de webserver. Poate fi “www-data”, “daemon”, “apache”, “www”, etc.  
Rețineți: Pe Bitnami Stack, fișierele trebuie deținute și deținute de către grup de utilizator “daemon”.  
Rețineți: On gazdele distribuite, fișierele trebuie deținute de proprietar și de grup de contul tău de utilizator.

Pentru a seta proprietarul și proprietarul grupului , execută aceste comenzi în terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## Setează crontab

Pentru a seta crontab pe sistemul UNIX, urmează pașii:

* 1. Autentifică-te ca administrator pe instanța EspoCRM.
* 2. Du-te la secțiunea de Activității Planificate section din panoul de administrare (Meniu > Administrare > Activități Planificate) și copiază șirul în crontab. Arată în felul următor:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. Deschide un terminal și rulează această comandă:
```
crontab -e -u WEBSERVER_USER
```
WEBSERVER_USER poate fi “www”, “www-data”, “apache”, etc (depinde de webserver).
* 4. Lipește șirul copiat (de la pasul 2) și salvează filierul crontab (Ctrl+O, then Ctrl+X pentru nano editor).

## Instrucțiuni de configurare în funcție de serverul tău:

* [Configurări server Apache](apache-server-configuration.md).
* [Configurări server Nginx](nginx-server-configuration.md).
