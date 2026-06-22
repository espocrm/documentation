---
search:
  boost: 2
---

# Search in Lists

There four types of filters available in list views:

- [Primary](#primary-filters)
- [Boolean](#boolean-filters)
- [Text](#text-filters)
- [Advanced](#field-filters) (Field filters)

## Primary filters

This is the main filter. Primary filters are system-defined. Only one primary filter can be applied to a list at a time. 

Primary filters can be selected from the dropdown to the left of the text filter input.
The dropdown text shows the currently applied filter. When it displays 'All', it means no primary filter is applied.

Examples of primary filters:

- Draft, Issued, Paid – in Invoice;
- Open, Closed – in Opportunity;
- Customer, Partner – in Account.

Custom primary filters can be created with the [Report Filters](reports.md#report-filters) feature
(available in Advanced Pack).

## Boolean filters

Boolean filters operate as simple on/off switches. Multiple boolean filters can be applied to a list at a time.

When multiple boolean filters are applied, they work inclusively.
This means a record is listed if it matches at least one active boolean filter.

Boolean filters can be toggled on and off from the dropdown to the left of the text filter input.
The dropdown text shows the currently applied boolean filters.

Examples of boolean filters:

- Followed
- Shared
- Only My

## Text filters

A text filter allows users to narrow down a list of data by typing a specific text query.

There are two modes that text filters can function in:

- Regular
- [Full-text](text-search.md#full-text-search)

Full-text mode can be enabled for an entity type at Administration > Entity Manager > {Entity Type} > Edit.

Text search history is stored in the browser's local storage. Previous search queries are available via autocomplete.

A wildcard `*` can be used in a query as a placeholder that stands in for any number of unknown characters.

See more in a separate [article](text-search.md#list-view-text-search).

## Field filters

Internally called as *Advanced* filters.

Field filters are configured directly within the list view. To add a field filter,
click the three-dots dropdown menu next to the Search button.

An administrator can configure which fields are available for field filters at Administration > Entity Manager >
{Entity Type} > Layouts > Filters.

When multiple field filters are applied, they work exclusively.
This means a record is listed if it matches all field filters.

## Storing filters as presets

Field filters can be stored as a preset filter. A user can create multiple preset filters.

The primary filter active during the preset creation is also stored in the preset.

Stored preset filters are available for the user as primary filters, meaning that they can be selected the same way
via the dropdown to the left of the text filter input.

Stored preset filters are available only for the user who created them.

To create a preset, first, add needed field filters. Then click *Save Filter* from the dropdown to the left of the
text filter input. Enter a filter name and save.

To remove an existing preset, first, select the preset, then click *Remove Filter* from the dropdown to the left of the
text filter input.

You can combine preset filters with boolean filters. You can also add more field filters while a preset is selected.
In this case, all field filters as from the selected preset will show up.

## Search in relationship panels

All aforementioned filters are also available in relationship panels. To access the relationship list view, click
View List from the dropdown in the top-right corner of the panel.

## Selecting all results

While search criteria is applied, it is possible to select all results. For this, click the small dropdown icon
next to the checkbox in the table header row. Then, click *Select All Results*.

## See also

- [List View overview](https://app.supademo.com/demo/cmq82sj3w002q0i0jsfcv5rc2)
