# Compare changes

The export feature is available in [Export Import](https://github.com/espocrm/ext-export-import/releases) extension.

## Usage

In order to use the compare feature, you need to have an exported data (e.g. from a backup).

This extension works via console (CLI). Commands should be executed from the `root directory of your EspoCRM instance`.

```bash
bin/command export-import compare --format=json --path="./data/export-import" --result-path="./data/export-import-result" --compare-type="all" --entity-list="Account" --skip-related-entities --pretty-print --info
```

Each can be used with additional options. See examples below.

## Result

The result will be in a JSON format, so you can use `Total Commander`, `Double Commander` or even `git` to compare the results.

### Statuses

For each entity, the following statuses may be shown:

* `Total`: total number of compared records.
* `Created`: number of created records.
* `Modified`: number of modified records.
* `Skipped (both modified)`: number of modified records that have already been modified by another user or workflow. This is where records can be checked manually. To enable this folder, use `--info` and `--from-date` options.
* `Unmodified`: number of unmodified records.
* `Deleted`: number of deleted records.

### Data structure

This folder will contain data in a separate sub-folders:

```
.
├── changed
│   ├── actual
│   ├── prev
├── skipped
│   ├── actual
│   ├── prev
```

* `changed` folder contains the changed data.
* `skipped` folder contains the both modified data that is skipped based on modifications found in the `modifiedAt` attribute, `Stream`, `Action History` and `Workflow Log`. To enable this folder, use `--info` and `--from-date` options.

## Available options

#### `--y`

Confirmation of running the import. By default, a prompt will be displayed.

#### `--path`

A path for earlier exported data. The default value is `./data/export-import`. Example: `--path="PATH"`.

#### `--result-path`

A path for the comparison result. The default value is `./data/export-import-result`. Example: `--result-path="PATH"`.

#### `--compare-type`

A compare type. By default will be compared `all` records. Example: `--compare-type="TYPE"`.

Available options:

* `all`
* `created`
* `updated`
* `deleted`

#### `--skip-data`

Skip comparison of changed data. By default, the data will be compared.

#### `--skip-customization`

**Note:** not yet implemented.

Skip customization comparison made for the instance. By default, all customization will be compared.

#### `--skip-config`

**Note:** not yet implemented.

Skip configuration comparison of the instance. By default, all configuration data will be compared.

#### `--skip-internal-config`

**Note:** not yet implemented.

Skip comparison of internal configuration data which are stored at `config-internal.php`.
Use [`--user-password`](#user-password) in order to set a user password since the `passwordSalt` will not be exported / imported.

#### `--entity-list`

!!! note

    - For advanced users only.
    - The defined list will be imported only with data of `Many-to-One`, `One-to-One Right`, `Children-to-Parent` relationships.
    - The `Many-to-Many`, `One-to-Many`, `One-to-One Left`, `Parent-to-Children` relationships for related entities should be defined in the list additionally.

A list of Entity Type. If omitted, then all entity types are applied. Example: `--entity-list="ENTITY_TYPE1, ENTITY_TYPE2"`

Supported values:

* a string, e.g. `"Account"`;
* a string which is separated by a comma, e.g. `"Account, Contact"`.

#### `--all-customization`

**Note**: This option works along with the `--entity-list` option only.

This option allows you to compare all customization, ignoring the `--entity-list' option.

#### `--skip-related-entities`

Skip comparison of data and customization for related entities. This option is used in conjunction with `--entity-list`. By default, this option is `off`.

#### `--pretty-print`

Store data in a pretty print format. By default this option is `off`.

#### `--info`

Display information about skipped modifications. By default this option is `off`.

#### `--from-date`

The date and time in UTC from which the comparison will be made. By default this option is `off`. Example: `--from-date="2025-01-01 00:00:00"`

#### `--skip-modified-at`

Skip comparison of `modifiedAt` attribute. By default this option is `off`.

#### `--skip-stream`

Skip looking for modifications in a stream. By default this option is `off`.

#### `--skip-action-history`

Skip looking for modifications in Action History. By default this option is `off`.

#### `--skip-workflow-log`

Skip looking for modifications in Workflow Log. By default this option is `off`.

#### `--skip-attribute-list`

Skip comparison of attribute list. By default all attributes will be compared. Example: `--skip-attribute-list="name, Account.description, Call.firstName"`.

Possible values:

* a global attribute, e.g. `"name"`.
* a local attribute, e.g. `"Account.description, Call.firstName"`.

#### `--user-skip-list`

Define a list of users to be skipped. The value can be a list of `ID` or `User Name`. Example: `--user-skip-list="admin"`.

Available values:

* `a string`, e.g. `"admin"`,
* `a string which is separated by a comma`, e.g. `"admin, 65d34ab18e81e286e"`.

#### `--entity-skip-list`

This option allows to compare data for defined entities. Example: `--entity-skip-list="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"Account"`,
* `a string which is separated by a comma`, e.g. `"Account, Contact"`.

#### `--entity-hard-list`

This option allows to export or import data for entities which are disabled by default, in `exportImportDefs` with the `"exportDisabled": true` or `"importDisabled": true` option. Example: `--entity-hard-list="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"ScheduledJob"`,
* `a string which is separated by a comma`, e.g. `"ScheduledJob, ScheduledJobLogRecord"`.

#### `--config-hard-list`

**Note:** not yet implemented.

This option allows to compare data for config options which are disabled by default. Ex. `--config-hard-list="CONFIG_OPTION"`.
The default list is defined in `application/Espo/Modules/ExportImport/Resources/metadata/app/exportImport.json`.

Available values:

* `a string`, e.g. `"database"`,
* `a string which is separated by a comma`, e.g. `"database, siteUrl"`.

## Use cases

### Complete process for comparison

This example will show how to compare your production data with data from a backup.

1. Restore your backup to a temporary instance. For example you have a backup from `2025-01-01 01:00:00`.

2. Install [Export Import](https://github.com/espocrm/ext-export-import/releases) extension.

3. Run the export command to create a dump of your previous data:

```bash
bin/command export-import export --format=json --path="./data/export-import"
```

4. Install [Export Import](https://github.com/espocrm/ext-export-import/releases) extension on your production instance.

5. Copy the exported data from the step 3 to your production server.

6. Run the comparison command on your production instance:

```bash
bin/command export-import compare --format=json --path="./data/backup-data/export-import" --result-path="./data/export-import-result" --compare-type=all --from-date="2025-01-01 01:00:00" --pretty-print --info
```

* `--from-date` - the date and time in UTC from which the comparison will be made.

7. Check the result in the `./data/export-import-result` directory. See [Result](#result) section.

### Restoring data

!!! note

    Before you start this process, make sure that you have a backup of your production data.

1. Follow the 1-5 steps described in [Complete process for comparison](#complete-process-for-comparison) section.

2. Run the comparison command on your production instance:

```bash
bin/command export-import compare --format=json --path="./data/backup-data/export-import" --result-path="./data/export-import-result" --compare-type=updated --from-date="2025-01-01 01:00:00" --pretty-print --info
```

3. If the comparison result is OK, then you can import the data to your production instance:

```bash
bin/command export-import import --format=json --path="./data/export-import-result/changed/prev" --import-type=update
```

### Compare data when modifiedAt is changed daily by a workflow

For understanding how to compare data, see [Complete process for comparison](#complete-process-for-comparison) section.

```bash
bin/command export-import compare --format=json --path="./data/export-import" --result-path="./data/export-import-result" --compare-type=all --from-date="2025-01-01 01:00:00" --pretty-print --info --skip-modified-at
```

### Compare data when an attribute is changed daily by a workflow

For understanding how to compare data, see [Complete process for comparison](#complete-process-for-comparison) section.

```bash
bin/command export-import compare --format=json --path="./data/export-import" --result-path="./data/export-import-result" --compare-type=all --from-date="2025-01-01 01:00:00" --pretty-print --info --skip-modified-at --skip-attribute-list="Lead.cAge"
```
