# Backup and Restore

This article outlines backup and restore methods for EspoCRM in various environments:

* [Non-containerized installation](#non-containerized-installation)
* [Docker installation](#docker-installation)

## Non-containerized installation

Refers to a traditional installation that does not use containers.

### Backup with a script

You can use a script to back up all needed data. Login via SSH and run the commands (tested on the Ubuntu server).

#### Step 1. Download a script

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/stable/docs/_static/scripts/backup.sh
```

#### Step 2. Run the script

```bash
bash ./backup.sh PATH_TO_ESPOCRM BACKUP_PATH
```

where

 * `PATH_TO_ESPOCRM` is a path to installed EspoCRM directory
 * `BACKUP_PATH` is a path to backup directory

For Ubuntu server it is:

```bash
bash ./backup.sh /var/www/html /opt/backups
```

Note: If your MariaDB / MySQL user doesn't have needed rights to dump your database, you will be prompted to enter credentials of another MariaDB / MySQL user.

After successful creation, you will get a path to the created backup.

### Manual backup

To make a full backup of your EspoCRM instance you need to copy EspoCRM files and dump the database. Here are the instructions on how to do it on an Ubuntu server with MySQL or MariaDB.

#### Step 1. Back up files

Create an archive of the entire directory contents of the EspoCRM instance. You can use the following command:

```bash
tar -czf "files.tar.gz" -C /var/www/html .
```

The command above implies that the path to your instance is `/var/www/html`, which is usual default path on Linux servers. Modify it if needed.

#### Step 2. Back up database

To back up all your data, you have to know the database name and credentials for access. You can find the database name in the configuration file `/ESPOCRM_DIRECTORY/data/config-internal.php` under the section *database*. You can use this command to back up your database.

For MariaDB:

```bash
mariadb-dump --user=DATABASE_USER --password=DATABASE_PASSWORD DATABASE_NAME > "db.sql"
```

For MySQL:

```bash
mysqldump --user=DATABASE_USER --password=DATABASE_PASSWORD DATABASE_NAME > "db.sql"
```

#### Step 3. Copy the backup

That's all. Now, you have to copy the created backup to a safe place.

### Manual restore

You can restore the EspoCRM instance from the backup created as described above.

#### Step 1. Unarchive backup files

To unarchive files, you can use *Archive Manager* or run the below command. Files need to be placed in the web-server directory.

```bash
tar -xzf "files.tar.gz" -C /var/www/html
```

where `/var/www/html` is the web-server directory.

#### Step 2. Set required permissions

The files should be owned by the web-server user and have correct permissions. Set required permissions by following this [instruction](server-configuration.md#required-permissions-for-unix-based-systems).

#### Step 3. Import database dump

Database dump should be imported to the same database with the same user credentials, otherwise the correction should be made in the configuration file `ESPOCRM_DIRECTORY/data/config-internal.php`. To import your database from the dump, run the command below in a terminal:

For MariaDB:

```bash
mariadb --user=DATABASE_USER --password=DATABASE_PASSWORD DATABASE_NAME < db.sql
```

For MySQL:

```bash
mysql --user=DATABASE_USER --password=DATABASE_PASSWORD DATABASE_NAME < db.sql
```

#### Step 4. Check/configure crontab

Check if your crontab is configured properly. Run the command below and check if a path to EspoCRM is correct:

```bash
sudo crontab -l -u www-data
```

where `www-data` is your web-server user.

If you have to make any changes, use this command:

```bash
sudo crontab -l -u www-data
```

More details about configuring crontab see [here](server-configuration.md#setting-up-crontab).

## Docker installation

### Backup with a script

!!! important

    Script must be run from the host.

#### Step 1. Download a script

```bash
wget https://raw.githubusercontent.com/espocrm/documentation/stable/docs/_static/scripts/backup-docker-container.sh
```

#### Step 2. Run the script

Run one of the following commands at your choice:

```bash
sudo bash backup-docker-container.sh
```

or

```bash
sudo bash backup-docker-container.sh CONTAINER_NAME ./BACKUP_DIR
```

### Automatic backups

Backups can be scheduled on the host by adding the following entry to the crontab:

```
0 1 * * * sudo bash /opt/scripts/backup-docker-container.sh CONTAINER_NAME /backup/espocrm >> /backup/espocrm/backup.log 2>&1
```

### Manual backup

Run the following commands:

```bash
mkdir ./BACKUP_DIR

# Database
sudo docker exec CONTAINER_NAME mariadb-dump \
  -u DATABASE_USER --password=DATABASE_PASSWORD DATABASE_NAME \
  > ./BACKUP_DIR/db.sql

# Files
sudo docker exec CONTAINER_NAME tar czf - /var/www/html > ./BACKUP_DIR/files.tar.gz
```

### Manual restore

Run the following commands:

```bash
# Database
sudo docker exec -i CONTAINER_NAME mariadb \
  -u DATABASE_USER --password=DATABASE_PASSWORD DATABASE_NAME \
  < ./BACKUP_DIR/db.sql

# Files
sudo docker exec CONTAINER_NAME sh -c "rm -rf /var/www/html/*"
cat ./BACKUP_DIR/files.tar.gz | sudo docker exec -i CONTAINER_NAME tar xzf - -C /

# Restart
sudo docker restart CONTAINER_NAME
```
