# Dynamic Logic (dynamic forms)

## Fields

Dynamic behavior of forms can be achieved by utilizing Dynamic Logic feature. Dynamic Logic parameters are available for every fields. Parameters are available in *Entity Manager* when you edit or create a field.
 
Dynamic Logic allows to define conditions making certain fields visible, required or read-only. Conditions will be checked automatically when data in the form is changed.

For Enum, Array, Multi-Enum, Checklist fields it's possible to define different sets of options that will be available for the field depending on which condition is met. Note, that an order of option lists is taken into account.

Dynamic logic can control:

* Visibility − field is visible or not
* Required − field is required or not
* Read-only − field read-only or not
* Options − coditions determine which options are available (for Enum, Array, Multi-Enum, Checklist fields)

Conditions are configured through user interface, no coding required.

![Condition builder](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/dynamic-logic/1.png)

## Panels

In Layout Manager you can specify conditions making a specific panel visible. Edit panel to specify dynamic logic. 

Available in the following layouts:

* Detail
* Side Panels
* Bottom Panels
