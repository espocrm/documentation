# Printing to PDF

The Print to PDF feature allows to generate PDF documents with record data. The document content is defined by a Template.

!!! warning "Important"

    You need to have at least one Template for the entity type of the record you want to print.

### Printing single record

The *Print to PDF* action is available on the detail view under the dropdown next to the *Edit* button.

### Printing multiple records

*Print to PDF* is available in the list view as a mass action. You need to select needed records and click *Print to PDF* from the *Actions* menu. It will generate a single merged PDF file or multiple PDFs zipped (depending on a used engine) for multiple records.

By default, the maximum number of records is limited to 50. The limit is defined by the config parameter `massPrintPdfMaxCount`.

### Access control

Access to PDF printing is controlled by Roles. An ddministrator can set a *read* access level for the *Template* entity type.

### Engines

PDF documents are generated from HTML code by the use a PDF engine. Out of the box, Espo supports [Dompdf](https://github.com/dompdf/dompdf) engine. [Tcpdf](https://github.com/tecnickcom/TCPDF) engine is available as an [extension](https://github.com/yurikuzn/ext-tcpdf/releases). Dompdf has better CSS support. Tcpdf supports some languages which Dompdf does not.

The engine can be switched at Administration > Settings > PDF Engine.

## Templates

Table of content: 

* [Code view](#code-view)
* [Charset issues](#charset-issues)
* [Access to templates](#access-to-templates)
* [Page numbering](#page-numbering)
* [Page breaking](#page-breaking)
* [Condition checking](#condition-checking)
* [Each iterator](#each-iterator)
* [Lookup](#lookup)
* [Expressions](#expressions)
* [Logical expressions](#logical-expressions)
* [Images](#images)
* [Date & time formatting](#date-time-formatting)
* [Number formatting](#number-formatting)
* [Currency symbol](#currency-symbol)
* [Text field](#text-field)
* [Related records](#related-records)
* [Multi-enum & Array fields](#multi-enum-array-fields)
* [Checklist field](#multi-enum-array-fields)
* [Barcode field](#barcode-field)
* [Raw values](#raw-values)
* [Maps](#maps)
* [Custom helpers](#custom-helpers)

Available undser Administration > PDF Templates.

For more precise editing it's recommended to use Code View mode. To switch to Code View click on the button *\</\>*.

You can print fields of the record as well as fields of related records by utilizing placeholders (Handlebars like) in your template.

!!! example "Examples"

    * `{{name}}` – Name of the record;
    * `{{assignedUserName}}` – Assigned User;
    * `{{account.name}}` – Name of the related account.

!!! note

    If an attribute name coincides with a name of some helper, you can use the following form: `{{this.attributeName}}`.

You can specify a document title in the *Title* field (as of v7.0). `{$name}` placeholder is available to substitute an entity name.

### Code view

A code view mode can be enabled by clicking *\</\>* button. It allows to edit raw HTML and make sure the layout is not messed up.

### Charset issues

If some characters are not displayed in generated PDF files, it usually can be solved by changing a font in a template. For Arabic language use 'AlArabiya' font, for Chinese – 'CID-0 cs'.


### Access to templates

Administrator can add Templates tab at Administration > User Interface. An access to templates must be defined in Roles (*Templates* scope).

### Page numbering

Placeholders are only available in footer (and header if it's set to be printed on each page).

* `{pageNumber}` – the current number of the page

### Page breaking

In places where you need to have an explicit page break, add:

```
{{pagebreak}}
```

### Condition checking

#### Conditional rendering attribute x-if

*As of v8.4.*

```
<table>
    <tr x-if="{{equal status 'Active'}}">
        <td></td>
    </tr>
</table>
```

Helpers:

* if
* unless
* ifEqual
* ifNotEqual
* equal
* notEqual

#### if

```
{{#if value}}
    {{value}}
{{/if}}
```
```
{{#if value}}
    {{value}}
{{else}}
    No value
{{/if}}
```

```
{{#if condition1}}
    
{{else if condition2}}

{{else}}

{{/if}}
```

#### unless

Opposite to *if*.

```
{{#unless value}}
    No value
{{/unless}}
```

```
{{#unless value}}
    No value
{{else}}
    {{value}}
{{/unless}
```

#### ifEqual

```
{{#ifEqual a b}}
    a is equal b
{{else}}
    a is not equal b
{{/ifEqual}}
```

#### ifNotEqual

Opposite to *ifEqual*.

#### equal

*As of v8.4.*

Returns boolean.

```
{{#if (equal status 'Active')}}
    ...
{{/if}}
```

#### notEqual

*As of v8.4.*

Returns boolean.

```
{{#if (notEqual status 'Active')}}
    ...
{{/if}}
```

### Each iterator

Looping through a list of items.

Example:

```
{{#each contacts}}
    Contact name: {{name}}
{{/each}}
```

Array (list):

```
{{#each array}}
   {{this}} – item
   {{@index}} – index
{{/each}}
```

Object (map):

```
{{#each map}}
   {{this}} – item
   {{@key}} – key
{{/each}}
```

!!! note

    Using `<tr>` and `<td>` tags along with `{{#each}}` helper is not recommended as it breaks markup of a *contenteditable* element.

With *iterate* attribute (as of v8.2):

```html
<table style="width: 100%;">
  <tbody>
    <tr iterate="{{contacts}}">
      <td>{{name}}</td>
      <td>{{assignedUserName}}</td>
    </tr>
  </tbody>
</table>
```

Displaying certain number of items in one row:

```
{{#each contacts}}
   {{#ifMultipleOf @key 3}}<br>{{/ifMultipleOf}}{{name}} 
{{/each}}
```

Access a parent scope:

```
{{#each contacts}}
    {{../name}}
{{/each}}
```

### Lookup

In object (map):

```
{{lookup subject key}}
```

In array:

```
{{lookup teamsId index}}
```

### Expressions

* `{{subject.key}}` – lookup in objects;
* `{{array.[0]}}` – lookup in arrays;
* `{{~anyTag}}` – remove all previous spacing;
* `{{anyTag~}}` – remove all next spacing;
* `{{{helper}}}` – prevent escaping;
* `{{helper1 (helper2  arg1 arg2) arg2 arg3}}` – sub-expression passed as an argument;

### Logical expressions

*As of 8.4.*

Helpers:

* and
* or
* not

To be used in sub-expressions.

Examples:

```
{{#if (or (equal status 'Draft') (equal status 'Active'))}}
    ...
{{/if}}
```

```
{{#if (and value1 value2 value3)}}
    ...
{{/if}}
```

### Images

```
{{imageTag imageFieldNameId width=50 height=50}}
```

* *imageFieldNameId* is a name of image field, concatenated with *Id*
* *width* and *height* can be omitted

Another way to print images for older versions. Add in code view:

```
<img src="{{file imageFieldNameId}}">
```

where `imageFieldNameId` – the name of an image field, concatenated with the suffix *Id*.


### Date & time formatting

See info about [date formatting](../administration/date-formatting.md).

Format *Date-Time* field:

```
{{dateFormat createdAt_RAW format='MMMM DD, YYYY' timezone='Europe/London'}}
```

Format *Date* field:

```
{{dateFormat closeDate_RAW format='YYYY MMMM DD'}}
```

Print formatted *now*:

```
{{dateFormat now_RAW format='MMMM DD, YYYY HH:mm'}}
```

Print formatted *today*:

```
{{dateFormat today_RAW format='MMMM DD,YYYY'}}
```

Specific language:

```
{{dateFormat createdAt_RAW format='MMMM DD' language='de_DE'}}
```

### Number formatting

To display float numbers w/o fractional part (as integer) use the following expression:
```
{{numberFormat quantity_RAW decimals=0}}
```

`quantity` is a field name.

Custom formatting for currency values:
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```

Value `10000.5` will be printer as `10 000,50`.

Note that `_RAW` part is appended to a field name.

### Currency symbol

```
{{amountCurrencySymbol}}
```

where `amount` is a field name (of *currency* type).

### Text field

To display text fields (multi-line) use triple braces

```{{{description}}}```.

Print markdown (as of v8.1):

```
{{markdownText fieldName_RAW}}
```

### Related records

*Many-to-many and one-to-many.*

It's possible to loop through a link collection.

The max number of records is 100. It can be changed with a config parameter *htmlizerLinkLimit*.

!!! example

    Printing contact names and roles of an opportunity:

    ```
    {{#each contacts}}
        Name: {{name}},
        Role: {{opportunityRole}},
        Contact's Account Type: {{account.type}}
    {{/each}}
    ```

    Where *contacts* is a relationship name. You can obtain relationship names at Administration > Entity Manager.


!!! example

    Example, printing contact names of an opportunity:

    ```
    {{#each contactsIds}}
        {{var this ../contactsNames}}
    {{/each}}
    ```

### Multi-enum & Array fields

Printing selected items:

```
{{#each fieldName}}
   {{./this}}
{{/each}}
```

### Checklist field

```
Option 1: {{checkboxTag fieldName option='Option 1' color='blue'}}
Option 2: {{checkboxTag fieldName option='Option 2' color='blue'}}
Option 3: {{checkboxTag fieldName option='Option 3' color='blue'}}
```

### Barcode field

```
{{barcodeImage barcodeField_RAW type='EAN8' width=60 height=30 fontsize=14 text=true padding=0}}
```

Where *barcodeField* is the name of your barcode field.

Parameters *fontsize*, *text*, *padding* are supported only in the TCPDF engine.

(TCPDF only)

Available types:

* CODE128
* CODE128A
* CODE128B
* CODE128C
* EAN13
* EAN8
* EAN5
* EAN2
* UPC
* UPCE
* ITF14
* pharmacode
* QRcode

### Raw values

To access a raw value of a specific attribute you need to add a suffix  `_RAW` to the attribute name. The raw value is a not formatted value. Raw date-time values are in UTC timezone.

!!! example

    Example (applying another format to the raw value):

    ```
    {{numberFormat quantity_RAW decimals=0}}
    ```

    *quantity* is a field name.

### Maps

It's possible to print Google Maps image in PDF. See [here](../administration/maps.md#printing-in-pdf).

### Custom helpers

See [here](../development/template-custom-helper.md).
