# How to upgrade EspoCRM

## Upgrade from CLI

Available from version 5.6.0.

This is the most preferable way to upgrade.

Command to run:

```
php command.php upgrade
```

This will check the next available version, download it and install. Once upgrade is complete it will prompt to run the command again, if a newer version is available.

## Recommendations

1. Make a [backup](backup-and-restore.md) before upgrading.
2. Disable cron at Administration > Settings before upgrading. Enable it back after upgrade is finished.
3. Enable 'Maintenance Mode' at Administration > Settings before upgrading. Disable after upgrade is finished.

## Upgrade from UI

#### Step 1. Check your current version

To check your current version go to Administration > Upgrade page.

#### Step 2. Download needed upgrade packages

Go to the upgrade page https://www.espocrm.com/download/upgrades/ and based on your currect version download needed packages.

#### Step 3. Create a backup (optional)

Create a backup of your EspoCRM files and data before upgrading. Follow [these instructions](backup-and-restore.md) to get it done.

#### Step 4. Upgrade process

Go to Administration > Upgrade. Upload and install one by one upgrade packages.

You can check whether you have the latest version at Menu > About.

## Applying upgrade package from CLI 

Execute the following command from EspoCRM root directory:

```
php upgrade.php /path/to/upgrade/package.zip
```

