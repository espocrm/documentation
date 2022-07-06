# Fields

## Field types

The list of field types available for creating:

* [Varchar](#varchar) – a single-line text;
* [Enum](#enum) – a selectbox, only one value can be selected;
* [Text](#text) – a multiline text with markdown support;
* [Date](#date) – date w/o time;
* [Date-Time](#date-time) – date and time;
* [Currency](#currency) – for currency values, a float number and currency code;
* [Int](#int) – a whole number;
* [Float](#float) – a number with a decimal part;
* [Boolean](#boolean) – a checkbox;
* [Multi-Enum](#multi-enum) – a list of values, multiple values can be selected;
* [Checklist](#checklist) – a list of checkboxes;
* [Array](#array) – a list of values, similar to Multi-Enum field;
* [Address](#address) – an address with street, city, state, postal code and country;
* [Url](#url) – for storing links;
* [Wysiwyg](#wysiwyg) – similar to Text field, but with HTML support;
* [File](#file) – for file uploading;
* [Image](#image) – for image uploading;
* [Attachment-Multiple](#attachment-multiple) – for multiple file uploading;
* [Number](#number) – an auto-incrementing number of string type with a possible prefix and specific length;
* [Auto-increment](#auto-increment) – a generated read-only auto-incrementing integer number;
* [Barcode](#barcode) – a barcode, can be printed to PDF.
* [Foreign](#foreign) - a field of a related record. Read-only.

Field types not available for creating directly:

* [Email](#email) – a set of email addresses;
* [Phone](#phone) – a set of phone numbers;
* [Link](#link) – a record related through *Belongs-To* (*many-to-one* or *one-to-one*) relationship;
* [Link-Parent](#link-parent) – a record related through *Belongs-To-Parent* relationship; can be of different entity types;
* [Link-Multiple](#link-multiple) – a set of records related through *Has-Many* relationship.

## Common field parameters

* Label – a name of a field displayed on UI;
* Required – whether a field is mandatory; user won't be able to save a record w/o filling the field;
* Audited – field changes will be stored in stream;
* Read-only – a field value can't be specified; can be calculated by formula or workflow rule;
* Default – a value pre-filled when creating a new record;
* Disable Inline Edit – useful when using dynamic forms logic;
* Tooltip Text – info about a field for users.

## Dynamic Logic

Provides an ability to make forms dynamic. It's possible to define conditions making certain fields visible, required or read-only. Conditions will be checked automatically when data in the form is changed.

For *Enum*, *Array*, *Multi-Enum*, *Checklist* fields, it's possible to define different sets of options that will be available for the field depending on which condition is met. See more [here](dynamic-logic.md).

Available items:

* Conditions making field visible
* Conditions making field required
* Conditions making field read-only
* Conditional options – for enum, multi-enum, checklist, array, varchar fields

----

## Varchar

A single-line text.

Parameters:

* Max-length – a max acceptable length of text;
* Options – a pre-defined list of values for an autocomplete;
* Pattern – a regular expression to check a field value against.

![Varchar](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/varchar.png)

## Enum

Selectbox, only one value can be selected.

Parameters:

* Options – a list of values (key => label pairs); a color (style) for each value can be specified (applied when param *Display as Label* is enabled);
* Is Sorted – to sort a list alphabetically;
* Display as Label – a value will be displayed as a label with color; a color for each option can be specified.

It's possible to define conditional options with Dynamic Logic.

![Enum](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/enum.png)

![Enum detail view](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/enum-detail.png)

## Text

A multiline text with markdown support.

Parameters:

* Max-length – a max acceptable length of a text;
* Disable Text Cut – if not checked, then long texts will be shortened and can be expanded (for the detail view mode);
* Number of rows of textarea – a max number of rows before scroll bar appears (for the edit view mode);
* Cut Height (px) – a max height of a text, if longer, then it will be cut (for the detail view mode);
* Display raw text (no markdown) – to disable markdown support.

![Text](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/text.png)

![Text detail view](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/text-detail.png)

## Date

Date w/o time.

Parameters:

* After (field) – a validation: a date value should be after a date value of a specified field;
* Before (field) – a validation: a date value should be before a date value of a specified field;
* Use Numeric Format – if not checked, then words 'today', 'yesterday', 'tomorrow' are in the detail view mode.

![Date](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/date.png)

![Date detail view](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/date-detail.png)

## Date-Time

Date and time.

Parameters:

* After (field) – a validation: a date value should be after a date value of a specified field;
* Before (field) – a validation: a date value should be before a date value of a specified field;
* Use Numeric Format – if not checked, then words 'today', 'yesterday', 'tomorrow' are in the detail view mode;
* Minutes Step – defines items displayed in the minutes dropdown (in the edit mode).

![Date-Time](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/date-time.png)

![Date-Time detail view](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/date-time-detail.png)

## Currency

A currency value. A float number with a currency code.

Parameters:

* Min – a validation: min acceptable value; if empty, then no validation applied;
* Max – a validation: max acceptable value; if empty, then no validation applied;
* Only default currency – only one (default) currency will be available if enabled.
* Disable Conversion – the currency conversion action won't change the currency of the field.

![Currency](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/currency.png)

![Currency detail view](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/currency-detail.png)

## Int

A whole number.

Parameters:

* Min – a validation: min acceptable value; if empty, then no validation applied;
* Max – a validation: max acceptable value; if empty, then no validation applied;
* Disable Formatting – if not checked, then a value is formatted with a thousand separator.


## Float

A number with a decimal part.

Parameters:

* Min – a validation: min acceptable value; if empty, then no validation applied;
* Max – a validation: max acceptable value; if empty, then no validation applied.
* Decimal Places – how many numbers of decimal part to display in read mode.


## Boolean

A checkbox. Two possible values: true and false.

![Boolean](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/bool.png)

## Multi-Enum

A list of values, multiple values can be selected. The list is ordered.

![Multi-Enum](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/multi-enum.png)

![Multi-Enum detail view](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/multi-enum-detail.png)

Parameters:

* Options – a list of values (key => label pairs); a color (style) for each value can be specified (applied when param *Display as Label* is enabled);
* Is Sorted – to sort a list alphabetically;
* Allow Custom Options – if checked, a user can add custom values (not defined by *Options* parameter) by typing text and pressing the enter key;
* Max Item Count – a validation: how many items can be added;
* Display as Label – values will be displayed as a label with color; a color for each option can be specified;
* Display as List – each value will be displayed in a new line;
* Pattern – a regular expression to check a field value against.


## Checklist

A list of checkboxes.

Parameters:

* Options – a list of values (key => label pairs); a color (style) for each value can be specified (applied when param *Display as Label* is enabled);
* Is Sorted – to sort a list alphabetically;
* Max Item Count – a validation: how many items can be checked;


## Array

A list of values, similar to Multi-Enum field.

Parameters:

* Options – a list of values (key => label pairs); if no options specified, then a user will be able to add any options;
* Empty string value is not allowed – if not checked, a user can add an empty string as an item;
* Max Item Count – a validation: how many items can be added;
* Display as List – each value will be displayed in a new line;
* Pattern – a regular expression to check a field value against.

![Array](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/array.png)

## Address

An address with street, city, state, postal code and country.

![Address](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/address.png)

## Url

For storing links.

Parameters:

* Max-length – a max acceptable length of text;
* Strip – if checked, then a protocol part and trailing `/` will be stripped.


## Wysiwyg

Similar to Text field, but with HTML support.

Parameters:

* Height (px) – a height of the field (in the edit view mode); if empty – then  height is flexible;
* Min Height (px) – a min height of the field (in the edit view mode);
* Use Iframe – if checked, then HTML will be placed into IFRAME element.

## File

For file uploading.

Parameters:

* Source List – allows a user to get a file from another record (*Documents* source is available out-of-the-box);
* Max File Size (Mb) – a validation;
* Accept – which file types can be accepted; see [info](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/file#Unique_file_type_specifiers) about file types.


## Image

For image uploading.

Parameters:

* Preview Size – defines a size of an image displayed on the detail/list view;
* Max File Size (Mb) – a validation.

## Attachment-Multiple

Allows to upload multiple files.

Parameters:

* Source List – allows a user to get a file from another record (*Documents* source is available out-of-the-box);
* Max File Size (Mb) – a validation;
* Accept – which file types can be accepted; see [info](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/file#Unique_file_type_specifiers) about file types;
* Preview Size – defines a size of an image displayed on the detail/list view.

## Number

An auto-incrementing number of string type with a possible prefix and specific length.

Parameters:

* Prefex – a text that will be preprended to a number;
* Next Number – a number that will be applied to the next created record;
* Pad Length – a length of the numeric part; if less, then will be padded with zero digits, e.g. `00001`.

![Number](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/fields/number.png)

## Auto-increment

A generated read-only auto-incrementing integer number.

## Barcode

As of v5.8.

A barcode. Can be printed to PDF.

Parameters:

* Code Type – a type of barcode; supported types: CODE128, CODE128A, CODE128B, CODE128C, EAN13, EAN8, EAN5, EAN2, UPC, UPCE, ITF14, pharmacode, QRcode;
* Last Character – for EAN13 type, often is `>`.

## Foreign

A field of a related record. Read-only.

Parameters:

* Link – defines where the field will be taken from.
* Field – a field of a related record.

## Email

A set of email addresses with their parameters: *Opted-out*, *Invalid*, *Primary*.

## Phone

A set of phone numbers with their parameters: *Type*, *Opted-out*, *Invalid*, *Primary*.

Parameters:

* Type List – a list of types available for phone numbers (e.g. Home, Office).

## Link

A record related through *Belongs-To* (*many-to-one* or *one-to-one*) relationship.

## Link-Parent

A record related through *Belongs-To-Parent* relationship. Can be of different entity types.

Parameters:

* Entity List – a list of entity types available to be related through the field.

## Link-Multiple

A set of records related through *Has-Many* (*many-to-many* or *one-to-many*) relationship. Not all relationships have their link-multiple fields. Only those do, where *Link-Multiple* parameter(s) is enabled.
