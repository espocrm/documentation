# Import

Provides the ability to import records from CSV files.

Administrator can access import at Administration > Import. By default, regular users don't have access. It can be granted with ACL roles. Administrator also can add the Import tab at Administration > User Interface > Tab List.

In this article:

* [Step 1](#step-1)
* [Step 2](#step-2)
* [Import results](#import-results)
* [Importing into Target List](#importing-into-target-list)
* [Console commands](#console-commands)
* [Errors](#errors)
* [See also](#see-also)

## Step 1

Select what type of records you need to import (*Entity Type* field).
Select a CSV file. A file should be formated with `UTF-8`.
Select *What to do?*. Available options: 'Create Only', 'Create & Update', 'Update Only'.

* *Create Only* − import will only create records;
* *Create & Update* − records will be created, if records with matching field values will be found, they will be updated; you will be able to check what fields to match by on the _Step 2_.
* *Update only* − only records with matching field values will be found, it will be updated.

Once you select a CSV file, you will be able to see how it will be parsed in *Preview* panel. When you change parameters, the preview will be updated.

Parameters:

* *Header Row* − whether CSV file has the first row with field names.
* *Execute in idle* − is recommended if you have a **big number of records** to be imported; import will be processed **via cron**; the status will be set to 'Complete' when the import process is finished.
* *Skip searching for duplicates* − will **make the import faster**.
* *Silent mode* − the majority of after-save scripts will be skipped; stream records won't be created, workflows will be skipped; checking will **make the import faster**.
* *Run Manually* − you will need to run manually from CLI. Command will be shown after setting up the import. (as of v6.0)

Click *Next* button to preceed to the _Step 2_.

![1](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/import/step-1.png)

## Step 2

Setup the field mapping: how fields correspond to columns of the CSV file. You can skip not needed columns here.

In cases of 'Create & Update' and 'Update only', you need to check fields by which records that should be updated will be found. For example, if you check *update by* 'Name' field, then records with the matching name will be updated.

Add *default values* you want new and updated records to set with. For example, you can specify 'Assigned User' and 'Teams' that will be applied by default.

After the import is done, you will be able to **revert** created records. You will be able to see which records were recognized as duplicate and which were updated. Duplicate means that there was a similar record in the system. You can remove all imported duplicates at once.

Important: Revert doesn't work with updated records, you can't revert the update.

Click *Run Import* button to proceed. It may take some time before the import process gets finished. If you want to import a large bunch of records, it's recommended to run import in idle.

![2](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/import/step-2.png)

## Import results

#### Remove import log

Once the records are imported and you are sure that imported data is fine, you can *Remove Import Log* (by clicking the button on the import results view) to preclude accidental reverting of the import.

#### Revert import

*Revert Import* will remove all imported records permanently. Updates caused by import won't be reverted.

#### Remove duplicates

This will permanently remove all imported records that were recognized as duplicates.

#### New import with same params

As of v6.0.0.

This will create a new import with the same parameters and field mapping.

## Importing into Target List

When you import Contacts, Leads or Accounts, you can add them to some target list. On the Step 2, you need to add *Target List* field on *Default Values* panel and select a needed target list record. You can also use 'Update only' or 'Create & Update' import type to link existing records with a target list.

## Console commands

As of v6.0.

Run import:

```
php command.php import --id={import-id}
```

The import must be created via UI (with *Run Manually* checked) before.

Resume failed import (from the last processed row):

```
php command.php import --id={import-id} --resume
```

Revert import:

```
php command.php import --id={import-id} --revert
```

Import file:

```
php command.php import --file=path/to/csv --params-id={import-id}
```

*--params-id* is ID of a previously run import. Its parameters will be used for the import.

## Errors

*As of v7.2.*

All rows that failed to import will be available in the Errors panel on the Import result view. It's possible to view the reason of the failure (in most cases it's the validation), the index of the failed row and values. To view error details, click the *View* from the dropdown.

There's the ability to export all failed rows back to CSV (in order to fix them and then re-import).

## See also

* [Import and export tool for quick data migration](https://www.espocrm.com/tips/import-export/)
