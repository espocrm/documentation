# Reports

Reports feature is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

There are two types of reports: List and Grid.  

## List Reports

List report results the list of records that meet the specified criteria.

To create new list report click on Reports tab and then click Create Report button. Choose needed Entity Type then click Create button at List Report section.

At _Columns_ field pick fields you would like to be displayed. Below you can specify display parameters for every column e.g. width and align.

Choose needed sorting at _List Order_ field. 

At _Filters_ section you can specify criteria that determines what records will be listed in your report. You can use logical operators 'OR' and 'AND' here.

_Runtime Filters_ allow you to specify different filters before you run the report.

You can __export__ list report results to excel and csv formats.

## Grid Reports

Grid reports result summarized values grouped by specified fields. These reports can be displayed as a chart.

![Grid reports](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/reports/grid.png)

To create new grid report click on Reports tab and then click Create Report button. Choose needed Entity Type then click Create button at Grid Report section.

At _Group By_ field pick one or two fields you want your report data be grouped by. It's possible to group by year, month, day for date fields. If you group by two fields your report will be considered as three-dimensional.

At _Columns_ field select one or more aggregate functions like COUNT, SUM (summation), MIN, MAX, AVG (average).

_Order by_ field defines how report data will be sorted.

At _Filters_ section you can specify criteria that determines what records will be used in your report. You can use logical operators 'OR' and 'AND' here.

_Runtime Filters_ allows you to specify different filters before you run the report.


### Charts

Grid report allows displaying results in a chart form. 

There are following chart types: 

* Bar (Horizontal)
* Bar (Vertical)
* Bar Grouped (Horizontal) (only for report with grouping by 2 columns)
* Bar Grouped (Vertical) (only for report with grouping by 2 columns)
* Pie (only for report with grouping by 1 column)
* Line

### Export

It's possible to export grid report results to Excel and CSV formats. Charts are exported to Excel.

## Filters

### Field filter

Simple to use type of filters. You can also pick fields of target entity as well as related entities.

![Field filter](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/reports/filter-field.png)

### OR group

OR means that at least one condition under the group must be met.

![OR group](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/reports/filter-or.png)

### AND group

AND means that all conditions under the group must be met.

### NOT IN group

Provides an ability to filter records that don't meet specified criteria. E.g. listing accounts that don't have any opportunity with Closed Won or Closed Lost status.

Note: It's recommended to avoid using NOT IN group when possible, by using filters 'Not Equals', 'None of', etc. instead. NOT IN group uses a sub-query that can negatively effect on a report performance in some cases.

![NOT IN group](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/reports/filter-not.png)

### IN group

Note: Available in since EspoCRM 5.6.0 and Advanced Pack 2.1.0.

Simlitar to AND group but utilizes a sub-query.

Example of usage: Filtering accounts that have opportunities of both 'Closed Won' and 'Negotiation' stages.

![IN group](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/reports/filter-in.png)

### Complex Expression

For more advanced use. You can apply function for certain database column and compare it with the result of [formula](../administration/formula.md) expression.

Note: If you need to compare just with a simple string value you should put it into single quotes `'some string'`.

Note: Functions intended to interact with entity record will not work here because the formula is not applied to specific record.

![Complex Expression filter](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/reports/filter-complex.png)

### Having group

Having group provides an ability to filter with using aggregate functions COUNT, SUM, MAX, MIN, AVG.

Some use cases:

* List accounts having more than one opportunities. `COUNT / opportunities.id / Greater Than / 1`.
* Grid report showing accounts grouped by industry where revenue is more than 1,000. `SUM / opportunities.amount / Greater Than / 1000`.

Note: Compatible with EspoCRM versions 5.1.0 and greater.

## Displaying on the dashboard

You can display any report on dashboard. For this you need add Report dashlet and then pick needed report at dashlet options.

It's possible to display only a total amount on the dashlet.

## Email sending

It's possible to make system to send report results to certain users on regular basis according specified time. This must be configured for certain reports individually.

## Syncing with Target Lists

It's possible to have target lists synced with list report results. It's convenient for mass email when you would like to send emails only to contacts that meet some criteria at the moment of sending. This feature is available on detail view of any target list at 'Sync with Reports' panel.

## Report Filters (list view filters based on reports)

Compatible with EspoCRM 5.1.0 and greater.

Administrator can create custom list view filters based on specific reports. Available at: Administration > Report Filters. It's possible to specify teams that will have an access to the filter.

Note: The layout, that is specified in the report, is not applied to the list view when the filter is selected.

## Report Panels (detail view panels showing report results)

Compatible with EspoCRM 5.1.0 and greater.

Administrator can create custom side and bottom panels for the detail view of the specific entity type. It's possible to specify teams that will have an access to the panel.

Both Grid and List reports can be used.

It's possible to display only a total amount on the report panel.

Order of side panels can be customized at Layout Manager > Side Panels (Detail).

Order of bottom panels is specified in the Report Panel record. It's possible to place the panel before Stream panel, before relationship panels or at the very bottom.

The report panel shows results related to the record is viewed. The first found relationship is used. If the report has an appropriate runtime filter then it will be used to restrict results. The runtime filter must be a field of link, link-multiple or link-parent type.
