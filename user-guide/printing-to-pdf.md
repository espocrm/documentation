# Printing to PDF

Printing to PDF provides an ability to generate PDF documents with a record data. The document content is defined by Template.

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

Available at Administration > PDF Templates.

For more precise editing it's recommended to use Code View mode.

You can print fields of the record as well as fields of related records by utilizing placeholders in your template.

Examples: 

* `{{name}}` – Name of the record;
* `{{assignedUserName}}` – Assigned User;
* `{{account.name}}` – Name of the related account.

### Images

It's possible to print image fields:
```
<img src="{{file imageId}}">
```

where `imageId` – the name of custom image field, concatenated with the suffix `Id`.

### Number formatting

To display float numbers w/o fractional part (as integer) use the following expression:
```
{{numberFormat quantity_RAW decimals=0}}
```

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

### Text fields

To display text fields (multi-line) use triple braces: ```{{{description}}}```.

### Each iterator

Use Code View mode and put `each` helper inside an html comment tag `<!--  -->`.

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

### Link-multiple fields

Since 5.5.0 it's possible to loop through link multiple collection.

Example, printing contact names and roles of an opportunity:

```
{{#each contacts}}
    Name: {{name}},
    Role: {{opportunityRole}},
    Contact's Account Type: {{account.type}}
{{/each}}
```

The following way is available since 5.3.0 version.

Example, printing contact names of an opportunity:
```
{{#each contactsIds}}
    {{var this ../contactsNames}}
{{/each}}
```

### Multi-enum and Array fields

Printing selected items:

```
{{#each fieldName}}
   {{./this}}
{{/each}}
```

### Page breaking

To add an explicit page break you need to add the following code (in code view):

```
<br pagebreak="true">
```

### Charset issues

If some charecters are not displayed in generated PDF files, it usually can be solved by changing a font in a template. For Arabic language use 'AlArabiya' font, for Chinese – 'CID-0 cs'.

### Access to Templates

Administrator can add Templates tab at Administration > User Interface, then it will be available for regular users. An access to templates can be defined in Roles.
