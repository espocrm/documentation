# Pagbackup og ang Pagbalik

## Unsaon pag manomanog backup sa EspoCRM

Ang EspoCRM kay usa ka grupo ka mga files og database nga data. Anga kaning nga mga data kay gikinahanglan para makabackup sa EspoCRM. Kani ang mga paggiya kung unsaon ni pagbuhat sa Ubuntu nga server gamit ang MySQL.

### Step 1. Pag-backup sa mga file

Paghimo og archive nga directory sa tanang mga sulod sa nakainstolar na nga EspoCRM. Sa Ubuntu, ang default nga path kay `/var/www/html`. Pwede ni nimo gamiton nga command:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Step 2. Pag-backup sa database

Para e-backup ang tanan nimo nga data, gikinahanglan nga kamao ka sa pangalan og access credentials sa imohang database. Pwede nimong makit-an ang pangalan sa database sa konpigurasyon nga file `/ESPOCRM_DIRECTORY/data/config.php` ubos sa `database` nga section. Pwede nimong gamiton ang command sa ubos para mabackup ang database.

```bash
mysqldump --user=IMOHANG_USER --password=IMOHANG_PASSWORD PANGALAN_SA_IMOHANG_DATABASE > "db.sql"
```

### Step 3. Pagkopya sa backup

Mao na to tanan. Karon, gikinahanglan nimo kopyahon ang nahimong backup ngadto padulong sa luwas nga dapit.


## Unsaon pag pag-backup sa EspoCRM gamit ang script

Pwede ka mugamit og script para e-backup ang tanan gikinahanglan nga data. Pag-login gamit ang SSH ug ipadagan ang musunod nga mga command (na testigan na kini sa Ubuntu server).

### Pag-download sa usa ka script

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Pagpadagan sa script

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
kung asa
 * `PATH_TO_ESPOCRM` kay ang path nga padulong sa naka-instolar na nga EspoCRM directory.
 * `BACKUP_PATH` kay ang path nga padulong sa backup nga directory.

Para sa mga Ubuntu na server kini kay:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Timan-e: Nga kong ang imong MySQL user kay walay katungod nga maglabay sa imohang database, pangayoan ka og credentials sa imohang laing MySQL nga user.

Pagkahuman sa pagbuhat, makadawat ka og path padulong sa nahimo nimong backup.

## Pagbalik sa EspoCRM gikan sa backup

Pwede nimong ibalik ang EspoCRM gikan sa backup mura sa gihulagway sa taas.

### Step 1. Pag-unarchive sa mga backup nga file

Para e-unarchive ang mga files, pwede kang mugamit og Archive Manager o ipadagan ang mga command sa ubos. Ang mga file kay gikinahanglan ilisan og mga web-server nga directory.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
kung asa:
 * `/var/www/html` kay usa ka web-server nga directory.

### Step 2. Pag-set sa mga gikinahanglan nga pagtugod

Ang mga file kay gikinahanglan gitag-iya sa usa ka web-server nga user and naay mga saktong pagtugot. Palihug e-set ang mga gikinahanglan nga mga permission gamit ang kaning mga pag-giya.[www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### Step 3. Pag-import sa database dump

Ang database dump kay gikinahanglan e-import padulong sa parehas nga database gamit ang parehas nga mga credentials, kung dili ang mga pagusab kay gikinahanglan usbon sulod sa konpigurasyon nga file `ESPOCRM_DIRECTORY/data/config.php`. Para e-import ang database gikan sa dump, ipadagan ang mga command sa ubos gikan sa terminal:

```bash
mysql --user=IMOHANG_USER_SA_DATABASE --password=IMOHANG_DATABASE_PASSWORD PANGALAN_SA_IMOHANG_DATABASE < db.sql
```

### Step 4. Tan-awon/Usbon ang crontab

Susiha kung sakto ang konpigyurason sa crontab. Ipadagan ang command sa ubos og susiha kung sakto ang path padulong sa EspoCRM:

```bash
sudo crontab -l -u www-data
```
kung asa:
 * `www-data` kay ang imohang web-server.

Kung naa kay mga pag-usab, gamita ni ang command sa ubos:

```bash
sudo crontab -l -u www-data
```

Ang uban pang mga detalye aron sa pagusab sa crontab kay makita sa [www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
