# Reports

Reports feature is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

There are two types of reports: List and Grid.

In this article:

* [List reports](#list-reports)
* [Grid reports](#grid-reports)
* [Joint Grid reports](#joint-grid-reports)
* [Filters](#filters)
* [Displaying on dashboard](#displaying-on-dashboard)
* [Email sending](#email-sending)
* [Printing to PDF](#printing-to-pdf)
* [Syncing with Target Lists](#syncing-with-target-lists)
* [List view filters based on reports](#report-filters)
* [Reports panels](#report-panels)

See also:

* [Complex expressions](complex-expressions.md)


## List Reports

List report results the list of records that meet the specified criteria.

To create a new list report click on *Reports* tab and then click *Create Report* button. Choose needed Entity Type then click *Create* button at *List Report* section.

At *Columns* field pick fields you would like to be displayed. Below you can specify display parameters for every column:

* Width – width in percents;
* Align – left or right;
* Link – a value we be displayed as a link leading to the record detail view;
* Export Only – column won't be displated in report results on UI, but available in export;
* Not Sortable – column won't be able to be ordered by, some fields are not available for sorting.

Choose needed sorting at *List Order* field.

At _Filters_ section you can specify criteria that determines what records will be listed in your report. You can use logical operators 'OR' and 'AND' here.

*Runtime Filters* allow you to specify different filters before you run the report.

You can **export** list report results to XLSX (Excel) and CSV formats.

List report results example:

![List report example](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/list.png)

Additional features where list reports can be utilized:

* Scheduled workflows – to do some scheduled actions over records that met criteria specified by a list report.
* Scheduled BPM processes – to start BPM processes for records that met some criteria.
* Sync with target lists – automatic or manuall, more [below](#syncing-with-target-lists).
* List view filters – more info [below](#report-filters).
* Panels on detail view – displaying related records that met some criteria, more info [below](#report-panels).
* Applying assignment rule – by workflow or BPM.


## Grid Reports

Grid reports result summarized values, can be grouped by one or two fields and displayed as a chart.

To create a new grid report click on *Reports* tab and then click *Create Report* button. Choose needed Entity Type then click *Create* button at *Grid Report* section.

Grid report results example, showing revenue grouped by User:

![Grid report example](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/grid.png)

### Group By

At *Group By* field pick one or two fields you want your report data be grouped by. It's possible to apply grouping by year, month, week, day for date fields. If you group by two fields your report will be considered as three-dimensional.

You can leave *Group By* field empty.

There is the ability to specify a custom complex expression (with functions) for grouping. The complex expression is translated into SQL statement. More info about complex expressions is available [here](complex-expressions.md).

### Columns

At *Columns* field select one or more aggregate functions applied to a specific field.

Functions:

* COUNT – number of records;
* SUM – summation, applied to Currency, Int and Float fields;
* MIN – mimimal value;
* MAX – maximal value;
* AVG – average value.

If the report is grouped by a link field then it's possible to add fields from the linked record w/o aggregate functions. Example: The report for Opportunities, grouped by Campaign, with Campaign.Budget column.

### Order by

*Order by* field defines how report data will be sorted.

### Filters

At *Filters* section you can specify criteria to limit data displayed in report results. You can use logical operators 'OR' and 'AND' here. More info [below](#filters_1).

### Runtime Filters

*Runtime Filters* allows you to specify different filters before you run the report.

Note: Specifying the runtime filter can be also useful for dashlets and report panels.

### Charts

Grid report allows displaying results in a chart form.

There are following chart types available:

* Bar (Horizontal)
* Bar (Vertical)
* Bar Grouped (Horizontal) (only for report with grouping by 2 columns)
* Bar Grouped (Vertical) (only for report with grouping by 2 columns)
* Pie (only for report with grouping by 1 column)
* Line

Bar:

![Bar](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/chart-bar.png)

Bar Grouped:

![Bar grouped](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/chart-bar-grouped.png)

Line:

![Line](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/chart-line.png)

Pie:

![Pie](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/chart-pie.png)

### Export

It's possible to export grid report results to XLSX (Excel) and CSV formats. Charts are exported to XLSX.

## Joint Grid reports

Available since Advanced Pack v2.2.0.

Joint Grid reports combine multiple grid reports of different entity types. Sub-reports must by grouped by 1 or 0 fields.

Some usage examples:

* Lead count / Contact count
* Revenue by month / Campaign Budget by month
* Revenu by user / Lead count by User

You can create a new Joint Grid report from the dropdown menu in the top-right corner on the Reports list view.

Runtime filters are not supported in joint reports. Only regular filters (specified in each sub-reports) can be used.

For charts, colors of columns must be specified in sub-reports.

## Filters

### Field filter

Simple to use type of filters. You can also pick fields of target entity as well as related entities.

![Field filter](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-field.png)

### OR group

OR means that at least one condition under the group must be met.

![OR group](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-or.png)

### AND group

AND means that all conditions under the group must be met.

### NOT IN group

Provides the ability to filter records that don't meet specified criteria. E.g. listing accounts that don't have any opportunity with Closed Won or Closed Lost status.

Note: It's recommended to avoid using NOT IN group when possible, by using filters 'Not Equals', 'None of', etc. instead. NOT IN group uses a sub-query that can negatively effect on a report performance in some cases.

![NOT IN group](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-not.png)

### IN group

Note: Available in since EspoCRM v5.6.0 and Advanced Pack v2.1.0.

Simlitar to AND group but utilizes a sub-query.

Example of usage: Filtering accounts that have opportunities of both 'Closed Won' and 'Negotiation' stages.

![IN group](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/reports/filter-in.png)

### Complex Expression

For more advanced use. You can apply function for certain database column and compare it with the result of [formula](../administration/formula.md) expression.

Note: If you need to compare just with a simple string value you should put it into single quotes `'some string'`.

Note: Functions intended to interact with entity record will not work here because the formula is not applied to specific record.

Applying function to attribute and comparing with result of formula:

![Complex Expression filter](../_static/images/user-guide/reports/filter-complex.png)

Comparing result of custom complex expression & result of formula:

![Complex Expression filter](../_static/images/user-guide/reports/filter-complex-expression.png)


* Complex expression is translated into SQL statement and becomes a part of SQL query.
* Formula is executed by PHP and the result value is substituted into SQL query.
* Comparison operator is substituted into SQL query between complex expression statement and formula result value.

More info about complex expressions is available [here](complex-expressions.md).

### Having group

Having group provides an ability to filter with using aggregate functions COUNT, SUM, MAX, MIN, AVG.

Some use cases:

* List accounts having more than one opportunities. `COUNT / opportunities.id / Greater Than / 1`.
* Grid report showing accounts grouped by industry where revenue is more than 1,000. `SUM / opportunities.amount / Greater Than / 1000`.

## Displaying on dashboard

You can display any report on dashboard. For this you need add Report dashlet and then pick needed report at dashlet options.

Grid reports can be displayed as a chart, chart with totals or only totals.

List reports can be displayed as a list or a total number of records.

## Email sending

It's possible to make system to send report results to certain users on regular basis according specified time. This must be configured for certain reports individually.

Max number of records that can be send in email by default is 3000. You can increase it by adding a parameter to data/config.php: `'reportSendingListMaxCount' => 5000`.

## Printing to PDF

Available since Advanced Pack v2.5.0, compatible with EspoCRM v5.8.0 and later.

Note: A user needs to have an access to *Template* scope (set in Roles).

Note: You need to have at least one PDF Template for Report entity type. The template can be created at Administration > PDF Templates.

To print a report: on the report detail view on *Report* panel, from the dropdown next to *Edit* button, click *Print to PDF*.

In PDF table `{{reportTable}}` is used to print a report results table.

Example:

```
{{reportTable border=1 borderColor="#333" cellpadding=2 fontSize=9}}
```

Available attributes:

* border – a border with
* borderColor
* cellpadding
* fontSize
* color – a text color
* flip – to flip table, true or false

## Syncing with Target Lists

It's possible to have target lists synced with list report results. It's convenient for mass email when you would like to send emails only to contacts that meet some criteria at the moment of sending. This feature is available on detail view of any target list at *Sync with Reports* panel.

## Report Filters

List view filters based on reports.

Administrator can create custom list view filters based on specific reports. Available at: Administration > Report Filters. It's possible to specify teams that will have an access to the filter.

Note: The layout, that is specified in the report, is not applied to the list view when the filter is selected.

## Report Panels

Detail view panels showing report results.

Administrator can create custom side and bottom panels for the detail view of the specific entity type. It's possible to specify teams that will have an access to the panel.

Both Grid and List reports can be used.

It's possible to display only a total amount on the report panel.

Order of side panels can be customized at Layout Manager > Side Panels (Detail).

Order of side panels can be customized at Layout Manager > Bottom Panels (since v5.9.0).

The report panel shows results related to the record is viewed. The first found relationship is used. If the report has an appropriate runtime filter then it will be used to restrict results. The runtime filter must be a field of link, link-multiple or link-parent type.

## See also

* [Complex expressions](complex-expressions.md)
