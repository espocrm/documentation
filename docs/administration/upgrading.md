# How to upgrade EspoCRM

## Upgrade from CLI

Available from version 5.6.0.

This is **the most preferable** way to upgrade.

Command to run:

```
php command.php upgrade
```

This will check the next available version, download it and install. Once the upgrade is complete, it will prompt to run the command again, if a newer version is available.

Note: Upgrading process may take a while. Do not close the terminal until it's finished.

## Recommendations

1. Make a [backup](backup-and-restore.md) before upgrading.
2. Disable cron (at Administration > Settings) before upgrading. Enable it back after the upgrade is finished.
3. Enable *Maintenance Mode* (at Administration > Settings) before upgrading. Disable after the upgrade is finished.
4. Make sure you have free disk space on the server.

## Additional parameters

Available parameters (only for advanced users):

- `-y` − run w/o user confirmation;
- `-s` − run an upgrade in a single process;
- `--file="EspoCRM-upgrade.zip"` − install a specific upgrade package (path to file).

Example of using parameters:

```
php command.php upgrade -y --file="EspoCRM-upgrade.zip"
```

## Legacy way to upgrade

Before 5.6.0 version.

Execute the following command from EspoCRM root directory:

```
php upgrade.php /path/to/upgrade/package.zip
```

## Upgrade from UI

This is **not recommended** way to upgrade. It may cause problems.

#### Step 1. Check your current version

To check your current version, go to Administration > Upgrade page.

#### Step 2. Download needed upgrade packages

Go to the upgrade page https://www.espocrm.com/download/upgrades/ and based on your currect version download needed packages.

#### Step 3. Run upgrade from Administration panel

Go to Administration > Upgrade. Upload and install upgrade packages one by one.
