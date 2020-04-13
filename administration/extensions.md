# Manage extensions

* [How to install an extension via UI](#extensions.md#how-to-install-an-extension-via-ui)
* [How to upgrade an extension via UI](#how-to-upgrade-an-extension-via-ui)
* [How to install or upgrade an extension via CLI](#how-to-install-or-upgrade-an-extension-via-cli)
* [How to uninstall an extension](#how-to-uninstall-an-extension)
* [How to delete an extension](#how-to-delete-an-extension)

## How to install an extension via UI

In order to install EspoCRM extension (e.g. Advanced Pack, VoIP Integration):

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Upload your extension package (zip file).
4. Click Install button.

## How to upgrade an extension via UI

In order to upgrade an already installed extension (e.g. Advanced Pack, VoIP integration) to a newer version:

1. Download the new version of needed extension.
2. Login as an administrator.
3. Go to Administration > Extensions.
4. Upload your new extension package (zip file) without uninstalling the already installed version.
5. Click Install button.

## How to install or upgrade an extension via CLI

In order to install or upgrade any EspoCRM extension you can utlize the next CLI command:

```
sudo -u <EspoCRM owner> php <path-to-EspoCRM-root-directory>/extension.php <path-to-the-zip-file>
```

* <EspoCRM owner> - command should be runned by the EspoCRM files owner (e.g. www-data, your-user, etc.).
* <path-to-EspoCRM-root-directory> - EspoCRM root directory where the extension.php script file is located (e.g. /var/www/html/espocrm/extension.php).
* <path-to-the-zip-file> - path to the extension zip file (e.g. /home/username/Downloads/advanced-pack-2.5.4.zip).

Example:

```
sudo -u www-data php /var/www/html/espocrm/extension.php /home/username/Downloads/advanced-pack-2.5.4.zip
```

## How to uninstall an extension

Steps to uninstall an installed extension:

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Find needed extension on the list of available extensions.
4. Click Uninstall button.

## How to delete an extension

When an extension is uninstalled, it is still available in the system. It can be completely deleted. Steps to delete an extension:

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Find the needed extension in the list of available extensions.
4. Click Remove button.
