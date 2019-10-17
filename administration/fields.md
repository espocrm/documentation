# Fields

## Field types

The list of field types available for creating:

* [Varchar](#varchar) – a single-line text;
* [Enum](#enum) – selectbox, only one value can be selected;
* [Text](#text) – a multiline text with markdown support;
* [Date](#date) – date w/o time;
* [Date-Time](#date-time) – date and time;
* [Currency](#currency) – for currency values, a pair of number and currency;
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
* [Auto-increment](#auto-increment) – a generated read-only auto-incrementing integer number.
* [Foreign](#foreign) – shows a value of the related record. 

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

For Enum, Array and Multi-Enum fields it's possible to define different sets of options that will be available for the field depending on which condition is met. See more [here](dynamic-logic.md).

Available items:

* Conditions making field visible
* Conditions making field required
* Conditions making field read-only
* Conditional options – for enum, multi-enum, checklist, array, varvhar fields

----

## Varchar

A single-line text.

Parameters:

* Max-length – a max acceptable length of text;
* Trim – to trim whitespaces from text;
* Options – a pre-defined list of values for an autocomplete.

![Varchar](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/varchar.png)

Field in JSON format:
```
{
    "varchar": "test string"
}
```

## Enum

Selectbox, only one value can be selected.


Parameters:

* Options – a list of values (key => label pairs); color (style) for each value can be specified (applied when param *Dispaly as Label* is enabled);
* Is Sorted – to sort a list alphabetically;
* Display as Label – a value will be displayed as a label with a color; a color for each option can be specified.

It's possible to define conditional options with Dynamic Logic.

![Enum](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/enum.png)

![Enum detail view](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/enum-detail.png)

Field in JSON format:
```
{
    "enum": "Test_1"
}
```

## Text

A multiline text with markdown support.

Parameters:

* Max-length – a max acceptable length of a text;
* Disable Text Cut – if not checked, then long texts will be shortened and can be expanded (for detail view mode);
* Number of rows of textarea – if specified, then height of a textarea will be fixed, otherwise it's flexible (for edit view mode);
* Cut Height (px) – a max height of a text, if longer, then it will be cut (for detail view mode);
* Display raw text (no markdown) – to disable markdown support.

![Text](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/text.png)

![Text detail view](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/text-detail.png)

Field in JSON format:
```
{
    "text": "Test text."
}
```

## Date

Date w/o time.

Parameters:

* After (field) – a validation: a date value should be after a date value of a specified field;
* Before (field) – a validation: a date value should be before a date value of a specified field;
* Use Numeric Format – if not checked, then words 'today', 'yesterday', 'tomorrow' are in the detail view mode.

![Date](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/date.png)

![Date detail view](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/date-detail.png)

Field in JSON format:
```
{
    "date": "2019-10-09"
}
```

## Date-Time

Date and time.

Parameters:

* After (field) – a validation: a date value should be after a date value of a specified field;
* Before (field) – a validation: a date value should be before a date value of a specified field;
* Use Numeric Format – if not checked, then words 'today', 'yesterday', 'tomorrow' are in the detail view mode;
* Minutes Step – defines items displayed in the minutes dropdown (in the edit mode).

![Date-Time](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/date-time.png)

![Date-Time detail view](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/date-time-detail.png)

Field in JSON format:
```
{
    "dateTime": "2019-10-09 09:00:00"
}
```

## Currency

A currency value, a pair of number and currency.

Parameters:

* Min – a validation: min acceptable value; if empty, then no validation applied;
* Max – a validation: max acceptable value; if empty, then no validation applied.

![Currency](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/currency.png)

![Currency detail view](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/currency-detail.png)

Field in JSON format:
```
{
    "currency": 1000,
    "currencyCurrency": "USD"
}
```

## Int

A whole number.

Parameters:

* Min – a validation: min acceptable value; if empty, then no validation applied;
* Max – a validation: max acceptable value; if empty, then no validation applied;
* Disable Formatting – if not checked, then a value is formatted with a thousand separator.

Field in JSON format:
```
{
    "integer": 9999
}
```

## Float

A number with a decimal part.

Parameters:

* Min – a validation: min acceptable value; if empty, then no validation applied;
* Max – a validation: max acceptable value; if empty, then no validation applied.

Field in JSON format:
```
{
    "float": 25.555
}
```

## Boolean

A checkbox. Two possible values: true and false.

![Boolean](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/bool.png)

Field in JSON format:
```
{
    "boolean": true
}
```

## Multi-Enum

A list of values, multiple values can be selected. The list is ordered.

![Multi-Enum](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/multi-enum.png)

![Multi-Enum detail view](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/multi-enum-detail.png)

Parameters:

* Options – a list of values (key => label pairs); color (style) for each value can be specified (applied when param *Dispaly as Label* is enabled);
* Is Sorted – to sort a list alphabetically;
* Allow Custom Options – if checked, a user can add custom values (not defined by *Options* parameter) by typing text and pressing the enter key;
* Max Item Count – validation: how much items can be added;
* Display as Label – values will be displayed as a label with a color; a color for each option can be specified;
* Display as List – values will be displayed each in new line.

Field in JSON format:
```
{
    "multiEnum": ["test_1", "test_2", "test_3"]
}
```

## Checklist

A list of checkboxes.

Parameters:

* Options – a list of values (key => label pairs); color (style) for each value can be specified (applied when param *Dispaly as Label* is enabled);
* Is Sorted – to sort a list alphabetically;
* Max Item Count – validation: how much items can be checked;

Field in JSON format:
```
{
    "checklist": ["test_1", "test_2"]
}
```

## Array

A list of values, similar to Multi-Enum field.

Parameters:

* Options – a list of values (key => label pairs); if no options specified, then a user will be able to add any options;
* Empty string value is not allowed – if not checked, a user can add an empty string as an item;
* Max Item Count – validation: how much items can be added.

![Array](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/array.png)

Field in JSON format:
```
{
    "array": ["test_1", "test_2"]
}
```
## Address

An address with street, city, state, postal code and country.

![Address](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/address.png)

**Note:** with address field is automatically creating:

* addressCity – a varchar type field.
* addressCountry – a varchar type filed.
* addressMap – a map type that integrates with Google maps (Administration → Integrations → Google Maps).
* ddressPostalCode – a varchar type filed.
* addressState – a varchar type filed.
* addressStreet – a text type filed.

Field in JSON format:
```
{
    "addressStreet": "",
    "addressCity": "",
    "addressState": "",
    "addressCountry": ""
}
```

## Url

For storing links.

Parameters:

* Max-length – a max acceptable length of text;
* Strip – if checked, then `http(s)://` if trailing `/` will be stripped.

Field in JSON format:
```
{
    "url": "https://google.com"
}
```
if Strip is checked:
```
{
    "url": "google.com"
}
```

## Wysiwyg

Similar to Text field, but with HTML support.

Parameters:

* Height (px) – a height of the field (in edit view mode); if empty – then  height is flexible;
* Min Height (px) – a min height of the field (in edit view mode);
* Use Iframe – if checked, then HTML will be placed into IFRAME element.

Field in JSON format:
```
{
    "wysiwyg": "<p><b>Test wysiwyg text. </b><br></p>"
}
```

## File

For file uploading.

Parameters:

* Source List – allows a user to get a file from another record (*Documents* source is available out-of-the-box);
* Max File Size (Mb) – validation;
* Accept – which file types cab be accepted; see [info](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/file#Unique_file_type_specifiers) about file types.

Field in JSON format:
```
{
    "name": "screenshot.png",
    "type": "image/png",
    "size": 49113,
    "role": "Attachment",
    "relatedType": "AAAFieldsDescriptionAAA",
    "file": "data:image/png;base64,iVBORw0KGgoAAAANS...",
    "field": "file"
}
```

## Image

For image uploading.

Parameters:

* Preview Size – defines a size of an image displayed on the detail/list view;
* Max File Size (Mb) – validation.

Field in JSON format:
```
{
    "imageId": "5da70723e16fec761",
    "imageName": "screenshot.png"
}
```

## Attachment-Multiple

Allows to upload multiple files.

Parameters:

* Source List – allows a user to get a file from another record (*Documents* source is available out-of-the-box);
* Max File Size (Mb) – validation;
* Accept – which file types cab be accepted; see [info](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/file#Unique_file_type_specifiers) about file types;
* Preview Size – defines a size of an image displayed on the detail/list view.

Field in JSON format:
```
{
    "attachmentMultipleIds": ["5da6e98cc409659f0", "5da6e991396ae2b3d"],
    "attachmentMultipleNames": {
        "5da6e98cc409659f0": "test_1",
        "5da6e991396ae2b3d": "test_2"
    },
    "attachmentMultipleTypes": {
        "5da6e98cc409659f0": "text/plain",
        "5da6e991396ae2b3d": "text/plain"
    }
}
```
## Number

An auto-incrementing number of string type with a possible prefix and specific length.

Parameters:

* Prefex – a text that will be preprended to a number;
* Next Number – a number that will be applied to the next created record;
* Pad Length – a length of the numeric part; if less then will be padded with zero digits, e.g. `00001`.

![Number](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/fields/number.png)

Field in JSON format:
```
{
    "numberAutoincrement": "Q-00002"
}
```

## Auto-increment

A generated read-only auto-incrementing integer number.

Field in JSON format:
```
{
    "autoincrement": 1
}
```

## Email

A set of email addresses with their parameters: *Opted-out*, *Invalid*, *Primary*.

Field in JSON format:
```
{
    "emailAddress": "test@testmail.com",
    "emailAddressData": [{
        "emailAddress": "test@testmail.com",
        "primary": true,
        "optOut": false,
        "invalid": false,
        "lower": "test@testmail.com"
    }]
}
```

## Phone

A set of phone numbers with their parameters: *Type*, *Opted-out*, *Invalid*, *Primary*.

Parameters:

* Type List – a list of types available for phone numbers (e.g. Home, Office).

Field in JSON format:
```
{
    "phoneNumber": "454-788-153",
    "phoneNumberData": [{
        "phoneNumber": "454-788-153",
        "primary": true,
        "type": "Office",
        "optOut": false,
        "invalid": false
    }]
}
```

## Link

A record related through *Belongs-To* (*many-to-one* or *one-to-one*) relationship.

Field in JSON format:
```
{
    "accountId": "53203b94286d1",
    "accountName": "Anakonda's Heel"
}
```

## Link-Parent

A record related through *Belongs-To-Parent* relationship. Can be of different entity types.

Parameters:

* Entity List – a list of entity types available to be related through the field.

Field in JSON format:
```
{
    "parentName": "Anakonda's Heel",
    "parentId": "53203b94286d1"
}
```

## Link-Multiple

A set of records related through *Has-Many* (*many-to-many* or *one-to-many*) relationship. Not all relatioships have their link-multiple fields. Only those do, where *Link-Multiple* parameter(s) is enabled.

Field in JSON format:
```
{
    "accountsIds": ["53203b9428628", "53203b942857f"],
    "accountsNames": {
        "53203b9428628": "Ladna Barka",
        "53203b942857f": "Perfectico"
    },
    "accountsColumns": {
        "53203b9428628": {
            "role": "Manager",
            "isInactive": false
        },
        "53203b942857f": {
            "role": "Sales Manager",
            "isInactive": false
        }
    }
}
```

## Foreign

A field fetches data from the related record.

Parameters:

* Link – *Created By*, *Modified By*, *Assigned User*, *file*, *image* (can be set upon field creation).
* Field – a field that exsists in the related record (can be set upon field creation).

Field in JSON format:
```
{
    "accountType": "Investor"
}
```