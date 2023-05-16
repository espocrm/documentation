# Using the Export Import extension

Export Import extension is a tool for exporting and importing data in EspoCRM. It allows you to transfer files, settings and customizations between instances using commands launched in the CLI with a different set of parameters.

## Installing an Export Import extension

#### Step 1:

You need to install the extension directly into your instance. To do this, you need to go to the official repository of the Export Import extension on Github and download the [latest release](https://github.com/espocrm/ext-export-import/releases) in .zip format.

#### Step 2:

Follow [instructions](https://docs.espocrm.com/administration/extensions/#installing) to install extension in EspoCRM.

## Working with the Export Import extension

This extension works by executing commands in the terminal console (CLI). All commands must be running from the `{ESPO_ROOT}` directory.

Command base consists of:
* `bin/command export-import export` (for export),
* `bin/command export-import import` (for import).

Check out examples of commands:

#### Export

```
bin/command export-import export --format=json --export-path="build/ExportImport/Export" --pretty-print
```

#### Import

```
bin/command export-import import --format=json --import-path="build/ExportImport/Import" --import-type=createAndUpdate --user-password="pass"
```

## Avaliable options

#### `--export-path`

Define an export path. By default define `build/ExportImport/Export` path. Ex. `--export-path="PATH"`. 

#### `--import-path`

Define an import path. By default define `build/ExportImport/Import`. Ex. `--import-path="PATH"`. 

#### `--entity-type-list`

The needed Entity type list can be defined. If empty, then gets all Entity types. By default define all available entities. Ex. `--entity-type-list="ENTITY_TYPE1, ENTITY_TYPE2"`. Possible values:

* a string, e.g. `"Account"`,
* a string which is separated by a comma, e.g. `"Account, Contact"`,
* merge with a default list, e.g. `"__APPEND__, Account"`.

#### `--import-type`

Define an importing data type. By default define `createAndUpdate` type. Ex. `--import-type="TYPE"`. Possible values: 

* `create`,
* `createAndUpdate`,
* `update`.

#### `--pretty-print`

Store data in pretty print format. By default define `false` value. Possible values:

* `true`,
* `false`.

#### `--user-active`

Default user status for imported users. This applies to all user except admin user with ID `1`. By default define `false` value. Possible values:

* `true`,
* `false`.

#### `--user-password`

User password for imported users. If empty then generates random values. Ex. `--user-password="PASSWORD"`. For resetting the password use `bin/command set-password [username]`. 

#### `--update-currency`

Update all currency fields. This option is depends on [`currency`](#currency). If [`currency`](#currency) option is not defined, the default currency will be used instead. By default define `false` value. Possible values:

* `true`,
* `false`.

#### `--currency`

Currency symbol. If not defined, the default currency will be used instead. Ex. `--currency="USD"`.

#### `--customization`

Export / import all customization made for the instance. By default define `false` value. Possible values:

* `true`,
* `false`.

#### `--config`

Enable export / import configuration data. By default define `false` value. Possible values:

* `true`,
* `false`.

#### `--update-created-at`

The current time will be defined for the createAt field. By default define `false` value. Possible values:

* `true`,
* `false`.

#### `--hard-export-list`

This option enables export feature for an entity which is disabled in `exportImportDefs`. Ex. `--hard-export-list="ENTITY_TYPE"`. Possible values:

* `a string`, e.g. `"Account"`,
* `a string which is separated by a comma`, e.g. `"Account, Contact"`.

#### `--hard-import-list`

This option enables import feature for an entity which is disabled in `exportImportDefs`. Ex. `--hard-import-list="ENTITY_TYPE"`. Possible values:

* `a string`, e.g. `"Account"`,
* `a string which is separated by a comma`, e.g. `"Account, Contact"`.

#### `--config-ignore-list`

Additional ignore list for the config. Ex. `--config-ignore-list="option"`. Default: see at `application/Espo/Modules/ExportImport/Resources/metadata/app/exportImport.json`. Possible values:
* `a string`, e.g. `"version"`,
* `a string which is separated by a comma`, e.g. `"version, useCache"`,
* `merge with a default list`, e.g. `"__APPEND__, useCache"`.
