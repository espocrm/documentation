# Export

EspoCRM has the ability to export records to XLSX (Excel) and CSV formats.

* [How to export](#how-to-export)
* [Access control](#access-control)
* [CSV delimiter](#csv-delimiter)
* [See also](#see-also)

## How to export

### Step 1

On the list view make a search with needed filters and then click *Select All Results* (from the dropdown, see the screenshot below).

![Select all results](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/export/export-1.png)

### Step 2

Click the *Actions* dropdown, then click *Export*.

![Click Export action](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/export/export-2.png)

### Step 3

The modal window will show up where you can specify export parameters.

![Click Export action](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/export/export-3.png)

You can select specific fields to be exported or check to export all available fields.

### Step 4

After clicking Export button the export file will be downloaded.

## Access control

Administrator can disable export function for all non-admin users at Administration > Settings > Disable Export.

Also it's possible to control an access to export function via ACL Roles with Export Permission parameter.

## CSV delimiter

Users can specify the delimiter for CSV export at Preferences.

The default delimiter for the system can be changed manually in `data/config.php`, parameter `exportDelimiter`.

## See also

* [Import and export tool for quick data migration](https://www.espocrm.com/tips/import-export/)
