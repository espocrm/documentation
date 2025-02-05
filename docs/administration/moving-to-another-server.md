# Moving EspoCRM to another server

Follow these steps to move EspoCRM to another server.

### Step 1. Backup files

Open a file manager or login via SSH to archive all available files from the EspoCRM directory. See [more details](backup-and-restore.md#step-1-back-up-files).

### Step 2. Backup your database

The data stored in the database (MySQL, MariaDB or PostgreSQL) should be backed up. Follow this [recommendation](backup-and-restore.md#step-2-back-up-database).

### Step 3. Copy files and database backups to another server

Copy the backups of files and your database to a new server.

### Step 4. Unarchive backup files

To unarchive the backup files, you can use Archive Manager or this [instruction](backup-and-restore.md#step-1-unarchive-backup-files).
Note: Files need to be placed in the web-server directory.

### Step 5. Configure a server

Configure a new server based on the recommendations [here](server-configuration.md).

### Step 6. Correct permissions

Set proper permissions and file ownership, see [here](server-configuration.md#required-permissions-for-unix-based-systems).

### Step 7. Import your database backup

First, you have to create a new database with a user in MySQL/MariaDB/PostgreSQL. To import your database from the backup, follow these [instructions](backup-and-restore.md#step-3-import-database-dump).

### Step 8. Correct EspoCRM configurations

After successfully importing and configuring the server, correct EspoCRM config parameters in the files `data/config-internal.php` and  `data/config.php`.

Database connection settings:

```php
'database' => [
    'driver' => 'pdo_mysql',
    'dbname' => 'YOUR_DATABASE_NAME',
    'user' => 'YOUR_USER',
    'password' => 'YOUR_DATABASE_PASSWORD',
    'host' => 'localhost',
    'port' => '',
],
```

Site URL, if your domain name (URL) has changed:

```php
'siteUrl' => 'https://new-link.com',
```

Default file owner (only if the new web server has a different user/group):

```php
'defaultPermissions' => [
    'user' => 'www-data',
    'group' => 'www-data',
],
```

where `www-data` is your web-server user.

### Step 9. Setup a crontab

Setup a [crontab](server-configuration.md#setting-up-crontab).

!!! note

    it should be configured under your web-server user.

Now, your EspoCRM instance is running on the new server.
