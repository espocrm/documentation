# Managing extensions

## Installing

In order to install EspoCRM extension (e.g. Advanced Pack, VoIP Integration):

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Upload your extension package (zip file).
4. Click Install button.


## Upgrading

In order to upgrade an already installed extension (e.g. Advanced Pack, VoIP integration) to a newer version:

1. Download the new version of the needed extension.
2. Login as an administrator.
3. Go to Administration > Extensions.
4. Upload your new extension package (zip file) without uninstalling the already installed version.
5. Click Install button.

There's NO need to install intermediate versions. Install just the latest one.

## Uninstalling

Steps to uninstall an extension:

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Find the needed extension on the list of available extensions.
4. Click Uninstall button.


## Deleting

When an extension is uninstalled, it is still available in the system. It can be completely deleted. Steps to delete an extension:

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Find the needed extension in the list of available extensions.
4. Click Remove button.

## CLI commands

### Installing & upgrading

```
php command.php extension --file="path/to/extension/package.zip"
```

See more [commands](commands.md#extension).

!!! note

    In some cases installing extensions via CLI is preferable, as PHP configuration for CLI usually is not that limited as for webserver.
    Hence, it handles better such tasks as database index creation.
