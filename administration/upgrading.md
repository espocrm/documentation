# How to upgrade EspoCRM

EspoCRM can be upgraded to the latest version by the following steps:

### Step 1. Check your current version

To check your current version go to Administration > Upgrade page.

### Step 2. Download needed upgrade packages

Go to the upgrade page https://www.espocrm.com/download/upgrades/ and based on your currect version download needed packages.

### Step 3. Create a backup (optional)

Create a backup of your EspoCRM files and data before upgrading. Follow [these instructions](https://github.com/espocrm/documentation/blob/master/administration/backup-and-restore.md) to get it done.

### Step 4. Upgrade process

Go to Administration > Upgrade. Upload and install one by one upgrade packages.

You can check whether you have the latest version at Menu > About.

## Upgrade via CLI

You can also run upgrade via command line interface. You need to execute the following command from EspoCRM root directory:

```
php upgrade.php /path/to/upgrade/package.zip
```
