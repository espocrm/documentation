# Layout Management

The Layout Manager provides the ability to customize the appearance of detail, edit, list views as well as search filters and fields for mass-update forms. Layouts for a specific entity type can be accessed from Administration > Entity Manager.

* [Layouts](#layouts)
* [Different layouts for teams & portals](#different-layouts-for-teams-portals)
* [Custom list layouts](#custom-list-layouts)

## Layouts

* [List](#list)
* [Detail](#detail)
* [List (small)](#list-small)
* [Detail (small)](#detail-small)
* [Bottom Panels](#bottom-panels)
* [Search Filters](#search-filters)
* [Mass Update](#mass-update)
* [Side Panels](#side-panels)
* [Kanban](#kanban)
* [Side Panel Fields](#side-panel-fields)
* [Additional layouts](#additional-layouts)

### List

The main layout for the list view. It defines columns and their parameters.

![List](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/layout-manager/list.png)

Available parameters for columns are listed below.

#### Width

A column width in percent or pixels. Empty means auto-width.

#### Link

If checked, then a field value will be displayed as a link pointing to the detail view of the record. Usually, it is used for *Name* fields.

#### Not Sortable

Disables the ability to sort the column.

#### Align

Align the column to the left or to the right.

### Detail

The main layout for the detail and edit views. It defines panels, rows and cells. Cells contain fields.

The row can contain 1, 2, 3 or 4 cells. To add a row with single cell, you need to add a new row and click on a minus sign on any cell.

![Detail](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/layout-manager/detail.png)

Edit panel parameters by clicking a pancil icon on the panel. It's possible to specify a label, color (style), conditions making a panel visible, group panels in tabs (as of v7.2).

To enable detail view tabs, you need to check the *Tab-break* for panels. Enable it for panels you want to be first in a tab. All following panels will be in the same tab till the next closest tab-break panel. Specify a *Tab Label* for tab-break panels.

!!! note

    The *Hidden* panel parameter is not fully compatible with tabs. It's not recommended to have both tab-breaks and hidden panels on the same layout.

### List (Small)

The list layout for relationship panels. Also, it can be used in other places where it's reasonable to display lists in the narrow view.

### Detail (Small)

The detail view for quick create, quick view and quick edit forms.

### Bottom Panels

Relationship panels and Stream panel displayed on the detail view at the bottom. Panels can be re-ordered, grouped by tabs.

Parameters are listed below.

#### Style

The color of the panel.

#### Sticked

The panel will be sticked to the previous panel w/o a gap.

#### Conditions making panel visible

Dynamic-logic conditions that determine whether the panel is visible.

### Search Filters

The list of fields available in the list view to search by.

### Mass Update

The list of fields available in the Mass Update form.


### Side Panels

Side panels for Detail, Edit, Detail Small, Edit Small forms. Provides the ability to hide or re-order the list of panels: Activities, History, Tasks and others. Panels can be colorized by the Style parameter. You can define dynamic-logic conditions that will determine whether the panel is visible.

Parameters are listed below.

#### Style

The color of the panel.

#### Sticked

The panel will be sticked to the previous panel w/o a gap.

#### Conditions making panel visible

Dynamic-logic conditions that determine whether the panel is visible.

### Kanban

Available for entity types with the enabled Kanban view.

### Side Panel Fields

The list of fields displayed in the top side panel. By default, there are *Assinged User* and *Teams* fields.

### Additional layouts

Some entity types contain additional layouts: Convert Lead, List for Account and others.

## Different layouts for teams & portals

*Layout Sets* provide the ability to have different layouts for teams & portals.

Admin can create a layout set record where they will define specific layouts that will differ from standard ones (defined in the Layout Manager). Layout sets are available at Administration > Layout Sets.

A *Team* and *Portal* have the *Layout Set* link fields.

For internal users (regular & admin), a Layout Set is applied through the *Default Team* (User > Default Team > Layout Set). The team should have the Layout Set specified. That team should be set as a default team for the user.

For portal users, the Layout Set is applied through the *Portal* record.

A Layout Set can also be specified for a specific user through the *Layout Set* field (as of v8.0). Only regular and admin users have this field available. 

!!! note

    You need to clear cache (Administration > Clear Cache) after configuring layout sets.

## Custom list layouts

*As of v8.0.*

The administrator can create custom list layouts. These layouts can then be selected for specific relationship panels (at Administration > Entity Manager > {Entity Type} > Relationships).
