# Prenos EspoCRM na drug strežnik

Za prenos EspoCRM na drug strežnik naredite naslednje korake:

### Korak 1. Naredite varnostno kopijo datotek

Odprite upravitelja datotek ali pa se prijavite prek SSH ter arhivirajte vse razpoložljive datoteke, ki so v EspoCRM direktoriju. Več podrobnosti:
https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### Korak 2. Naredite varnostno kopijo podatkovne baze

Morali bi narediti varnostno kopijo podatkov, shranjenih v podatkovni bazi (MySQL, MariaDB). Prosimo, upoštevajte to priporočilo:
https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### Korak 3. Varnostni kopiji datotek in podatkovnih baz kopirajte na drug strežnik

Kopirajte varnostni kopiji datotek in vaše podatkovne baze na nov strežnik.

### Korak 4. Odarhiviraje datoteke varnostnih kopij

Za odarhiviranje datotek varnostnih kopij lahko uporabite Archive Manager ali ta navodila:
https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files.
Opomba: Datoteke je treba kopirati v direktorij, ki ga bere spletni strežnik.

### Korak 5. Skonfigurirajte strežnik

Skonfigurirajte novi strežnik v skladu z naslednjimi priporočili: https://www.espocrm.com/documentation/administration/server-configuration/.

### Korak 6. Popravite pravice

Določite potrebne pravice in lastnika datotek: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### Korak 7. Uvozite varnostno kopijo podatkovne baze

Najprej morate ustvariti novo podatkovno bazo z uporabnikom v MySQL. Za uvoz podatkovne baze iz varnostne kopije upoštevajte ta navodila:
https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### Korak 8. Spremenite konfiguracijo EspoCRM

Potem ko boste uspešno uvozili in skonfigurirali strežnik, prosimo, ustrezno spremenite konfiguracijo EspoCRM v datoteki `ESPOCRM_DIREKTORIJ/data/config.php`:

 * nastavitve za povezave podatkovne baze:

  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'IME_PODATKOVNE_BAZE',
        'user' => 'UPORABNIK_BAZE',
        'password' => 'GESLO_UPORABNIKA_BAZE',
        'host' => 'localhost',
        'port' => ''
    ],
  ```

   * "siteUrl" - če se je vaše ime domene (URL) spremenilo:

  ```php
  'siteUrl' => 'https://nova-povezava.com',
  ```

  * privzeti lastnik datotek (samo, če se je spremenil):

  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  kjer je `www-data` vaš uporabnik spletnega strežnika (web-server user).

### Korak 9. Nastavite crontab

Nastavite crontab: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
Opomba: skonfiguriran mora biti pod uporabnikom spletnega strežnika.

To je vse. Od zdaj naprej je vaš EspoCRM na novem strežniku.
