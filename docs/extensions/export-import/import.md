# Import

The import feature is available in the [Export Import](https://github.com/espocrm/ext-export-import/releases) extension.

## Usage

This extension works via console (CLI). Commands should be executed from the `root directory` of your EspoCRM instance.

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate
```

## Available options

#### `--y`

Confirmation of running the import. By default, a prompt will be displayed.

#### `--path`

An import path. The default value is `./data/export-import`. Example: `--path="PATH"`.

#### `--skip-data`

Skip importing data. By default, all data will be imported.

#### `--skip-customization`

Skip importing all customization made for the instance. By default, all customization will be imported.

#### `--skip-config`

Skip importing configuration data. By default, all configuration data will be imported.

#### `--skip-internal-config`

Skip importing internal configuration data which are stored at `config-internal.php`.
Use [`--user-password`](#-user-password) in order to set a user password since the `passwordSalt` will not be imported.

#### `--entity-list`

!!! note

    - For advanced users only.
    - The defined list will be imported only with data of `Many-to-One`, `One-to-One Right`, `Children-to-Parent` relationships.
    - The `Many-to-Many`, `One-to-Many`, `One-to-One Left`, `Parent-to-Children` relationships for related entities should be defined in the list additionally.

A list of Entity Types. If omitted, then all entity types are applied. Example: `--entity-list="ENTITY_TYPE1, ENTITY_TYPE2"`

Supported values:

* a string, e.g. `"Account"`;
* a string which is separated by a comma, e.g. `"Account, Contact"`.

#### `--all-customization`

**Note**: This option works along with the `--entity-list` option only.

This option enables importing all customization, ignoring the `--entity-list` option for customization.

#### `--skip-related-entities`

Skip importing data and customization for related entities. This option is used in conjunction with `--entity-list`. By default, this option is `off`.

#### `--import-type`

An import type. The default value is `createAndUpdate`. Example: `--import-type="TYPE"`.

Available values:

* `create`
* `createAndUpdate`
* `update`

#### `--activate-users`

Activate all imported users. The `Is Active` option will be defined as `true`.

#### `--deactivate-users`

Deactivate all imported users. The `Is Active` option will be defined as false.
In order to keep at least one active user, use `--user-active-list="admin"`.

#### `--user-active-list`

Define a list of active users. The value can be a list of `ID` or `User Name`. Other users will be deactivated. Example: `--user-active-list="admin"`.

Available values:

* `a string`, e.g. `"admin"`,
* `a string which is separated by a comma`, e.g. `"admin, 65d34ab18e81e286e"`.

#### `--user-skip-list`

Define a list of users to be skipped. The value can be a list of `ID` or `User Name`. Example: `--user-skip-list="admin"`.

Available values:

* `a string`, e.g. `"admin"`,
* `a string which is separated by a comma`, e.g. `"admin, 65d34ab18e81e286e"`.

#### `--user-password`

A user password for all imported users. Example: `--user-password="PASSWORD"`.

For resetting the password, use `bin/command set-password [username]`.

#### `--skip-password`

Skip changing passwords for existing users. Example: `--skip-password`.
Use [`--user-password`](#-user-password) in order to set a user password.

#### `--update-currency`

To update all currency fields. This option depends on [`currency`](#-currency). If the `currency` option is not defined, the default currency will be used instead. By default, this option is `off`.

#### `--currency`

Currency symbol. If not defined, the default currency will be used instead. Example: `--currency="USD"`.

#### `--update-created-at`

Current time for the `createdAt` field. By default, this option is `off`.

#### `--entity-skip-list`

This option allows to skip importing data for defined entities. Example: `--entity-skip-list="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"Account"`,
* `a string which is separated by a comma`, e.g. `"Account, Contact"`.

#### `--entity-hard-list`

This option allows to import data for entities which are disabled by default, in `exportImportDefs` with the `"exportDisabled": true` or `"importDisabled": true` option. Example: `--entity-hard-list="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"ScheduledJob"`,
* `a string which is separated by a comma`, e.g. `"ScheduledJob, ScheduledJobLogRecord"`.

#### `--config-hard-list`

This option allows to import data for config options which are disabled by default. Ex. `--config-hard-list="CONFIG_OPTION"`.
The default list is defined in `application/Espo/Modules/ExportImport/Resources/metadata/app/exportImport.json`.

Available values:

* `a string`, e.g. `"database"`,
* `a string which is separated by a comma`, e.g. `"database, siteUrl"`.

#### `--entity-import-type-create`

This option allows to define a custom `create` import type for specified entity types. Example: `--entity-import-type-create="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"User"`,
* `a string which is separated by a comma`, e.g. `"Account, Contact"`.

#### `--entity-import-type-update`

This option allows to define a custom `update` import type for specified entity types. Example: `--entity-import-type-update="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"User"`,
* `a string which is separated by a comma`, e.g. `"Account, Contact"`.

#### `--entity-import-type-create-and-update`

This option allows to define a custom `createAndUpdate` import type for specified entity types. Example: `--entity-import-type-create-and-update="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"User"`,
* `a string which is separated by a comma`, e.g. `"Account, Contact"`.

## Use cases

### Keep passwords for existing users

```
bin/command export-import import --format=json --path="./data/export-import" --skip-internal-config --skip-password
```

### Import customization only

```
bin/command export-import import --format=json --path="./data/export-import" --skip-data --skip-config
```

### Import customization for a single entity along with relationships

```
bin/command export-import import --format=json --path="./data/export-import" --skip-data --skip-config --entity-list="Account"
```

### Import customization for a single entity without relationships

```
bin/command export-import import --format=json --path="./data/export-import" --skip-data --skip-config --entity-list="Account" --skip-related-entities
```

### Import data, configuration, customization for a single entity along with relationships

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate --entity-list="Account"
```

### Import data, configuration, customization for a single entity without relationships

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate --entity-list="Account" --skip-related-entities
```
