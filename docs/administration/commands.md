---
search:
  boost: 2
---

# Console Commands

!!! note

    You can run `php command.php` instead of `bin/command`. May be reasonable if there's no execute permission for *bin/command*. To grant execute permission, run `chmod +x bin/command`.

!!! note

    On Unix-based systems, it is reasonable to run commands under the root (or web server) user.

## List of available commands

```
bin/command
```

## Clear cache

```
php clear_cache.php
```

## Rebuild

```
php rebuild.php
```

Clears cache, rebuilds database and other things.

### Hard rebuild

*As of v7.4.*

```
bin/command rebuild --hard
```

Hard database rebuild. It will drop unused columns, decrease exceeding column lengths, fix index names, set proper collations. It won't drop unused tables (consider removing them manually).

If a parameter `-y` is specified, it won't prompt for confirmation before running hard rebuild (as of v9.0).

Recommended to have a database backup before running hard rebuild.

## Changing user password

```
bin/command set-password [username]
```

Where `[username]` is a user name, e.g. `admin`.

## Upgrade

```
bin/command upgrade
```

Upgrades EspoCRM instance to the next available version. The upgrade package is downloaded automatically. It may take a few steps to upgrade to the latest version, so you will need to run the same command multiple times.

See additional parameters [here](upgrading.md#additional-parameters).

## Extension

Installing or upgrading:

```
bin/command extension --file="path/to/extension/package.zip"
```

Uninstalling:

```
bin/command extension -u --name="Extension Name"
```

Uninstalling by ID:

```
bin/command extension -u --id="extension-ID"
```

List all extensions:

```
bin/command extension -l
```

## Running job

```
bin/command run-job JobName
```

Where *JobName* is an internal name of the job you want to run.

!!! example

    ```
    bin/command run-job Cleanup
    bin/command run-job ProcessMassEmail
    ```

## Version

Print the current version:

```
bin/command version
```

## Setting user password

```
bin/command set-password {username}
```

Where `{username}` is a user name, e.g. `admin`.

## Creating admin user

*As of v7.4.*

```
bin/command create-admin-user {username}
```

Where `{username}` is a user name, e.g. `admin`.

Can be useful when you need to run an Espo instance from a repository without the need to go through UI installation.

## Import

See more detail [here](import.md#console-commands).

## App info

```
bin/command app-info
```

With this command you can get some information about the application (container services, binding, jobs, version).

## Update app timestamp

*As of v8.1.*

```
bin/command update-app-timestamp
```

Updates the app timestamp to the current time. When an Espo instance is updated or an extension is installed or uninstalled, the app timestamp is updated to let the browser know that the old cache is not actual anymore. Sometimes developers may need to update the app timestamp manually, for example, when writing custom JavaScript code.

## Populate scheduled jobs

*As of v10.0.*

```
bin/command populate-scheduled-jobs
```

Creates all default scheduled jobs if they don't exist. Can be used when installing the system via CLI.

## Rebuild category paths

```
bin/command rebuild-category-paths {EntityType}
```

Rebuilds category paths. For example, for DocumentFolder, WorkflowCategory. May be needed if for some reason paths data is corrupted resulting in not working expanded mode in the list view with categories.

## Populate array values

```
bin/command populate-array-values {EntityType} {field}
```

Populates entries in the `array_value` table for a specific field based on the column value. In some circumstances, the values may become out of sync, causing search to not work correctly. Concerns Multi-Enum, Array, Checkbox, and URL-Multiple fields.

## Config get

*As of v10.0.*

Print a config parameter value:

```
bin/command config:get {param}
```

Print in JSON:

```
bin/command config:get {param} --json
```

Note: In the examples, `{param}` is a placeholder, curly braces should not be used.

## Config set

*As of v10.0.*


Set a value (implies string type):

```
bin/command config:set {param} {value}
```

Set with type:

```
bin/command config:set {param} true --type=bool
```

Supported types: `string`, `bool`, `int`, `float`, `json`, `auto`. If the type is not specified, the input value is treated as string. Always specify the type if the stored parameter value must be anything other than string.

Set a value passed in JSON:

```
bin/command config:set {param} [\"one\", \"two\"] --type=json
```

Set a nested parameter:

```
bin/command config:set database.host localhost
```

Note: In the examples, `{param}` and `{value}` are placeholders, curly braces should not be used.
