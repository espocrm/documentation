# Moving EspoCRM to another server

Follow these steps to move EspoCRM to another server:

### Step 1. Backup files

Open a file manager or login via SSH to archive all available files from the EspoCRM directory. More details: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-backup-files.

### Step 2. Backup your database

The data stored in database (MySQL, MariaDB) should be backed up. Please follow this recommendation: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-2-backup-database.

### Step 3. Copy files and database backups to another server

Copy backups of files and of your database to a new server.

### Step 4. Unarchive backup files

To unarchive backup files, you can use Archive Manager or this instruction: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-1-unarchive-backup-files. 
Note: Files need to be placed in the web-server directory.

### Step 5. Configure a server

Configure a new server based on the recommendations here: https://www.espocrm.com/documentation/administration/server-configuration/.

### Step 6. Correct permissions

Set required permissions and files owner, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems.

### Step 7. Import your database backup

First, you have to create a new database with a user in MySQL. To import your database from the backup, follow the instuction: https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md#step-3-import-database-dump.

### Step 8. Correct EspoCRM configurations

After successfully importing and configuring the server, please correct EspoCRM configurations in the file `ESPOCRM_DIRECTORY/data/config.php`:

 * database connection settings:
  
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
   
   * "siteUrl" - if your domain name (URL) is changed:
  
  ```php
  'siteUrl' => 'https://new-link.com',
  ```
  
  * default files owner (only if different):
  
  ```php
  'defaultPermissions' => [
        'user' => 'www-data',
        'group' => 'www-data'
    ]
  ```

  where `www-data` is your web-server user.

### Step 9. Setup a crontab

Setup a crontab, https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.
Note: it should be configured under your web-server user.

That's all. Now, your EspoCRM instance is running on a new server.
