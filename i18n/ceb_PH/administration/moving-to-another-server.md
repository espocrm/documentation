# Pagbalhin sa EspoCRM ngadto sa laing server

Sunda kini nga mga lakang aron mabalhin ang EspoCRM ngadto sa laing server:

### Step 1. Mga backup file

Pag-abli ug usa ka file manager o pag-login gamit ang SSH para i-archive ang tanang files nga pwede ma-archive gikan sa EspoCRM nga direktoryo: Mga dugang nga detalye: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### Step 2. Back-upi ang imohang database

Ang data nga nasulod sa database (MySQL, MariaDB) kay gikinahanglan naback-up. Palihug ug sunod sa mga rekomendasyon:
https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### Step 3. Kopyaha ang mga file ug mga database backup ngadto sa laing server

Pagkopya og mga backup nga mga file ug ang imohang database ngadto sa bag-ong server.

### Step 4. I-unarchive ang mga backup file

Para i-unarchive ang mga backup, pwede kang mugamit og Archive Manager o kani nga mga pagtudlo: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files. 
Timan-e: Ang mga file nanginahanglan nga iplastar ngadto sa web-server nga direktoryo.

### Step 5. I-configure ang usa ka server

I-configure ang usa ka bag-ong server base sa mga rekomendasyon diri: https://www.espocrm.com/documentation/administration/server-configuration/.

### Step 6. Sakto nga mga permission

I-set ang mga gikinahanglang mga permission og ang tag-iya sa mga file, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### Step 7. I-import ang imohang database backup

Una, gikinahanglan nimong muhimo og bag-o nga database gamit ang usa ka user sa MySQL. Para ma-import ang imohang database gikan sa backup, sunda ang kaning mga giya: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### Step 8. Sakto nga mga EspoCRM configuration

Human sa malampusong pag-import ug pag-configure sa server, palihug og usab para masakto ang EspoCRM nga mga configuration sa file nga `ESPOCRM_DIRECTORY/data/config.php`:

 * database connection settings:
  
  ```php
  'database' => [
        'driver' => 'pdo_mysql',
        'dbname' => 'PANGALAN_SA_IMONG_DATABASE',
        'user' => 'IMOHANG_USER',
        'password' => 'IMOHANG_DATABASE_PASSWORD',
        'host' => 'localhost',
        'port' => ''
    ],
  ```
   
   * "siteUrl" - kung ang pangalan sa imohang domain (URL) kay nausab:
  
  ```php
  'siteUrl' => 'https://new-link.com',
  ```
  
  * default files owner (kung lahi ra):
  
  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  kung asa ang `www-data` kay ang web-server nga user.

### Step 9. Pag-setup sa usa ka crontab

Pag-setup sa usa ka crontab, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
Timan-e: gikinahanglan i-configure kini gamit ang imohang web-server nga user.

Mao ra tong tanan. Karon, ang imohang EspoCRM instance kay nagdagan sa bag-o nga server.
