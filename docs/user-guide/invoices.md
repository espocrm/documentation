# Invoices

Invoices feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/) extension.

Invoice record represents a group of products or services with their quantities and prices.

You can add Invoices panel to Account detail view to be able to see related sales orders. Administration > Layout Manager > Accounts > Relationships.

You can add Invoices panel to Opportunity detail view at Administration > Layout Manager > Opportunities > Relationships.

## Converting from Opportunity, Quote or Sales Order

Method 1. Create a new invoice, on the form specify needed opportunity/quote/sales order. Data will be copied from the opportunity/quote/sales order to the created invoice.

Method 2. Create a new invoice from Invoices relationship panel on the detail view of the opportunity/quote/sales order.

## Total Values Layout

Layout of total value fields (in the bottom on detail view) can be modified at Administration > Layout Manager > Invoices > Bottom Total.

## Invoice Items

Invoice has a list of items. Each item can represent a certain product or a service with description, quantity, tax rate, list price and unit price fields. It's possible to sort items manually.

There is an ability to add custom fields for Invoice Item entity using Entity Manager.

### Invoice Items Layout

Layout of invoice items can be modified at Administration > Layout Manager > Invoice Items > List (Item).

### Discount Rate

It's possible to specify a discount in percents. To have this ability, administrator should add 'Discount (%)' field to the List (Item) layout.

## Printing to PDF

Invoices can be printed to PDF. This action is available in dropdown next to Edit button on the invoice’s detail view. Then you will be prompted to select a template. More info about printing to PDF is available [here](printing-to-pdf.md).

### Templates

See documentation [for templates for quotes](quotes.md#templates).

## Sending invoice in email

Invoice PDF can be send in email as an attachment. Open an invoice record, click dropdown next to Edit button and the click Email PDF.

## Automatic numbering

By default a number field is auto-incremented. You can disable auto-increment at Administration > Entity Manager > Invoice > Fields > number. It's also possible to make the number field read-only.

The next number, a prefix can be configured at Administration > Entity Manager > Invoice > Fields > numberA.

## Default tax

1. Specify default Tax record at Administration > Entity Manager > Invoice > fields > Tax > Default.
2. Specify default tax rate at Administration > Entity Manager > Invoice > fields > Tax Rate > Default.

## Copying values from product to invoice item

Field values can be transferred from a product to an invoice item upon product selection. Field names you want to be copied should coincide in Product and Invoice Item enities.

You can select which fields you need to be copied at Administration > Entity Manager > Invoice Item > Fields > Product > Fields to Copy.

## Automation with Workflows or BPM

The following service actions are available in Workflows and BPM tools:

* Add Quote Items
* Convery Currency
* Send in Email

## See also

[Custom calculations for Quote totals](../development/quote-custom-calculations.md)
