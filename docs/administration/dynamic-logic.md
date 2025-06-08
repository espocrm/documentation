# Dynamic Logic

A dynamic behavior for forms can be achieved by utilizing the Dynamic Logic feature.

## Fields

Dynamic Logic parameters are available for every field (Administration > Entity Manager > {Entity Type} > Fields > {field}.

The Dynamic Logic allows to define conditions making certain fields visible, required or read-only. Conditions will be
checked automatically when data in the form is changed.

For *Enum*, *Array*, *Multi-Enum*, *Checklist* fields it's, possible to define different sets of options that will be
available for the field depending on which condition is met. Note that the order of option list is taken into account.

Dynamic logic can control:

* Visibility − if the field is visible or not;
* Required − if the field is required or not;
* Read-only − if the field read-only or not;
* Options − conditions that determine options available for enum fields;
* Invalidity − conditions making the field invalid.

Conditions are configured through user interface, no coding required.

![Condition builder](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/dynamic-logic/1.png)

!!! note

    * When a condition for a field checks the value of the same field, it may cause side effects. E.g. making a field read-only when the same field is not empty.
    * When defining enum options that depend on the current value of the field, you need to include the current value to the option set.
    * In some cases it may be reasonable to disable the inline-edit functionality for a specific field as it may interfere with the dynamic logic.
    * Dynamic Logic operates fields on the form, it has no effect on buttons and menu items in the UI.
    * Dynamic Logic is not applied on the list view.

### Field logic

#### Visible

Is applied only in the frontend.

#### Required

Is applied only in the frontend and in the backend (as of v9.1).

#### Read-only

Is applied only in the frontend. Conditions are checked against the current state of the record. If we change a record without saving it, it changes the current state.

#### Read-only saved-state

*As of v9.1.*

Dynamic logic conditions checked against the saved state of the record. The logic is not applied while editing a record without saving.

* Is not applied when a record is created.
* Applied in both the frontend and the backend.
* Applied in mass-update.

Use-case: Make a field Resolution read-only when Status = Completed. It won't be possible to write the Resolution field while the Status is saved as Completed. Even if we change the Status on the form, the Resolution field will still be read-only. But if we change and save the Status, it will be possible to write the Resolution field.

#### Options

A mapping of conditions against option lists. Specific conditions determine what options will be available in an enum field.

For Enum, Array, Multi-Enum and Checklist fields.

### Regular expression

For *Varchar* and *Text* fields, it's possible to define a regular expression to check whether a value matches a specific
pattern.

An expression should start and end with a slash character.

Example: `/^\d{5}-\d{6}-\d{2}$/`

You can also specify regular expression flags after the ending slash.

## Panels

In the Layout Manager, you can specify conditions making a specific panel visible. Edit the panel to configure the dynamic logic.

Available in the following layouts:

* Detail
* Side Panels
* Bottom Panels

It's also possible to define conditions on which a specific color will be applied to the panel.

## Misc

To determine whether a record is being created, check whether the ID is empty. It can be useful to hide some fields when the record not yet created or to show some panel with instructions described in a panel note.

For dynamic logic that is applied only in the frontend, you may consider additionally using an API Before-Save script for validation purposes.
