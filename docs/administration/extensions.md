# Managing extensions

## Installing

In order to install EspoCRM extension (e.g. Advanced Pack):

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Upload your extension package (zip file).
4. Click Install button.


## Upgrading

In order to upgrade an already installed extension to a newer version:

1. Download the new version of the needed extension.
2. Log in as an administrator.
3. Go to Administration > Extensions.
4. Upload your new extension package (zip file) without uninstalling the already installed version.
5. Click the **Install** button.

!!! note

    There's no need to install intermediate versions. Install just the latest one.

## Uninstalling

Steps to uninstall an extension:

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Find the needed extension on the list of available extensions.
4. Click **Uninstall** from the dropdown.

!!! note

    Uninstalling an extension does not cause data loss (unless the developer deliberately added such a logic). You can install the extension again and continue using it. Though, if you run a hard rebuild after uninstalling, it will remove all custom database columns added by the extension but it won't remove custom tables.

## Deleting

When an extension is uninstalled, it is still available in the system. It can be completely deleted. Steps to delete an extension:

1. Login as an administrator.
2. Go to Administration > Extensions.
3. Find the needed extension in the list of available extensions.
4. Click **Remove** from the dropdown.

## CLI commands

### Installing & upgrading

```
php command.php extension --file="path/to/extension/package.zip"
```

See more [commands](commands.md#extension).

!!! note

    In some cases, installing extensions via CLI is preferable, as usually PHP configuration for CLI is not as limited as for a web server.
    Hence, such tasks as database index creation are handled better.
