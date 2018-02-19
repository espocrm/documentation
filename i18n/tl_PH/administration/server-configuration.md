# Ang Pag-configure ng Serber para sa EspoCRM

Ang EspoCRM ay maaaring ma-install sa Apache ([mga instruksyon](apache-server-configuration.md)), sa Nginx ([mga instruksyon](nginx-server-configuration.md)), o IIS serber na may suporta na PHP bersyon 5.6 o higit pa at MySQL bersyon 5.1 o higit pa.

## Mga Rekomendasyon sa Pag-configure

### Mga Kailangan sa PHP 

Ang EspoCRM ay nangangailangan ng PHP 5.6 o higit pa, na mayroon ng sumusunod na mga ekstensiyon na naka-enable:

* [PDO](http://php.net/manual/en/book.pdo.php) – sa pag-access ng MySQL sa PHP;
* [JSON](http://php.net/manual/en/book.json.php) – ang mga resource ay gumagamit ng format na ito (metadata, layout, mga lengguwahe, at iba pa);
* [GD](http://php.net/manual/en/book.image.php) – upang manipulahin ang mga imahe;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – upang matiyak ang pinakamataas na proteksyon;
* [Zip](http://php.net/manual/en/book.zip.php) – upang ma-upgrade ang EspoCRM at ma-install ang mga ekstensiyon;
* [IMAP](http://php.net/manual/en/book.imap.php) – upang ma-monitor ang mga mailbox sa EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

Inirerekomenda din na magkaroon ng [mailparse](https://pecl.php.net/package/mailparse) pecl na ekstensiyon na naka-install. Ito ay kinakailangan para sa maayos na pagtakbo ng tampok na pag-fetch ng email.

php.ini na mga setting:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### Mga Kinakailangan sa MySQL 

Ang EspoCRM ay sumusuporta sa MySQL bersyon 5.1 o higit pa.
Walang mga ispesyal na kakaibhan. Lahat ng mga setting batay sa default ay angkop para sa EspoCRM.

## Mga Kinakailangang mga Permiso para sa mga Unix-based System

Ang mga file at direktoryo ay dapat may mga sumusunod na mga persmiso:

* `/data`, `/custom`, `/client/custom` – ay dapat na writable, lahat ng mga file, direktoryo at subdirectory (664 para sa mga file, 775 para sa mga direktoryo, kabilang ang lahat ng mga subdirectory at file);
* `/application/Espo/Modules`, `/client/modules` – ay dapat na writable, ang kasalukuyang direktoryo (775 para sa kasalukuyang direktoryo, 644 para sa mga file, 755 para sa mga direktoryo at subdirectory);
* Ang lahat ng iba pang mga file at direktoryo ay dapat na madaling mabasa (644 para sa mga file, 755 para sa mga direktoryo).

Upang i-set ang mga permiso, isagawa ang mga command na ito sa terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

Ang lahat ng mga file ay dapat pag-aari at group-owned ng proseso ng webserver. Maaari itong maging “www-data”, “daemon”, “apache”, “www”, etc.  
Tandaan: Sa Bitnami Stack, ang mga file ay dapat pag-aari at group-owned ng user ng “daemon”.  
Tandaan: Sa mga shared host, ang mga file ay dapat pag-aari at group-owned ng user account.

Upang i-set ang may-ari at group-owner, isagawa ang mga command na ito sa terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## Ang Pag-setup ng crontab

Upang i-setup ang crontab sa isang UNIX system, gawin ang sumusunod ng mga step:

* 1. Mag-login bilang administrador sa iyong EspoCRM instance.
* 2. Pumunta sa seksyon ng mga naka-iskedyul nga mga gawain sa administrator panel (Menu > Administration > Scheduled Jobs) at kopyahin ang string para sa crontab. Mukhang gaya nito:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. Buksan ang terminal at patakbuhin ang command na ito:
```
crontab -e -u WEBSERVER_USER
```
WEBSERVER_USER ay maaaring maging isa sa mga sumusunod “www”, “www-data”, “apache”, etc (depende sa iyong webserver).
* 4. I-paste ang kinopyang string (mula sa pangalawang hakbang) at i-save sa file ng crontab (Ctrl+O, pagkatapos ay Ctrl+X para sa nano editor).

## Mga Instruksiyon sa Pag-configure base sa iyong serber:

* [Apache server configuration](apache-server-configuration.md).
* [Nginx server configuration](nginx-server-configuration.md).
