# Console Commands

## Clear cache

```
php clear_cache.php
```

## Rebuild

```
php rebuild.php
```

Clears cache, rebuilds database.


## Changing user password

```
php command.php set-password [username]
```

where `[username]` is a user name, e.g. `admin`.

## Upgrade

```
php command.php upgrade
```

Upgrades EspoCRM instance to the next available version. The upgrade package is downloaded automatically. It may take a few steps to upgrade to the latest version, so you will need to run the same command a few times.

## Extension installing & upgrading

Installing:
```
php extension.php path/to/extension/package.zip
```

Installing or upgrading (since v5.9.0):

```
php command.php extension --file="path/to/extension/package.zip"
```

Uninstalling (since v5.9.0):

```
php command.php extension -u --name="Extension Name"
```

Uninstalling by ID (since v5.9.0):

```
php command.php extension -u --id="extension-ID"
```

## Running job

```
php command.php run-job JobName
```

where *JobName* is an intrernal name of the job you want to run.

Examples:

```
php command.php run-job Cleanup
php command.php run-job ProcessMassEmail
```
