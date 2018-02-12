# Konfiguracija strežnika za EspoCRM

EspoCRM lahko namestite na Apache ([navodila](apache-server-configuration.md)), Nginx ([navodila](nginx-server-configuration.md)) ali IIS strežnik, ki podpira PHP verzijo 5.6 ali višjo in MySQL verzijo 5.1 ali višjo.

## Predlagane konfiguracijske nastavitve

### PHP zahteve

EspoCRM zahteva PHP verzijo 5.6 ali višjo z naslednjimi omogočenimi razširitvami (extensions):

* [PDO](http://php.net/manual/en/book.pdo.php) – za dostop do MySQL v PHP-ju;
* [JSON](http://php.net/manual/en/book.json.php) – viri uporabljajo ta format (metadata, postavitev strani, jeziki in drugo);
* [GD](http://php.net/manual/en/book.image.php) – za delo s slikami;
* [OpenSSL](http://php.net/manual/en/book.openssl.php) – za zagotovitev najvišje zaščite;
* [Zip](http://php.net/manual/en/book.zip.php) – za možnost nadgradnje EspoCRM in namestitev razširitev;
* [IMAP](http://php.net/manual/en/book.imap.php) – za nadzor poštnih predalov v EspoCRM;
* [mbstring](http://php.net/manual/en/book.mbstring.php);
* [cURL](http://php.net/manual/en/book.curl.php).

Priporočljivo je tudi, da imate nameščeno [mailparse](https://pecl.php.net/package/mailparse) pecl razširitev. Potrebna je za brezhibno funkcionalnost pobiranja e-pošte.

php.ini nastavitve:

```
max_execution_time = 180
max_input_time = 180
memory_limit = 256M
post_max_size = 50M
upload_max_filesize = 50M
```


### MySQL zahteve

EspoCRM podpira MySQL verzijo 5.1 ali višjo.
Tukaj ni nobenih posebnosti. Vse privzete nastavitve so ustrezne za EspoCRM.

## Potrebne pravice za sisteme, temelječe na Unixu

Datoteke in direktoriji bi morali imeti naslednje pravice:

* `/data`, `/custom`, `/client/custom` – možnost zapisovanja morajo imeti vse datoteke, direktoriji in poddirektoriji (664 za datoteke, 775 za direktorije, vključno z vsemi poddirektoriji in datotekami);
* `/application/Espo/Modules`, `/client/modules` – možnost zapisovanja mora imeti trenutni direktorij (775 za trenutni direktorij, 644 za datoteke, 755 za direktorije in poddirektorije);
* Možnost branja morajo imeti vse druge datoteke in direktoriji (644 za datoteke, 755 za direktorije).

Pravice lahko nastavite z naslednjimi ukazi v terminalu:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
find . -type d -exec chmod 755 {} + && find . -type f -exec chmod 644 {} +;
find data custom -type d -exec chmod 775 {} + && find data custom -type f -exec chmod 664 {} +;
```

Lastnik in skupinski lastnik vseh datotek bi moral biti proces spletnega strežnika. To je lahko “www-data”, “daemon”, “apache”, “www” itd.  
Opomba: Če uporabljate Bitnami Stack, mora biti lastnik in skupinski lastnik datotek “daemon” uporabnik.  
Opomba: Če uporabljate spletno gostovanje, mora biti lastnik in skupinski lastnik datotek vaš uporabniški račun.

Lastnika in skupinskega lastnika lahko nastavite s temi ukazi v terminalu:

```
cd <PATH-TO-ESPOCRM-DIRECTORY>
chown -R <OWNER>:<GROUP-OWNER> .;
```

## Nastavite crontab

Da bi nastavili crontab v sistemu UNIX, naredite naslednje korake:

* 1. V EspoCRM se prijavite kot administrator.
* 2. V administratorskem panelu izberite razdelek Scheduled Jobs (Menu > Administration > Scheduled Jobs) in kopirajte niz za crontab. Videti je takole:
```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```
* 3. Odprite terminal in zaženite ta ukaz:
```
crontab -e -u WEBSERVER_USER
```
WEBSERVER_USER je lahko eden od naslednjih: “www”, “www-data”, “apache” itd. (odvisno od vašega spletnega strežnika).
* 4. Prilepite kopirani niz (iz koraka 2) in shranite crontab datoteko (Ctrl+O, nato Ctrl+X za nano urejevalnik).

## Navodila za konfiguracijo vašega strežnika:

* [Konfiguracija Apache strežnika](apache-server-configuration.md).
* [Konfiguracija Nginx strežnika](nginx-server-configuration.md).
