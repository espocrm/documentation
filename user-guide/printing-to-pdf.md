# Printing to PDF

Note: This feature is available since EspoCRM version 5.0.5.

Printing to PDF provides an ability to generate PDF documents with a record data. The document content is defined by Template.


1. You need to have at least one Template for the entity type of the record you want to print.
2. 'Print to PDF' will be available on the detail view under the dropdown next to the 'Edit' button.

## Templates

Templates tab is hidden by default. Administrator can add it at Administration > User Interface.

For more precise editing it's recommended to use Code View mode.

You can print fields of the record as well as fields of related records by utilizing placeholders in your template.

Examples: 

* `{{name}}` – Name of the record;
* `{{assignedUserName}}` – Assigned User;
* `{{account.name}}` – Name of the related account.

It's possible to print image fields:
```
<img src="{{file imageId}}">
```

where `imageId` – the name of custom image field, concatenated with the suffix `Id`.

To display float numbers w/o fractional part (as integer) use the following expression:
```
{{numberFormat quantity_RAW decimals=0}}
```

Custom formatting for currency values:
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```

Value `10000.5` will be printer as `10 000,50`.

To display text fileds (multiline) use triple braces: ```{{{description}}}```.
