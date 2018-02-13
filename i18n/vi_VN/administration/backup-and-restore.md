# Backup and Restore

## How to backup EspoCRM manually

EspoCRM consists of files and database data. All these data are needed in order to create a full backup of EspoCRM. Here are instructions on how to do it on Ubuntu server with MySQL.

### Step 1. Backup files

Create an archive of the directory content of installed EspoCRM. For Ubuntu the default path is `/var/www/html`. You may use this command:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

### Step 2. Backup database

To backup all your data, you have to know the database name and access credentials. You can find the database name in the configuration file `/ESPOCRM_DIRECTORY/data/config.php` under section `database`. You can use this command to backup your database:

```bash
mysqldump --user=YOUR_USER --password=YOUR_PASSWORD YOUR_DATABASE_NAME > "db.sql"
```

### Step 3. Copy the backup

That's all. Now, you have to copy the created backup to a safe place.


## How to backup EspoCRM with a script

You can use a script to backup all needed data. Login via SSH and run the commands (tested on Ubuntu server).

### Download a script

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/master/_static/scripts/backup.sh
```

### Run the script

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```
where
 * `PATH_TO_ESPOCRM` is a path to installed EspoCRM directory.
 * `BACKUP_PATH` is a path to backup directory.

For Ubuntu server it is:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Note: If your MySQL user doesn't have needed rights to dump your database, you will be promted to enter credentials of another MySQL user.

After successful creation, you will get a path to the created backup.

## Restore EspoCRM from a backup

You can restore EspoCRM from the backup created as described above.

### Step 1. Unarchive backup files

To unarchive files, you can use Archive Manager or run the below command. Files need to be placed in the web-server directory.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```
where:
 * `/var/www/html` is a web-server directory.

### Step 2. Set required permissions

The files should be owned by a web-server user and have correct permissions. Please set required permissions by following this instruction: [www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-required-permissions-for-unix-based-systems).

### Step 3. Import database dump

Database dump should be imported to the same database with the same user credentials, otherwise the correction should be made in the configuration file `ESPOCRM_DIRECTORY/data/config.php`. To import your database from the dump, run the command below in a terminal:

```bash
mysql --user=YOUR_DATABASE_USER --password=YOUR_DATABASE_PASSWORD YOUR_DATABASE_NAME < db.sql
```

### Step 4. Check/configure crontab

Check if your crontab is configured properly. Run the command below and check if a path to EspoCRM is correct:

```bash
sudo crontab -l -u www-data
```
where:
 * `www-data` is your web-server user.

If you have to make any changes, use this command:

```bash
sudo crontab -l -u www-data
```

More details about configuring crontab for EspoCRM is described here [www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab](https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab).
