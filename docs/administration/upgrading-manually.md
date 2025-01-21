# Upgrading Manually

## Option 1. Migration

!!! note

    The minimal version you can upgrade from using this method is 7.1.0.
    The minimal version you can upgrade to using this method is 8.3.0.

!!! note

    This method assumes that all installed third party extensions have their files placed in the `custom` and `client/custom` directories.

!!! important

    This methods does not perform before-upgrade checks that the regular upgrade method does. After replacing the files manually, it's possible that your system won't work due to reasons like PHP version incompativility or customization incomatibility. The method is preferred for more experienced users.

Check all the [recommendations](https://docs.espocrm.com/administration/upgrading/#recommendations) before performing upgrade.

### 1. Replace files.

Replace all application files with files with files from a new version package. You need to delete all existing source files except the directories listed below.

The directories you must NOT delete:

* `data`
* `custom`
* `client/custom`

Make sure [file permissions](server-configuration.md#required-permissions-for-unix-based-systems) are correct.

### 2. Run migration.

Run the command:

```
bin/command migrate
```

It will run needed prepare and after-upgrade scripts, run rebuild. The version parameter in config will be updated.

## Option 2. Upgrade package

Manually replicating upgrade with an upgrade package.

!!! important

    Only for very experienced users. It's **not recommended** way to upgrade. We do not guarantee any success if you decide to upgrade this way.

If your environment is configured properly, the regular upgrade process via CLI should work fine.

In some cases it can be more reasonable to install a fresh instance, then copy your `custom` directory, `data/upload` directory, install all needed extensions.

The following actions are the same as those that the automatic upgrade script performs when you run *upgrade* command.

## 0. Check system requirements of the new version.

Whether your system suits for the new version. Sometimes we drop support of old PHP and MySQL versions.

### 1. Run rebuild.

Make sure no error occurred. If any error occurred it means your Espo instance is faulty and need to be fixed before upgrade.

### 2. Download an upgrade package. Unzip it.

Find a needed upgraded package at https://www.espocrm.com/download/upgrades/. If the needed package is not listed
you can try to compose an URL `https://www.espocrm.com/downloads/upgrades/EspoCRM-upgrade-{FROM}-to-{TO}.zip` by substituting the *from* and *to* versions.
Maybe the needed file exists but not listed on the page. Note that there are no packages that skip minor versions. *6.0.10* can be upgraded to *6.1.3* in one step but cannot to *6.2.0*.

### 3. Copy files from copyBefore

1. Check whether the directory `copyBefore` exists in the package. If it does not exist, then skip this step.
2. Copy all files from there to the root directory of your instance.
3. Run rebuild.

### 4. Run before-upgrade script.

Check whether the file `scripts/BeforeUpgrade.php` exists in the package. If it does not exist, then skip this step.

Create a file `BeforeUpgradeRunner.php` in the root directory of your instance:

```php
<?php
include "bootstrap.php";
require_once "BeforeUpgrade.php";

$app = new \Espo\Core\Application();

(new \BeforeUpgrade())->run(
    $app->getContainer()
);

```

Copy `scripts/BeforeUpgrade.php` to the root directory.

Run `BeforeUpgradeRunner.php`.

Run rebuild.

Remove created files.

### 5. Apply vendor files.

1. Check whether `vendorFiles` directory exists in the package. If it does not exist, then skip this step.
2. Replace the existing `vendor/autoload.php` file (in your instance) with `vendorFiles/autoload.php` (from the package).
3. Remove folders `vendor/*` (in your instance) that are presented in the upgrade packages in `vendorFiles` directory.
4. Copy all folders from `vendorFiles` directory (upgrade package) to `vendor` directory of your instance.

### 6. Remove unneeded files.

1. Open `manifest.json` file in any text editor.
2. Find the list of files under `delete` parameter.
3. Remove all these files from your instance.

### 7. Copy new and changed files.

Copy all files from `files` directory (upgrade package) to your the root directory of your instance.

### 8. Run rebuild.

### 9. Copy files from copyAfter

1. Check whether the directory `copyAfter` exists in the package. If it does not exist, then skip this step.
2. Copy all files
3. Run rebuild.

### 10. Run after-upgrade script.

Check whether the file `scripts/AfterUpgrade.php` exists in the package. If it does not exit, then skip this step.

To the same actions as for *before-upgrade*.

### 11. Change version in the config.

1. Open the file `data/config.php`.
2. Find the `version` parameter and change its value to the value of the version you upgraded to.

You can download the fresh instance and compare files using some tool. To make sure files are the same (except *custom* directory and installed extensions).

Make sure that file permissions are correct.
