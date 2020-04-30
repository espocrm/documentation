# Quotes

Quotes feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/).

Quote is a specific group of products or services with their quantities and prices that you quote to customers.

Quote has a relationship with Opportunity. You can add Quotes panel to Opportunity detail view at Administration > Layout Manager > Opportunities > Relationships. When creating a new quote linked to an opportunity it transfers opportunity items to the quote.

You can add Quotes panel to Account's detail view to be able to see related quotes: Administration > Layout Manager > Accounts > Relationships.

## Converting from Opportunity

Method 1. Create a new quote, on the form specify a needed opportunity. Data will be copied from the opportunity to the created quote.

Method 2. Create a new quote from Quotes relationship panel on the detail view of the opportunity.

## Generating Sales Orders and Invoices from Quote

You are able to create Sales Order and Invoice from existing Quote.

Method 1. Create a new sales order or invoice, on the form specify needed quote. Data will be copied from the quote to the created sales order or invoice.

Method 2. Create a new sales order or invoice from corresponding relationship panel on Quote detail view.

## Total Values Layout

Layout of total value fields (in the bottom on detail view) can be modified at Administration > Layout Manager > Quotes > Bottom Total.

## Quote Items

Quote has a list of items. Each item can represent a certain product or a service with description, quantity, tax rate, list price and unit price fields. It's possible to sort items manually.

There is an ability to add custom fields for Quote Item entity using Entity Manager.

### Quote Items Layout

Layout of quote items can be modified at Administration > Layout Manager > Quote Items > List (Item).

### Discount Rate

It's possible to specify a discount in percents. To have this ability, administrator should add 'Discount (%)' field to the List (Item) layout.

## Printing to PDF

Quotes can be printed to PDF. This action is available in dropdown next to Edit button on the quote’s detail view. Then you will be prompted to select Template. More info about printing to PDF is available [here](printing-to-pdf.md).

### Templates

By default, there is an example template available. You can create new templates (Quotes list view > top-right dropdown menu > Templates) as well as edit existing ones.

For more precise editing it's recommended to use Code View mode.

You can print fields of Quote record as well as fields of related records by utilizing placeholders in your template.

Examples:

`{{accountName}}` – Account name,

`{{{billingAddressStreet}}}` – street,

`{{account.type}}` – type of related Account,

`{{assignedUser.lastName}}` – last name of the assigned user.

If your line item is a product, you can print product’s fields.

Examples:

`{{product.length}}`,

`{{product.color}}`.

Length and color are custom fields of Product entity in examples.

Looping through quote items:

```
<!-- {{#each itemList}} -->
  <td>{{order}}</td>
  <td>{{name}}</td>
  <td>{{quantity}}</td>
  <td>{{product.weight}}</td>
  <td align="right">{{listPrice}}</td>
  <td align="right">{{unitPrice}}</td>
  <td align="right">{{amount}}</td>
<!-- {{/each}} -->
```

It's possible to print image fields:

```
<img src="{{file imageId}}">
```
where `imageId` – the name of custom image field, concatenated with the suffix `Id`.

For product line item:
```
<img src="{{file product.photoId}}">
```

To display float numbers (like quantity, unitPrice etc.) w/o fractional part (as integer) use the following expression:
```
{{numberFormat quantity_RAW decimals=0}}
```

Custom formatting for currency values (since version 4.8.3):
```
{{numberFormat unitPrice_RAW decimals=2 decimalPoint=',' thousandsSeparator=' '}}
```
Value `10000.5` will be printer as `10 000,50`.

To display text fields (multiline) use triple braces: `{{{description}}}`.

#### Quote Items attributes

You can use these attributes in a template inside the loop `{{#each itemList}}`:

* name
* quantity
* listPrice
* unitPrice
* discount
* amount
* unitWeight
* weight
* taxRate
* order
* description

All fields can be found at Administration > Entity Manager > Quote Items > Fields.


## Sending quote in email

Quote PDF can be send in email as an attachment. Open quote record, click dropdown next to Edit button and the click Email PDF.

## Automatic numbering

By default a number field is auto-incremented. You can disable auto-increment at Administration > Entity Manager > Quote > Fields > number. It's also possible to make the number field read-only.

The next number, a prefix can be configured at Administration > Entity Manager > Quote > Fields > numberA.

## Default tax

1. Specify default Tax record at Administration > Entity Manager > Quote > fields > Tax > Default.
2. Specify default tax rate at Administration > Entity Manager > Quote > fields > Tax Rate > Default.

## Copying values from product to quote item

Field values can be transferred from a product to a quote item upon product selection. Field names you want to be copied should coincide in Product and Quote Item enities.

You can select which fields you need to be copied at Administration > Entity Manager > Quote Item > Fields > Product > Fields to Copy.

## Automation with Workflows or BPM

The following service actions are available in Workflows and BPM tools:

* Add Quote Items
* Convery Currency
* Send in Email

## See also

* [Custom calculations for Quote totals](../development/quote-custom-calculations.md)
