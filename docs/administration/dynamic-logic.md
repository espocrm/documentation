# Dynamic Logic (dynamic forms)

## Fields

Dynamic behavior of forms can be achieved by utilizing Dynamic Logic feature. Dynamic Logic parameters are available
for every field. Parameters are available in Entity Manager when you edit or create a field.

Dynamic Logic allows to define conditions making certain fields visible, required or read-only. Conditions will be
checked automatically when data in the form is changed.

For *Enum*, *Array*, *Multi-Enum*, *Checklist* fields it's, possible to define different sets of options that will be
available for the field depending on which condition is met. Note, that the order of option list is taken into account.

For *Varchar* and *Text* fields it's possible to define a regular expression to check whether a value matches a specific
pattern (as of v7.0).

Dynamic logic can control:

* Visibility − if the field is visible or not;
* Required − if the field is required or not;
* Read-only − if the field read-only or not;
* Options − conditions that determine which options are available (for Enum, Array, Multi-Enum, Checklist fields);
* Invalidity − conditions making the field invalid (as of v7.0).

Conditions are configured through user interface, no coding required.

!!! note

    When a condition for a field checks the value of the same field, it may cause side effects.
    E.g. making a field read-only when the same field is not empty.
    
!!! note

    When defining enum options that depends on the current value of the field, you need to include the current
    value to the option set.
    
!!! note

    In some cases it may be reasonable to disable the inline-edit functionallity for a specific field as it may
    interfere with the dynamic logic.

![Condition builder](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/dynamic-logic/1.png)

## Panels

In Layout Manager, you can specify conditions making a specific panel visible. Edit a panel to specify dynamic logic.

Available in the following layouts:

* Detail
* Side Panels
* Bottom Panels

It's also possible to define conditions on which a specific color will be applied to the panel (as of v7.0).
