# Export Import extension

The Export Import extension is a tool for transferring data between EspoCRM instances using CLI commands.

What can be transferred:

* records
* settings
* customizations
* files

How it can be used:

* as a part of a continuous delivery pipeline (e.g. to transfer roles, workflows, BPM flowcharts from dev to production);
* for demo data;
* when migrating to another instance.

## Installing

You need to install the Export Import extension on your EspoCRM instance. Download the latest release package from the [GitHub repository](https://github.com/espocrm/ext-export-import/releases). Follow [instructions](https://docs.espocrm.com/administration/extensions/#installing) to install the extension.

## Usage

This is the documentation for Export Import v2. For v1 use this [documentation](export-import-usage-v1.md).

This extension works via console (CLI). Commands should be executed from the root directory of your EspoCRM instance.

There are two commands:

* `bin/command export-import export` (export)
* `bin/command export-import import` (import)

Each can be used with additional options. See examples below.

#### Export

```
bin/command export-import export --format=json --path="./data/export-import"
```

#### Import

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate
```

## Available options

#### `--y`

Confirmation of running the import. By default, a prompt will be displayed.

#### `--path`

An export / import path. The default value is `./data/export-import`. Example: `--path="PATH"`.

#### `--skip-data`

Skip exporting / importing data. By default the data will be exported / imported.

#### `--skip-customization`

Skip exporting / importing all customization made for the instance. By default the customization will be exported / imported.

#### `--skip-config`

Skip exporting / importing configuration data. By default the configuration data will be exported / imported.

#### `--skip-internal-config`

Skip exporting / importing internal configuration data which are stored at `config-internal.php`.
Use [`--user-password`](#user-password) in order to set a user password since the `passwordSalt` will not be exported / imported.

#### `--entity-list`

**Note:**

- For advanced users only.
- The defined list will be exported / imported only with data of `Many-to-One`, `One-to-One Right`, `Children-to-Parent` relationships.
- The `Many-to-Many`, `One-to-Many`, `One-to-One Left`, `Parent-to-Children` relationships for related entities should be defined in the list additionally.

A list of Entity Type. If omitted, then all entity types are applied. Example: `--entity-list="ENTITY_TYPE1, ENTITY_TYPE2"`

Supported values:

* a string, e.g. `"Account"`;
* a string which is separated by a comma, e.g. `"Account, Contact"`.

#### `--all-customization`

**Note**: This option works along with the `--entity-list` option only.

This option enables exporting / importing all customization, ignoring the `--entity-list` option.

#### `--skip-related-entities`

Skip exporting / importing data and customization for related entities. This option is used in conjunction with `--entity-list`. By default this option is `off`.

#### `--import-type`

An import type. The default value is `createAndUpdate`. Example: `--import-type="TYPE"`.

Available values:

* `create`
* `createAndUpdate`
* `update`

#### `--pretty-print`

Store data in a pretty print format. By default this option is `off`.

#### `--activate-users`

Activate all imported users. The `Is Active` option will be defined as `true`.

#### `--deactivate-users`

Deactivate all imported users. The `Is Active` option will be defined as false.
In order to keep at least one active user, use `--user-active-list="admin"`.

#### `--user-password`

A user password for all imported users. Example: `--user-password="PASSWORD"`.

For resetting the password, use `bin/command set-password [username]`.

#### `--clear-password`

Clear all exported / imported passwords. Example: `--clear-password"`.
Use [`--user-password`](#user-password) in order to set a user password.

#### `--update-currency`

To update all currency fields. This option depends on [`currency`](#currency). If the `currency` option is not defined, the default currency will be used instead. By default this option is `off`.

#### `--currency`

Currency symbol. If not defined, the default currency will be used instead. Example: `--currency="USD"`.

#### `--update-created-at`

Current time for the createdAt field. By default this option is `off`.

#### `--entity-hard-list`

This option allows to export or import data for entities which are disabled by default in `exportImportDefs` with the `"exportDisabled": true` or `"importDisabled": true` option. Example: `--entity-hard-list="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"ScheduledJob"`,
* `a string which is separated by a comma`, e.g. `"ScheduledJob, ScheduledJobLogRecord"`.

#### `--config-hard-list`

This option allows to export / import data for config options which are disabled by default. Ex. `--config-hard-list="CONFIG_OPTION"`.
The default list is defined in `application/Espo/Modules/ExportImport/Resources/metadata/app/exportImport.json`.

Available values:

* `a string`, e.g. `"database"`,
* `a string which is separated by a comma`, e.g. `"database, siteUrl"`.

## More usage

### Exporting data without passwords

```
bin/command export-import export --format=json --path="./data/export-import" --clear-password
```

### Customization only

#### Export

```
bin/command export-import export --format=json --path="./data/export-import" --skip-data --skip-config
```

#### Import

```
bin/command export-import import --format=json --path="./data/export-import" --skip-data --skip-config
```

### Customization for a single entity along with relationships

#### Export

```
bin/command export-import export --format=json --path="./data/export-import" --skip-data --skip-config --entity-list="Account"
```

#### Import

```
bin/command export-import import --format=json --path="./data/export-import" --skip-data --skip-config --entity-list="Account"
```

### Customization for a single entity without relationships

#### Export

```
bin/command export-import export --format=json --path="./data/export-import" --skip-data --skip-config --entity-list="Account" --skip-related-entities
```

#### Import

```
bin/command export-import import --format=json --path="./data/export-import" --skip-data --skip-config --entity-list="Account" --skip-related-entities
```

### Data, configuration, customization for a single entity along with relationships

#### Export

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Account"
```

#### Import

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate --entity-list="Account"
```

### Data, configuration, customization for a single entity without relationships

#### Export

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Account" --skip-related-entities
```

#### Import

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate --entity-list="Account" --skip-related-entities
```

## Advanced Pack usage

### Report

##### Export

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Report, ReportCategory, ReportFilter, ReportPanel" --skip-config --skip-customization --skip-related-entities
```

##### Import

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate
```

#### Custom entities

If the Target Entity of at least one of the reports is custom entity, you need to add it to the `--entity-list` option. Example:

##### Export

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Report, ReportCategory, ReportFilter, ReportPanel, CustomEntity" --skip-config --skip-customization --skip-related-entities
```

##### Import

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate
```

#### Custom fields

If the Target Entities of the reports are default entities, but at least one field in the one report is a custom field, you should add an `--all-customization` option and remove `--skip-customization` option. Example:

##### Export

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Report, ReportCategory, ReportFilter, ReportPanel" --skip-config --all-customization --skip-related-entities
```

##### Import

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate
```

### Workflow

If there are certain actions in the workflow, it's important to add the following entities to the `--entity-list` option (depending on the workflow actions):

- Send Email - EmailTemplate, User, Team
- Create Record - custom entity name if it is present in the action
- Create Related Record - custom entity name if it is present in the action
- Update Related Record - custom entity name if it is present in the action
- Link with another Record - custom entity name  if it is present in the action
- Unlink from another Record - custom entity name  if it is present in the action
- Apply Assignment Rule - Team, Report
- Create Notification - User, Team
- Make Followed - User, Team
- Start BPM Process - BpmnFlowchart

##### Export

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Workflow, WorkflowCategory, WorkflowCategoryPath" --skip-config --skip-customization --skip-related-entities
```

##### Import

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate
```

#### Custom entities

If the Target Entity of at least one of the workflows is custom entity, you need to add it to the `--entity-list` option. Example:

##### Export

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Workflow, WorkflowCategory, WorkflowCategoryPath, CustomEntity" --skip-config --skip-customization --skip-related-entities
```

##### Import

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate
```

### BPM

Depending on the presence of certain BPM elements, the following entities should be added to the `--entity-list` option:

- Task - see [Actions performance for Workflow and BPMs](#actions-performance)
- Send Message Task - EmailTemplate, User, Team
- User Task - Team

##### Export

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="BpmnFlowchart" --skip-config --skip-customization --skip-related-entities
```

##### Import

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate
```

#### Custom entities

If the Target Entity of at least one of the BPMs is custom entity, you need to add it to the `--entity-list` option. Example:

##### Export

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="BpmnFlowchart, CustomEntity" --skip-config --skip-customization --skip-related-entities
```

##### Import

```
bin/command export-import import --format=json --path="./data/export-import" --import-type=createAndUpdate
```
