# Sales Orders

Sales Orders feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/) extension.

Sales Order represents a group of products or services with their quantities and prices.

You can add Sales Orders panel to Account detail view to be able to see related sales orders. Administration > Layout Manager > Accounts > Relationships.

You can add Sales Orders panel to Opportunity detail view at Administration > Layout Manager > Opportunities > Relationships.

## Converting from Opportunity or Quote

Method 1. Create a new sales order, on the form specify needed opportunity or quote. Data will be copied from the opportunity/quote to the created sales order.

Method 2. Create a new sales order from Sales Orders relationship panel on the detail view of the opportunity/quote.

## Generating Invoices from Sales Order

You are able to create Invoices from existing Sales Order record.

Method 1. Create a new invoice, on the form specify a needed sales order. Data will be copied from the sales order to the created invoice.

Method 2. Create a new invoice from Invoices relationship panel on the detail view of the sales order record.

## Total Values Layout

Layout of total value fields (in the bottom on detail view) can be modified at Administration > Layout Manager > Sales Orders > Bottom Total.

## Sales Order Items

Sales Order has a list of items. Each item can represent a certain product or a service with description, quantity, tax rate, list price and unit price fields. It's possible to sort items manually.

There is an ability to add custom fields for Sales Order Item entity using Entity Manager.

### Sales Order Items Layout

Layout of sales order items can be modified at Administration > Layout Manager > Sales Order Items > List (Item).

### Discount Rate

It's possible to specify a discount in percents. To have this ability, administrator should add 'Discount (%)' field to the List (Item) layout.

## Printing to PDF

Sales Orders can be printed to PDF. This action is available in dropdown next to Edit button on the sales order’s detail view. Then you will be prompted to select a template. More info about printing to PDF is available [here](printing-to-pdf.md).

### Templates

See documentation [for templates for quotes](quotes.md#templates).

## Sending sales order in email

Sales Order PDF can be send in email as an attachment. Open a sales order record, click dropdown next to Edit button and the click Email PDF.

## Automatic numbering

By default a number field is auto-incremented. You can disable auto-increment at Administration > Entity Manager > Sales Order > Fields > number. It's also possible to make the number field read-only.

The next number, a prefix can be configured at Administration > Entity Manager > Sales Order > Fields > numberA.

## Default tax

1. Specify default Tax record at Administration > Entity Manager > Sales Order > fields > Tax > Default.
2. Specify default tax rate at Administration > Entity Manager >  Sales Order > fields > Tax Rate > Default.

## Copying values from product to sales order item

Field values can be transferred from a product to a sales order item upon product selection. Field names you want to be copied should coincide in Product and Sales Order Item enities.

You can select which fields you need to be copied at Administration > Entity Manager > Sales Order Item > Fields > Product > Fields to Copy.

## Automation with Workflows or BPM

The following service actions are available in Workflows and BPM tools:

* Add Quote Items
* Convery Currency
* Send in Email

## See also

* [Custom calculations for Quote totals](../development/quote-custom-calculations.md)
