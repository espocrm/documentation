# How to upgrade EspoCRM

## Upgrade from CLI

This is the preferable way to upgrade.

Command to run:

```
php command.php upgrade
```

This command will check whether the next version is available, download it and install. Once the upgrade is complete, it will prompt to run the command again if a newer version is available.

!!! note

    Upgrading process may take a while. Do not close the terminal until it's finished.

!!! note

    If the next Espo version requires a higher PHP version, upgrade won't be processed, a message will be displayed.

It's recommended to upgrade whenever the new version is out. If you skip a few minor or major versions before deciding to upgrade, it's more likely that the upgrade will run unsmoothly. For minor or major releases it may be reasonable to wait for a few days before upgrading, as a very fresh release is likely to have yet undiscovered bugs.

!!! warning

    Upgrading between minor or major versions is not always a hands-off process. Incompatibility issues are possible if you have extensions or manual customizations. It is recommended to make a backup before proceeding to upgrade.

Versioning (X.Y.Z):

* X – major – incompatibility issues are very likely, very important to backup before upgrading;
* Y – minor – incompatibility issues are possible, recommended to backup before upgrading;
* Z – patch – no-brainer to upgrade.

## Recommendations

1. Make a [backup](backup-and-restore.md) before upgrading.
2. If the next Espo version requires a higher PHP version, upgrade your PHP (with all extensions). The PHP version you are upgrading to must be supported by your current Espo (usually you make a +2 minor version steps). After that, make sure your Espo is working, cron is running. Make sure that the new PHP version is applied to the CLI (command `php -v`) and to the web server (at Administration > System Requirements > PHP Version).
3. Make sure you have enough free disk space on the server.
4. Disable cron before upgrading (at Administration > Settings). Enable it back after upgrade is finished. This will prevent situations when a job started on the previous version and finished on the new version. In most cases this won't cause any issues though. The most significant problem it can cause is the job not being finished.
5. Enable *Maintenance Mode* before upgrading (at Administration > Settings). Disable after upgrade is finished. This will prevent non-admin users accessing the application before you started upgrading.
6. *opcache.enable_cli* parameter in PHP should be set to false (usually set to false by default).

It's recommended to run upgrade either under the webserver user (usually *www-data*) or *root* user.

## Additional parameters

Available parameters (only for advanced users):

- `-y` − run w/o user confirmation;
- `-s` − run an upgrade in a single process;
- `--file="EspoCRM-upgrade.zip"` − install a specific [upgrade package](https://www.espocrm.com/download/upgrades/) (path to file).

Example of using parameters:

```
php command.php upgrade -y --file="EspoCRM-upgrade.zip"
```

## Upgrade from UI

!!! warning

    This is not a recommended way to upgrade. It may cause problems as the upgrade will be processed in a single web server process.

#### Step 1. Check your current version

To check your current version, go to Administration > Upgrade page.

#### Step 2. Download needed upgrade packages

Go to the [download upgrade page](https://www.espocrm.com/download/upgrades/) and download needed packages (based on your current version).

#### Step 3. Run upgrade from Administration panel

Go to Administration > Upgrade. Upload and install upgrade packages one by one.

## Breaking changes

Espo upgrades should not break customizations made via the UI. But customizations made via code may break. To review breaking changes before upgrading, check release notes or GitHub issues marked with the *change* tag.

## Quick revert

If after upgrade the system does not work properly and you want to quickly revert the previous version, you can use this method. Note that this method is not equivalent to a full backup recovery.

1\. Download the previous version build from the [releases](https://github.com/espocrm/espocrm/releases) on GitHub.

2\. Remove the following folders in your problem instance:

- `application`
- `html`
- `public`
- `vendor`

3\. Copy all files from the downloaded build to the root directory of your instance. Exising files to be replaced.

4\. Fix [file permissions](server-configuration.md#permissions) if needed.

5\. Run rebuild:

```
php rebuild.php
```

## See also

* [Upgrading manually](upgrading-manually.md)
* [Troubleshooting](troubleshooting.md)

