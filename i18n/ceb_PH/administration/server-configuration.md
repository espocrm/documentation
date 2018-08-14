# Server Konpigyurasyon para sa EspoCRM

Ang EspoCRM aky pwede i-instolar sa Apache ([mga giya kung unsaon](apache-server-configuration.md)), Nginx ([mga giya kung unsaon](nginx-server-configuration.md)), o IIS nga server nga naay suporta para sa bersiyon 5.6 o mas taas pa nga PHP ug bersiyon 5.1 o mas taas pa nga MYSQL.

## Mga Girekomenda nga Konpigyurasyon

### Mga Gikinahanglan nga PHP

EspoCRM requires PHP 5.6 or greater, with the following extensions enabled:
Ang EspoCRM kay nanginahanglan og bersyon 5.6 o mas taas pa nga PHP, nga naay mga musunod nga gi-enable nga mga ekstensiyon:

* [PDO](http://php.net/manual/en/book.pdo.php) – para i-akses ang MySQL sa PHP;
* [JSON](http://php.net/manual/en/book.json.php) – ang mga kapanguhaan gay mugamit ani nga mga format (metadata, layout, pinulongan], ug uban pa);
* [GD](http://php.net/manual/en/book.image.php) – to manipulate images;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – para masigurado ang pinakataas nga porma sa proteksiyon;
* [Zip](http://php.net/manual/en/book.zip.php) – para mamahimong makaupgrade sa EspoCRM ug muinstolar og mga ekstensiyon;
* [IMAP](http://php.net/manual/en/book.imap.php) – para mabantayan ang mga mailbox sa EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

Girekomenda usab nga naay [mailparse](https://pecl.php.net/package/mailparse) pec1 nga ekstensiyon nga nakainstolar. Gikinahanglan ni para sa sayon nga mag pag-gana sa feature nga pagkuha og email.

mga php.ini setting:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### Mga Gikinahanglan nga MySQL

Ang EspoCRm kay nagsuporta sa bersiyon 5.1 o mas taas pa nga MySQL.
Walay espesiyal nga mga kalahian. Ang tanan default nga setting kay maayo ra para sa EspoCRM

## Mga Gikinahanlang Permiso para sa mga Unix-based nga mga Sistema

Ang mga file og mga direktoryo kay gikinahanglan sa mga musunod nga permiso:

* `/data`, `/custom`, `/client/custom` – gikinihanglan nga ang tanan nga mga file, direktoryo, ug mga subdirectory kay masuwatan (664 para sa mga file, 775 para sa mga direktoryo, naglangkob sa tanan subdirectory og mga file);
* `/application/Espo/Modules`, `/client/modules` – gikinahanglang ang tanang bag-o nga direktoryo kay masuwatan (775 para sa karon nga direktoryo, 644 para sa mga file, 755 para sa mga direktoryo og mga subdirectory);
* Ang ubang lahing mga file ug direktoryo kay gikinahanglan nga mabasa (644 para sa mga file, 755 para sa mga direktoryo).

Para i-set ang mga permiso, i-eksekyut ang mga musunod ng mga command sa terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

Ang tanang mga file kay gikinahanglan nga gitag-iya o gi tag-iya na grupo sa webserver nga proseso. Pwede kining “www-data”, “daemon”, “apache”, “www”, etc.  
Timan-e: Sa Bitnami nga Stack, ang mga file kay gikinahanglan nga gitag-iya ug gi tag-iya na grupo sa “daemon” user.  
Timan-e: Sa mga shared nga mga host, ang file kay gikinahanglang gipanag-iya o gi panag-iya nga grupo sa imohang user account.

Para i-set ang tag-iya ug grupo nga tag-iya, ipadagan ang mga musunod nga mga command sa terminal:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## Pag-setup og crontab

Para makasetup og usa ka crontab sa UNIX nga sistema, buhata ang mga musunod nga mga lakang:

* 1. Pag-login isip usa ka administrador sa imohang EspoCRM nga instance.
* 2. Adto sa Scheduled Jobs nga seksiyon sa sulod sa administrador nga panel (Menu > Administration > Scheduled Jobs) ug kopyaha ang string nga para sa crontab. Ang hitsura kay mura aning naa sa ubos.
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. Pag-abli ug usa ka terminal ug ipadagan ni ang musunod nga command:
```
crontab -e -u WEBSERVER_USER
```
Ang WEBSERVER_USER kay pwede bisan asa aning mga musunod “www”, “www-data”, “apache”, etc (depende sa imohang webserver).

* 4. I-paste ang nakopya nga string (gikan sa ikaduhang lakang) ug i-save ang crontab nga file (Ctrl+O, then Ctrl+X para sa nano editor).

## Mga konpigurasyon ug mga instruksiyon base sa imohang server

* [Konpigurasiyon sa Apache server](apache-server-configuration.md).
* [Konpigurasiyon sa Nginx server](nginx-server-configuration.md).
