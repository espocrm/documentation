# Ang Pag-back up at Pag-restore

## Paano mag-backup ng EspoCRM nang mano-mano

Ang EspoCRM ay binubuo ng mga file at data ng database. Kailangan ang lahat ng data na ito upang lumikha ng isang buong backup ng EspoCRM. Narito ang mga instruction kung paano ito gagawain sa Ubuntu server sa pamamagitan ng MySQL.

### Unang Hakbang. Ang pag-backup ng files

Gumawa ng isang archive ng mga nilalaman ng direktoryo kung saan naka-install ang EspoCRM. Para sa Ubunto, ang default path ay `/var/www/html`. Maaari mong gamitin ang command na ito: 

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Pangalawang Hakbang. Ang pag-backup ng database

Upang i-backup ang lahat ng iyong data, kailangan mong alamin ang pangalan ng database at access kredensyal. Maaari mong hanapin ang pangalan ng database sa configuration file `/ESPOCRM_DIRECTORY/data/config.php` sa ilalim ng seksyon na `database`. Maaari mong gamitin ang command na ito up[ang i-backup ang iyong database.

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### Pangatlong Hakbang. Kopyahin ang backup

Iyon lang. Ngayon, kailangan mong kopyahin ang ginawa mong backup sa isang ligtas na lugar.

## Paano i-backup ang EspoCRM gamit ang script

Pwede kang gumamit ng script para mag-backup ng lahat ng kinakailangan mong data. Mag-login gamit ang SSH at patakbohin ang mga command (nasubukan ito sa Ubuntu na server).

### I-download ang script

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Ipatakbo ang script

```bash
bash ./backup.sh PATH_PATUNGO_SA_ESPOCRM BACKUP_NA_PATH
```
kung saan
 * `PATH_TO_ESPOCRM` ay isang path para mainstall ang EspoCRM na directory.
 * `BACKUP_PATH` ay isang path patungo sa backup na directory.

Para sa Ubuntu server ito ay:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Tandaan: Kung ang iyong MySQL na user ay wala right na mag-dump ng iyong database, ikaw ay sasabihan na mag enter ng mga kredensiyal ng iyong ibang user.

Pagkatapos nga pagkagawa, ikaw ay bibigyan ng path patungo sa nagawang backup.

## Pag-restore ng EspoCRM galing sa backup

Pwede mong irestore ang EspoCRM galing sa backup na nagawa mo gamit ang mga instruction sa taas.

### Unang Hakbang. I-unarchive ang mga backup file

Para i-unarchive ang mga file, pwede mong gamitin ang Archive Manager o ipatakbo ang command sa baba. Ang mga file ay kinakailangan na ilagay sa web-server na directory.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
kung saan:
 * `/var/www/html` ay isang web-server na directory.

### Pangalawang Hakbang. I-set ang mga kinakailangang mga permission

Ang mga file ay kinakailangang pag-aari ng isang web-server na user at mayroon itong mga saktong mga permission. Paki-set ang mga kinakailangang mga permission gamit ang mga sumusunod na mga instruction: [www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### Pangatlong Hakbang. I-import ang database dump

Ang database dump ay dapat naimport sa parehong database gamit ang parehong user credentials, dahil kong hindi ang koreksyon ay dapat ginawa sa loob ng configuration file `ESPOCRM_DIRECTORY/data/config.php`. Para maimport ang iyong database galing sa dump, ipatakbo ang command sa ibaba sa loob ng isang terminal:

```bash
mysql --user=IYONG_DATABASE_USER --password=IYONG_DATABASE_PASSWORD IYONG_DATABASE_NAME < db.sql
```

### Pang-apat na Hakbang. I-check/I-configure ang crontab

I-check kung ang iyong crontab ay naconfigure ng maayos. Ipatakbo ang command sa ibaba at i-check kung ang path patungo sa EspoCRM ay tama:

```bash
sudo crontab -l -u www-data
```
kung saan:
 * `www-data` ay ang iyong web-server user.

If you have to make any changes, use this command:
Kung kailangan mong gumawa ng mga pagbabago, gamitin ang command na ito:

```bash
sudo crontab -l -u www-data
```

Para sa iba pang mga detalye tungkol sa pag-configure ng crontab para sa EspoCRM na inilarawan dito  [www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
