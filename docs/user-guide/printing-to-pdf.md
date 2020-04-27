# Printing to PDF

Printing to PDF provides the ability to generate PDF documents with a record data. The document content is defined by Template.

Important: You need to have at least one Template for the entity type of the record you want to print.

### Printing single record

'Print to PDF' is available on the detail view under the dropdown next to the 'Edit' button.

### Printing multiple records

This feature is available since EspoCRM version 5.3.0.

'Print to PDF' is available on the list view as a mass action. You need to select needed records and click Print to PDF from Actions menu. It will generate a single merged PDF file for multiple records.

By default the max number of records is limited to 50. The limit is defined by the config parameter `massPrintPdfMaxCount`.

Note, that page numbering gets reset for each record. You need to use the placeholder `{pageAbsoluteNumber}` to print absolute page numbers in the footer.

### Access restriction to printing

Can be achieved by restriction of access to Template entity type.

## Templates

* [Charset issues](#charset-issues)
* [Access to templates](#access-to-templates)
* [Page numbering](#page-numbering)
* [Page breaking](#page-breaking)
* [Condition checking](#condition-checking)
* [Each iterator](#each-iterator)
* [Images](#images)
* [Date & Time formattng](#date-time-formatting)
* [Number formatting](#number-formatting)
* [Currency symbol](#currency-symbol)
* [Text field](#text-field)
* [Related records](#related-records)
* [Multi-enum & Array fields](#multi-enum-array-fields)
* [Checklist field](#multi-enum-array-fields)
* [Barcode field](#barcode-field)
* [Tables](#tables)
* [Raw values](#raw-values)

Available at Administration > PDF Templates.

For more precise editing it's recommended to use Code View mode. To switch to Code View click on the button `</>`.

You can print fields of the record as well as fields of related records by utilizing placeholders (Handlebars like) in your template.

Examples:

* `{{name}}` – Name of the record;
* `{{assignedUserName}}` – Assigned User;
* `{{account.name}}` – Name of the related account.


### Charset issues

If some charecters are not displayed in generated PDF files, it usually can be solved by changing a font in a template. For Arabic language use 'AlArabiya' font, for Chinese – 'CID-0 cs'.


### Access to templates

Administrator can add Templates tab at Administration > User Interface. An access to templates must be defined in Roles (*Templates* scope).

### Page numbering

Placeholders are only available in footer.

* `{pageNumber}` – the current number of the page
* `{totalPageNumber}` – the total number of record (since 5.7.12)
* `{pageAbsoluteNumber}` – the absolute number of the page, when printing multiple records

### Page breaking

To add an explicit page break you need to add the following code (in code view):

```
<br pagebreak="true">
```

Since the version 5.8.0 you can use:

```
{{pagebreak}}
```

### Condition checking

#### if

```
{{#if value}}
    {{value}}
{{/if}}

{{#if value}}
    {{value}}
{{else}}
    No value
{{/if}}
```

#### unless

Opposite to *if*.

```
{{#unless value}}
    No value
{{/unless}}

{{#unless value}}
    No value
{{else}}
    {{value}}
{{/unless}
```

### Each iterator

Use Code View mode and put `each` helper inside an html comment tag `<!--  -->`. This is needed to avoid stripping by wysiwyg editor when you have `{{#each}}` inside a table tag. To switch to Code View click on the button `</>`.

Example:

```
 <table>
 <!-- {{#each itemList}} -->
    <tr>
      <td>{{name}}</td>
      </td>{{amount}}</td>
    </tr>
 <!-- {{/each}} -->
 </table>
```

`itemList` is an json array field (available in Quote, Sales Order, Invoices entity types).

### Images

Available since the version 5.8.0.

```
{{imageTag imageFieldNameId width=50 height=50}}
```

* *imageFieldNameId* is a name of image field, concatenated with *Id*
* *width* and *height* can be omitted

Another way to print images. Add in code view:

```
<img src="{{file imageFieldNameId}}">
```

where `imageFieldNameId` – the name of an image field, concatenated with the suffix *Id*.


### Date & Time formatting

Available since version 5.8.0.

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

### Currency symbol

Available since 5.6.3 version.

```
{{amountCurrencySymbol}}
```
where `amount` is a field name.

### Text field

To display text fields (multi-line) use triple braces: ```{{{description}}}```.

### Related records

*Many-to-many and one-to-many.*

It's possible to loop through a link collection (since 5.5.0, before 5.7.6 only link-multiple fields were supported).

The max number of records is 100, can be changed with a config parameter *htmlizerLinkLimit*.

Example, printing contact names and roles of an opportunity:

```
{{#each contacts}}
    Name: {{name}},
    Role: {{opportunityRole}},
    Contact's Account Type: {{account.type}}
{{/each}}
```

`contacts` is a relationship name. You can obtain relationship names at Administraiton > Entity Manager.


Example, printing contact names of an opportunity (available since 5.3.0):
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

Available since version 5.8.0.

```
Option 1: {{checkboxTag fieldName option='Option 1' color='blue'}}
Option 2: {{checkboxTag fieldName option='Option 2' color='blue'}}
Option 3: {{checkboxTag fieldName option='Option 3' color='blue'}}
```

Available since version 5.7.3.

In code view:

```
{{#ifInArray 'item1' fieldName}}
<input type="checkbox" checked="checked" name="1" readonly="true" value="1">
{{else}}
<input type="checkbox" name="1" readonly="true" value="1">
{{/ifInArray}}
Item 1
<br>

{{#ifInArray 'item2' fieldName}}
<input type="checkbox" checked="checked" name="1" readonly="true" value="1">
{{else}}
<input type="checkbox" name="1" readonly="true" value="1">
{{/ifInArray}}
Item 2
<br>
```

### Barcode field

Available since version 5.8.0.

```
{{barcodeImage barcodeField type='EAN8' width=60 height=30 fontsize=14 text=true padding=0}}
```

`barcodeField` is a name of your field.

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


### Tables

You can use a regular *table* tag or special *tableTag* helper (available since version 5.8.0). The second way is preferable when using *{{#each}}* helper inside a table.

The following example prints all account's opportunities in a table format.

In code view:

```
{{#tableTag width="80%" border="0.5pt" cellpadding="4"}}
{{#each opportunities}}
{{#trTag}}
  {{#tdTag width="40%"}}{{name}}{{/tdTag}}
  {{#tdTag width="30%"}}{{assignedUserName}}{{/tdTag}}
  {{#tdTag width="30%" align="right"}}{{stage}}{{/tdTag}}
{{/trTag}}
{{/each}}
{{/tableTag}}
```

### Raw values

To access a raw value of a specific attribute you need to add  `_RAW` to the attribute name. The raw value is not formatted value, timezone is UTC for date-time fields.

Example (applying another format to the raw value):

```
{{numberFormat quantity_RAW decimals=0}}
```

*quantity* is a field name.

## See also

* [Custom helpers](../development/template-custom-helper.md)
