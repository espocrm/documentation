# Installation by Script

This script automatically installs EspoCRM as a Docker image with NGINX server and MySQL database.

## Requirements

1. Operating system:

  * Ubuntu
  * Debian
  * Linux Mint

2. Access via command line.

3. Root or sudo access.

## Installation

Open your server's command line and run the commands:

```
wget https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
bash install.sh
```

## Installation with SSL/TLS certificate

```
wget https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
bash install.sh --ssl
```

## Installation without prompts

```
wget https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
bash install.sh -y --ssl --letsencrypt --domain=my-espocrm.com --email=email@my-domain.com
```

## Available options

#### `-y` or `--yes`

Skip confirmation prompts during installation.

#### `--ssl`

Installation with SSL/TLS certificate. Ex. `--ssl`. See [installation modes](#installation-modes).

#### `--letsencrypt`

Installation with a Let's Encrypt free certificate. Ex. `--ssl --letsencrypt`. See [installation modes](#1-lets-encrypt-free-certificate).

#### `--owncertificate`

Installation with an own SSL/TLS certificate. Ex. `--ssl --owncertificate`. See [installation modes](#2-own-ssltls-certificate).

#### `--domain`

Define your domain. Ex. `--domain=my-domain.com`.

#### `--email`

Email address for Let's Encrypt certificate. Ex. `--email=email@my-domain.com`.

#### `--clean`

Clean the existing EspoCRM installation and start a new one. This option can be used if you have already installed EspoCRM. Ex. `--clean`.

#### `--mysqlRootPassword`

Define your own MySQL root password instead of the automatically generated one. Ex. `--mysqlRootPassword=my-password`.

#### `--mysqlPassword`

Define your own MySQL password for EspoCRM installation. Ex. `--mysqlPassword=my-password`.

#### `--adminUsername`

Define a username of your EspoCRM administrator. Ex. `--adminUsername=admin`.

#### `--adminPassword`

Define a password of EspoCRM administrator. Ex. `--adminPassword=admin-password`.

#### `--command`

Update the `command.sh` for the existing instllation. Ex. `--command`.

#### `--backupPath`

A path for the backup. Ex. `--backupPath="/backup"`.

## Data

### Structure

```
.
├── data
│   ├── espocrm
│   ├── mysql
│   └── nginx
├── docker-compose.yaml
├── command.sh
```

### Storage location

All data are stored at:

```
/var/www/espocrm
```

## Installation modes

### 1. Let's Encrypt certificate

This certificate is a free of charge and can be used by providing an email address.

### 2. Own SSL/TLS certificate

If you need a high-security connection, you have to use your own SSL/TLS certificate. In this mode, EspoCRM will be installed with dummy certificates which should be replaced by real ones.

Post installation steps:

1. Go to your server directory `/var/www/espocrm/data/nginx/ssl/cert/`.

2. Replace the following certificates with your own:

    - fullchain.pem
    - privkey.pem

  **Important!**
  Your own certificates have to substitute the existing certificates and must have the same names.

3. Restart nginx server:

```
/var/www/espocrm/restart.sh espocrm-nginx
```

### 3. HTTP mode

This mode is recommended to use only if you don't have a domain name or want to use your IP address as a domain name.

## Changing installed mode

All the actions can be applied to already installed EspoCRM instance.

### From HTTP to Own SSL/TLS certificate

```
wget https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
bash install.sh --ssl --owncertificate --domain=my-espocrm.com
```

### From HTTP to Let's Encrypt certificate

```
wget https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
bash install.sh --ssl --letsencrypt --domain=my-espocrm.com --email=email@my-domain.com
```

### From Own SSL/TLS certificate to Let's Encrypt certificate

```
wget https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
bash install.sh --ssl --letsencrypt --domain=my-espocrm.com --email=email@my-domain.com
```

### Manually (advanced users only)

1. Stop your existing EspoCRM instance.

```
/var/www/espocrm/command.sh stop
```

2. Rename your existing directory:

```
mv /var/www/espocrm /var/www/espocrm-old
```

3. Run the installer in the required mode, e.g. `Let's Encrypt certificate` mode:

```
wget https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
bash install.sh --ssl --letsencrypt --domain=my-espocrm.com --email=email@my-domain.com
```

4. Copy your existing data to a new installation:

```
rm -rf /var/www/espocrm/data/espocrm
rm -rf /var/www/espocrm/data/mysql
cp -rp /var/www/espocrm-old/data/espocrm /var/www/espocrm/data
cp -rp /var/www/espocrm-old/data/mysql /var/www/espocrm/data
```

5. Update your `/var/www/espocrm/docker-compose.yml` file. You have to copy your existing options from `/var/www/espocrm-old/docker-compose.yml` for the services:
- `espocrm-mysql`
- `espocrm`

6. Restart services via the command:

```
/var/www/espocrm/command.sh restart
```

7. Login as administrator and update your new `Site URL` in Administration > Settings.

## Server management

The operation of EspoCRM consists of several services, such as `nginx`, `mysql`, `daemon`.

In order to update the command tool, see [update the command.sh](#update-the-commandsh).

### Status of services

```
/var/www/espocrm/command.sh status
```

### Restart services

```
/var/www/espocrm/command.sh restart
```

### Start services

```
/var/www/espocrm/command.sh start
```

### Build and start services

In order to apply changes in `docker-compose.yml`.

```
/var/www/espocrm/command.sh build
```

### Stop services

```
/var/www/espocrm/command.sh stop
```

### EspoCRM rebuild

```
/var/www/espocrm/command.sh rebuild
```

### EspoCRM upgrade

```
/var/www/espocrm/command.sh upgrade
```

### EspoCRM logs

```
/var/www/espocrm/command.sh logs
```

### Backup

Create a full backup of EspoCRM.

```
/var/www/espocrm/command.sh backup "BACKUP_DIRECTORY"
```

An example: `/var/www/espocrm/command.sh backup /var/www/espocrm-backup`.

### Restore

Restore the backup created by the `backup` command.

```
/var/www/espocrm/command.sh restore "BACKUP_PATH"
```

An example: `/var/www/espocrm/command.sh restore "/var/www/espocrm-backup/2023-01-01_142051.tar.gz"`.

### Clean

Delete old and unnecessary files.

```
/var/www/espocrm/command.sh clean
```

### Import the SQL dump

Import the database by the SQL dump created by `mysqldump`, `phpMyAdmin`, etc.

```
/var/www/espocrm/command.sh import-db "PATH/DB.sql"
```

An example: `/var/www/espocrm/command.sh restore "/var/www/espocrm-backup/db.sql"`.

### Help

In order to display a list of available commands.

```
/var/www/espocrm/command.sh help
```

## Logs

### Nginx logs

```
/var/www/espocrm/data/nginx/logs
```

### EspoCRM logs

```
/var/www/espocrm/data/espocrm/data/logs
```

## Update the command.sh

In order to load the latest version of the `command.sh`, run the command:

```
wget -N https://github.com/espocrm/espocrm-installer/releases/latest/download/install.sh
bash install.sh --command
```

## Modify PHP settings

This can be achieved by mounting the PHP configuration file and restaring the container.

1. Login via terminal to your server and open EspoCRM directory `/var/www/espocrm`:

```
cd /var/www/espocrm
```

2. Create the PHP configuration file:

```
mkdir -p data/php; \
nano data/php/espocrm.ini
```

    with the content:

```
expose_php = Off
display_errors = Off
display_startup_errors = Off
log_errors = On
memory_limit=256M
max_execution_time=180
max_input_time=180
post_max_size=30M
upload_max_filesize=30M
date.timezone=UTC
```

    then press `Ctrl + 0` and `Ctrl + X`

3. Mount the created PHP configuration file to the container:

```
nano docker-compose.yml
```

    add `./data/php/espocrm.ini:/usr/local/etc/php/conf.d/espocrm.ini` option for `espocrm` container as dispalyed below:

```
espocrm:
  ...
  volumes:
    - ./data/espocrm:/var/www/html
    - ./data/php/espocrm.ini:/usr/local/etc/php/conf.d/espocrm.ini
  ...
```

    then press `Ctrl + 0` and `Ctrl + X`

4. Restart the container to apply the changes:

```
./command.sh restart espocrm
```

## Modify Nginx settings

1. Login via terminal to your server and open EspoCRM directory `/var/www/espocrm`:

```
cd /var/www/espocrm
```

2. Edit the file `./data/nginx/conf.d/default.conf`

```
nano ./data/nginx/conf.d/default.conf
```

3. Restart the container to apply the changes:

```
./command.sh restart espocrm-nginx
```
