# Export

The export feature is available in the [Export Import](https://github.com/espocrm/ext-export-import/releases) extension.

## Usage

This extension works via console (CLI). Commands should be executed from the `root directory` of your EspoCRM instance.

```
bin/command export-import export --format=json --path="./data/export-import"
```

## Available options

#### `--y`

Confirmation of running the import. By default, a prompt will be displayed.

#### `--path`

An export path. The default value is `./data/export-import`. Example: `--path="PATH"`.

#### `--skip-data`

Skip exporting data. By default, all data will be exported / imported.

#### `--skip-customization`

Skip exporting all customization made for the instance. By default, all customization will be exported.

#### `--skip-config`

Skip exporting configuration data. By default, all configuration data will be exported.

#### `--skip-internal-config`

Skip exporting internal configuration data which are stored at `config-internal.php`.
Use [`--user-password`](import.md/#-user-password) in order to set a user password since the `passwordSalt` will not be exported.

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

This option enables exporting all customization, ignoring the `--entity-list` option for customization.

#### `--skip-related-entities`

Skip exporting data and customization for related entities. This option is used in conjunction with `--entity-list`. By default, this option is `off`.

#### `--pretty-print`

Store data in a pretty print format. By default this option is `off`.

#### `--user-skip-list`

Define a list of users to be skipped. The value can be a list of `ID` or `User Name`. Example: `--user-skip-list="admin"`.

Available values:

* `a string`, e.g. `"admin"`,
* `a string which is separated by a comma`, e.g. `"admin, 65d34ab18e81e286e"`.

#### `--skip-password`

Skip exporting passwords and changing passwords for existing users. Example: `--skip-password`.
Use [`--user-password`](import.md/#-user-password) in order to set a user password.

#### `--from-date`

Export data from a specific date and time. All data before this date will be ignored. Applies only to entities with a `modifiedAt` field.
The date should be in UTC and in the format *YYYY-MM-DD HH:mm:ss*.
By default this option is `off`. Example: `--from-date="2025-01-01 00:00:00"`

#### `--entity-skip-list`

This option allows to skip exporting data for defined entities. Example: `--entity-skip-list="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"Account"`,
* `a string which is separated by a comma`, e.g. `"Account, Contact"`.

#### `--entity-hard-list`

This option allows to export data for entities which are disabled by default, in `exportImportDefs` with the `"exportDisabled": true` or `"importDisabled": true` option. Example: `--entity-hard-list="ENTITY_TYPE"`.

Available values:

* `a string`, e.g. `"ScheduledJob"`,
* `a string which is separated by a comma`, e.g. `"ScheduledJob, ScheduledJobLogRecord"`.

#### `--config-hard-list`

This option allows to export data for config options which are disabled by default. Ex. `--config-hard-list="CONFIG_OPTION"`.
The default list is defined in `application/Espo/Modules/ExportImport/Resources/metadata/app/exportImport.json`.

Available values:

* `a string`, e.g. `"database"`,
* `a string which is separated by a comma`, e.g. `"database, siteUrl"`.

## Use cases

### Skip exporting passwords

```
bin/command export-import export --format=json --path="./data/export-import" --skip-password
```

### Export customization only

```
bin/command export-import export --format=json --path="./data/export-import" --skip-data --skip-config
```

### Export customization for a single entity along with relationships

```
bin/command export-import export --format=json --path="./data/export-import" --skip-data --skip-config --entity-list="Account"
```

### Export customization for a single entity without relationships

```
bin/command export-import export --format=json --path="./data/export-import" --skip-data --skip-config --entity-list="Account" --skip-related-entities
```

### Export data, configuration, customization for a single entity along with relationships

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Account"
```

### Export data, configuration, customization for a single entity without relationships

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Account" --skip-related-entities
```

## Use cases for Advanced Pack

### Reports

#### Export reports

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Report, ReportCategory, ReportFilter, ReportPanel" --skip-config --skip-customization --skip-related-entities
```

#### Export reports with custom entities

If the Target Entity of at least one of the reports is a custom entity, you need to add it to the `--entity-list` option. Example:

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Report, ReportCategory, ReportFilter, ReportPanel, CustomEntity" --skip-config --skip-customization --skip-related-entities
```

#### Export reports with custom fields

If the Target Entities of the reports are default entities, but at least one field in the one report is a custom field, you should add an `--all-customization` option and remove `--skip-customization` option. Example:

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Report, ReportCategory, ReportFilter, ReportPanel" --skip-config --all-customization --skip-related-entities
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

#### Export workflows

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Workflow, WorkflowCategory, WorkflowCategoryPath" --skip-config --skip-customization --skip-related-entities
```

#### Export workflows created or changed since a specific date

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Workflow, WorkflowCategory, WorkflowCategoryPath" --skip-config --skip-customization --skip-related-entities --from-date="2025-01-01 00:00:00"
```

#### Export workflows with custom entities

If the Target Entity of at least one of the workflows is custom entity, you need to add it to the `--entity-list` option. Example:

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="Workflow, WorkflowCategory, WorkflowCategoryPath, CustomEntity" --skip-config --skip-customization --skip-related-entities
```

### BPM

Depending on the presence of certain BPM elements, the following entities should be added to the `--entity-list` option:

- Task - see [Actions performance for Workflow and BPMs](#workflow)
- Send Message Task - EmailTemplate, User, Team
- User Task - Team

#### Export BPMs

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="BpmnFlowchart" --skip-config --skip-customization --skip-related-entities
```

#### Export BPMs with custom entities

If the Target Entity of at least one of the BPMs is custom entity, you need to add it to the `--entity-list` option. Example:

```
bin/command export-import export --format=json --path="./data/export-import" --entity-list="BpmnFlowchart, CustomEntity" --skip-config --skip-customization --skip-related-entities
```
