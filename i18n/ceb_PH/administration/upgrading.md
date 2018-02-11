# Unsaon pag-upgrade sa EspoCRM

Ang EspoCRM kay pwede i-upgrade ngadto sa pinakabag-o nga version pinaagi sa pagsunod sa mga musunod nga mga step:

### Step 1. Tanawa ang imohang current nga version

Para tan-awon ang imohang version, adto sa Administration > Upgrade nga page.

### Step 2. I-download ang mga gikinahanglan nga mga package

Adto sa upgrade page https://www.espocrm.com/download/upgrades/ ug i-download ang mga gikinahanglan nga mga package basi sa sakto nga version.

### Step 3. Paghimo og backup (opsyonal)

Paghimo og backup sa imohang EspoCRM nga mga file ug data usa mag-upgrade. Sunda ang [kani nga mga instruction] (https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md) aron mabuhat nimo kini.

### Step 4. Proseso sa pag-upgrade

Adto sa Administration > Upgrade. I-upload ug i-install ug tagsa tagsa ang mga upgrade package.

Pwede nimong i-check kung naa nimo ang pinaka bago nga version sa Menu > About.

## Pag-upgrade gamit ang CLI

Pwede pud nimong himoon ang pag-upgrade gamit ang command line interface. Gikinahanglan nimo i-execute ni ang musunod nga command gian sa EspoCRM root nga directory:

```
php upgrade.php /path/to/upgrade/package.zip
```
