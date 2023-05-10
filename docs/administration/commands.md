# Console Commands

!!! note

    As of v7.0 you can run `bin/command` instead of `php command.php`.

## List of available commands

```
php command.php
```

## Clear cache

```
php clear_cache.php
```

## Rebuild

```
php rebuild.php
```

Clears cache, rebuilds database.

### Hard rebuild

*As of v7.4.*

```
php command.php rebuild --hard
```

Hard database rebuild. It will drop unused columns, decrease exceeding column lengths, fix index names, set proper collations. It won't drop unused tables (consider removing them manually).

Recommended to have a database backup before running hard rebuild.


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

See additional parameters [here](upgrading.md#additional-parameters).

## Extension


Installing or upgrading:

```
php command.php extension --file="path/to/extension/package.zip"
```

Uninstalling:

```
php command.php extension -u --name="Extension Name"
```

Uninstalling by ID:

```
php command.php extension -u --id="extension-ID"
```

## Running job

```
php command.php run-job JobName
```

where *JobName* is an internal name of the job you want to run.

!!! example

    ```
    php command.php run-job Cleanup
    php command.php run-job ProcessMassEmail
    ```

## Version

Print the current version:

```
php command.php version
```

## Setting user password

```
php command.php set-password {username}
```

where `{username}` is a user name, e.g. `admin`.

## Creating admin user

*As of v7.4.*

```
php command.php create-admin-user {username}
```

where `{username}` is a user name, e.g. `admin`.

Can be useful when you need to run an Espo instance from a repository without the need to go through UI installation.

## Import

See [here](import.md#console-commands).

## App info

```
php command.php app-info
```

With this command you can get some information about the application (container services, binding, jobs).
