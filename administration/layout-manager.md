# Layout Management

*Layout Manager* is available at administration panel. It provides an ability to customize appearance of detail, edit, list views as well as search filters and fields for mass-update forms.

* [Layouts](#layouts)
* [Different layouts for teams & portals](#different-layouts-for-teams--portals)

## Layouts

### List

The main layout for the list view. It defines columns and their parameters.

![List](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/layout-manager/list.png)

Available parameters for columns are listed below.

#### Width (%)

Width of column in percent, empty means auto-width.

#### Link

If checked, then a field value will be displayed as a link pointing to the detail view of the record. Usually, it is used for *Name* fields.

#### Not Sortable

Disables an ability to sort the column.

#### Align

Align the column to the left or to the right.

### Detail

The main layout for the detail view and the edit view. It defines panels, rows and cells. Cells contain fields.

The row can contain 1, 2, 3 or 4 cells. To add a row with single cell, you need to add a new row and click on a minus sign on any cell.

![Detail](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/layout-manager/detail.png)

For panels it's possible to specify a label, color (style) and conditions making a panel visible (since version 5.2.6).

### List (Small)

The list layout for relationship panels. Also, it can be used in other places where it's reasonable to display lists in the narrow view.

### Detail (Small)

The detail view for quick create, quick view and quick edit forms.

### Search Filters

The list of fields available in the list view to search by.

### Mass Update

The list of fields available in the Mass Update form.

### Relationship Panels

The list of relationship panels displayed on the detail view at the bottom. Panels can be re-ordered. It's possible to define the color of panel with the Style parameter.

### Side Panels

Side panels for Detail, Edit, Detail Small, Edit Small forms. Provides an ability to hide or re-order panels list Activities, History, Tasks and others. Panels can be colorized by the Style parameter.

### Kanban

Available for entity types with the enabled Kanban view.

### Side Panel Fields

List of fields displayed in the top side panel. By default there are *Assinged User* and *Teams* fields.

### Additional Layouts

Some entity types contain additional layouts: Convert Lead, List for Account and others.

## Different layouts for teams & portals

Available since version 5.9.0.

*Layout Sets* provide the ability to have different layouts for teams & portals.

Admin can create Layout Set record, where they will define specific layouts that will differ from standard ones (defined in Layout Manager). Layout Sets are available at Administration > Layout Sets.

*Team* & *Portal* have *Layout Set* link fields.

For internal users (regular & admin) Layout Set is applied through *Default Team*. User > Default Team > Layout Set. The team should have Layout Set specified. That team should be set as a deafult team for the user.

For portal users Layout Set is applied through *Portal* record. 
