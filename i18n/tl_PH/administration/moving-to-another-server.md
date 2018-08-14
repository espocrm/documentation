# Ang Paglilipat ng EspoCRM sa Ibang Server

Sundan ang mga step na ito para malipat ang EspoCRM sa ibang server:

### Unang Hakbang. Mga Backup na file

Buksan ang file manager o login sa pamamagitan ng SSH upang ma-archive lahat ng mga magagamit na file mula sa direktoryo ng EspoCRM. Mga karagdagang detalye: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### Pangalawang Hakbang. Mag-backup ng iyong database

Ang data na naka-istore sa database (MySQL, MariaDB) ay dapat na i-back up. Mangyaring sunding ang rekomendasyong ito: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### Pangatlong Hakbang. Kopyahin ang mga file at mga backup ng database backup sa isa pang server

Kopyahin ang mga backup ng mga file at ng iyong database sa isang bagong server.

### Pang-apat na Hakbang. Ang Pag-unarchive ng mga backup file

Upang ma-unarchive ang mga backup file, maaari mong gamiting ang Archive Manager o ang instruksyon na ito: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files. 
Tandaan: Kinakailangang mailagay ang mga file sa direktoryo ng web-server.

### Panglimang Hakbang. I-configure ang server

I-configure ang bagong server batay sa mga rekomendasyon dito: https://www.espocrm.com/documentation/administration/server-configuration/.

### Pang-anim na Hakbang. Itama ang mga Permiso

I-set ang mga kailangang permiso at mga may-ari ng file, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### Pangpitong Hakbang. I-import ang iyong database backup

Kailangan mo munang lumikha ng isang bagong database na may isang user sa MySQL. Para i-import ang iyong database mula sa backup, sundin ang instruksyon: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### Pangwalong Hakbang. Itama ang mga configuruation ng EspoCRM 

Pagkatapos na matagumpay na ma-import at ma-configure ang server, pakitama ang mga configuration ng EspoCRM sa file na `ESPOCRM_DIRECTORY/data/config.php`:

 * mga setting ng koneksyon sa database:
  
  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'YOUR_DATABASE_NAME',
        'user' => 'YOUR_USER',
        'password' => 'YOUR_DATABASE_PASSWORD',
        'host' => 'localhost',
        'port' => ''
    ],
  ```
   
   * "siteUrl" - kung ang pangalan ng iyong domain (URL) ay binago:
  
  ```php
  'siteUrl' => 'https://new-link.com',
  ```
  
  * default files owner (kung kakaiba lamang):
  
  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  kung saan ang `www-data` ay ang user ng iyong web-server.

### Pangsiyam na Hakbang. I-setup ang crontab

I-setup ang crontab, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
Tandaan: dapat itong i-configure sa ilalim ng user ng web-server.

Iyon lang. Ngayon, ang iyong EspoCRM ay tumatakbo na sa isang bagong server.
