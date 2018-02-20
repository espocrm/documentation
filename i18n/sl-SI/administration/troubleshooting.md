# Odpravljanje napak

## Preverite dnevnike (logs)

Da bi našli vzrok težave, morate preveriti datoteke z dnevniki napak.

#### EspoCRM dnevniki napak

EspoCRM dnevniki se nahajajo v `<ESPOCRM_DIREKTORIJ>/logs/*.log` in vsebujejo nekatere informacije o napakah.

#### Apache dnevniki napak

Za Ubuntu strežnik se apache dnevnik napak nahaja v `/var/log/apache2/error.log` in vsebuje vse informacije o napakah. Lokacija dnevniških datotek se na drugih sistemih lahko razlikuje.

## Omogočite razhroščevalni način

Da bi omogočili razhroščevalni način, pojdite EspoCRM direktorij, ki je bil ustvarjen ob namestitvi, odprite datoteko `data/config.php` in spremenite vrednost:

```
'logger' => [
    ...
    'level' => 'WARNING',
    ...
]
```
na
```
'logger' => [
    ...
    'level' => 'DEBUG',
    ...
]
```

## Razporejanje opravil ne deluje

#### Problem #1: Vaš crontab ni skonfiguriran

1. Prijavite se na svoj strežnik prek SSH.

2. Svoj crontab skonfigurirajte z upoštevanjem naslednjih korakov: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Opomba: Crontab bi moral biti nastavljen za delo z uporabnikom za spletni strežnik (web-server user), na primer `crontab -e -u www-data`.

3. Počakajte nekaj časa in preverite razdelek Razporejanje opravil, da bi videli, ali je bilo kakšno opravilo zagnano (poglejte panel Dnevnik).

#### Problem #2. Crontab je skonfiguriran, vendar Razporejanje opravil ne deluje

Da med delovanjem crona ne bi prihajalo do napak, poskusite zagnati ukaz cron v terminalu:

1. Prijavite se na svoj strežnik prek SSH.

2. Pojdite v direktorij, kjer je EspoCRM nameščen. Na primer, za direktorij `/var/www/html/espocrm` vnesite naslednji ukaz:

```bash
cd /var/www/html/espocrm
```

3. Zaženite ukaz crontab:

```bash
php cron.php
```

Opomba: Zagnati bi ga morali z uporabnikom za spletni strežnik. Če ste prijavljeni kot root, je ukaz naslednji (na primer za Ubuntu):

```bash
sudo -u www-data php cron.php
```

kjer je `www-data` uporabnik za spletni strežnik.

4. Če ni nobenih napak, preverite Razporejanje opravil, da bi videli, ali je bilo kakšno opravilo zagnano (poglejte panel Dnevnik).

## EspoCRM se po nadgradnji ne naloži

To se lahko včasih zgodi na nekaterih deljenih gostovanjih.

Preverite pravice datotek:
/index.php
/api/v1/index.php

Biti morajo 644. Če ima katera od datotek pravico 664, jo morate spremeniti na 644. Uporabite nadzorno plošo gostitelja oziroma ukaz chmod.

```
chmod 644 /pot/do/datoteke
```
Več o pravicah datotek najdete: [tukaj](server-configuration.md#required-permissions-for-unix-based-systems).
