# Export Import extension

The Export Import extension is a tool for exporting and importing data in EspoCRM. It allows you to transfer files, settings and customizations between EspoCRM instances using CLI commands.

## Installing

You need to install the Export Import extension on your EspoCRM instance. Download the latest release package from the [GitHub repository](https://github.com/espocrm/ext-export-import/releases). Follow [instructions](https://docs.espocrm.com/administration/extensions/#installing) to install the extension.

## Usage

This extension works via console (CLI). Commands should be executed from the root directory of your EspoCRM instance.

There are two commands:

* `bin/command export-import export` (export)
* `bin/command export-import import` (import)

Each can be used with additional options. See examples below.

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

An export path. The default value is `build/ExportImport/Export`. Example: `--export-path="PATH"`. 

#### `--import-path`

An import path. The default value is `build/ExportImport/Import`. Example: `--import-path="PATH"`. 

#### `--entity-type-list`

An Entity Type list. If omitted, then all entity types are applied. Example: `--entity-type-list="ENTITY_TYPE1, ENTITY_TYPE2"`

Supported values:

* a string, e.g. `"Account"`;
* a string which is separated by a comma, e.g. `"Account, Contact"`;
* merge with a default list, e.g. `"__APPEND__, Account"`.

#### `--import-type`

An import type. The default value is `createAndUpdate`. Example: `--import-type="TYPE"`.

Available values: 

* `create`
* `createAndUpdate`
* `update`

#### `--pretty-print`

Store data in pretty print format. The default value is `false`.

Available values:

* `false`
* `true`

#### `--user-active`

A default user status for imported users. This applies to all user except the admin user with an ID `1`. The default value is `false`.

Available values:

* `false`
* `true`

#### `--user-password`

A user password for imported users. If omitted, then random values a generated. Example: `--user-password="PASSWORD"`.

For resetting the password, use `bin/command set-password [username]`. 

#### `--update-currency`

To update all currency fields. This option depends on [`currency`](#currency). If the `currency` option is not defined, the default currency will be used instead. The default value is `false`.

Available values:

* `false`
* `true`

#### `--currency`

Currency symbol. If not defined, the default currency will be used instead. Example: `--currency="USD"`.

#### `--customization`

Export/import all customization made for the instance. The default value is `false`.

Available values:

* `false`
* `true`

#### `--config`

Enable export / import configuration data. The default value is `false`. 

Available values:

* `false`
* `true`

#### `--update-created-at`

Current time for the createdAt field. The default value is `false`. 

Available values:

* `false`
* `true`

#### `--hard-export-list`

This option enables export feature for an entity which is disabled in `exportImportDefs`. Example: `--hard-export-list="ENTITY_TYPE"`. 

Available values:

* `a string`, e.g. `"Account"`,
* `a string which is separated by a comma`, e.g. `"Account, Contact"`.

#### `--hard-import-list`

This option enables import feature for an entity which is disabled in `exportImportDefs`. Example: `--hard-import-list="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"Account"`,
* `a string which is separated by a comma`, e.g. `"Account, Contact"`.

#### `--config-ignore-list`

Additional ignore list for the config. Ex. `--config-ignore-list="option"`. The default list is defined in `application/Espo/Modules/ExportImport/Resources/metadata/app/exportImport.json`.

Available values:

* `a string`, e.g. `"version"`,
* `a string which is separated by a comma`, e.g. `"version, useCache"`,
* `merge with a default list`, e.g. `"__APPEND__, useCache"`.
