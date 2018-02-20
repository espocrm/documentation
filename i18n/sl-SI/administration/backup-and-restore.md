# Varnostna kopija in obnovitev

## Kako ročno narediti varnostno kopijo EspoCRM

EspoCRM vsebuje datoteke in podatke, shranjene v podatkovni bazi. Vsi ti podatki so potrebni za ustvaritev polne varnostne kopije EspoCRM. Sledijo navodila, kako lahko to naredite na Ubuntu strežniku z MySQL.

### Korak 1. Varnostna kopija datotek

Ustvarite arhiv vsebine direktorija nameščenega EspoCRM. Za Ubuntu je privzeta pot `/var/www/html`. Uporabite lahko ta ukaz:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Korak 2. Varnostna kopija podatkovne baze

Da bi lahko ustvarili varnostno kopijo svojih podatkov, morate vedeti ime podatkovne baze ter uporabniško ime in geslo za dostop. Ime podatkovne baze lahko najdete v konfiguracijski datoteki `/ESPOCRM_DIREKTORIJ/data/config.php` pod razdelkom `database`. Za ustvaritev varnostne kopije svoje podatkovne baze lahko uporabite ta ukaz:

```bash
mysqldump --user=UPORABNIŠKO_IME --password=VAŠE_GESLO IME_PODATKOVNE_BAZE > "db.sql"
```

### Korak 3. Kopirajte varnostno kopijo

To je vse. Zdaj morate le še skopirati ustvarjeno varnostno kopijo na varno mesto.


## Kako ustvariti varnostno kopijo EspoCRM s skripto

Za to, da bi ustvarili varnostno kopijo vseh potrebnih podatkov, lahko uporabite skripto. Prijavite se prek SSH in zaženite ukaz (testirano na Ubuntu strežniku).


### Prenesite skripto

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Zaženite skripto

```bash
bash ./backup.sh POT_DO_ESPOCRM POT_DO_VARNOSTNE_KOPIJE
```
pri čemer je
 * `POT_DO_ESPOCRM` pot do direktorija, kjer je nameščen EspoCRM.
 * `POT_DO_VARNOSTNE_KOPIJE` pot do dirktorija, kjer se nahaja varnostna kopija.

Za Ubuntu strežnik je videti takole:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Opomba: Če trenutni uporabnik MySQL nima potrebnih pravic za izvoz vaše podatkovne baze, boste pozvani, da vpišete uporabniško ime in geslo drugega MySQL uporabnika.

Po uspešno ustvarjeni varnostni kopiji, boste prejeli pot do te varnostne kopije.

## Obnovite EspoCRM iz varnostne kopije

EspoCRM lahko obnovite iz varnostne kopije, ustvarjene po zgornjem postopku.

### Korak 1. Odarhiviraje datoteke varnostne kopije

Za odarhiviranje datotek lahko uporabite Archive Manager ali zaženete spodnji ukaz. Datoteke morate kopirati v direktorij, ki ga bere spletni strežnik.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
pri čemer je:
 * `/var/www/html` direktorij spletnega strežnika.

### Korak 2. Nastavite zahtevane pravice

Lastnik datotek bi moral biti uporabnik spletnega strežnika (web-server user) in bi moral imeti pravilne pravice. Prosimo, nastavite zahtevane pravice z upoštevanjem naslednjih navodil: [www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### Korak 3. Uvozite izvoženo podatkovno bazo

Izvoženo podatkovno bazo je treba uvoziti v isto podatkovno bazo z istim uporabniškim imenom in geslom, sicer je treba spremeniti konfiguracijsko datoteko `ESPOCRM_DIREKTORIJ/data/config.php`. Za uvoz vaše podatkovne baze iz izvožene datoteke zaženite spodnji ukaz v terminalu:

```bash
mysql --user=UPORABNIK_BAZE --password=GESLO_UPORABNIKA_BAZE IME_BAZE < db.sql
```

### Korak 4. Preverite/skonfigurirajte crontab

Preverite, ali je vaš crontab pravilno skonfiguriran. Zaženite spodnji ukaz in preverite, ali je pot do EspoCRM pravilna:

```bash
sudo crontab -l -u www-data
```
pri čemer je:
 * `www-data` uporabnik spletnega strežnika (web-server user).

Če morate narediti kakšno spremembno, uporabite ta ukaz:

```bash
sudo crontab -l -u www-data
```

Več podrobnosti glede konfiguriranja crontab za EspoCRM je opisanih tukaj [www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
