# Sales Orders

The Sales Orders feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/) extension.

A Sales Order represents a group of products or services with their quantities and prices.

You can add the Sales Orders panel to the Account detail view to be able to see related sales orders. At Administration > Layout Manager > Accounts > Relationships.

You can add the Sales Orders panel to the Opportunity detail view at Administration > Layout Manager > Opportunities > Relationships.

In the article:

* [Converting from Opportunity or Quote](#converting-from-opportunity-or-quote)
* [Generating Invoices from Sales Order](#generating-invoices-from-sales-order)
* [Total Values Layout](#total-values-layout)
* [Sales Order Items](#sales-order-items)
* [Printing to PDF](#printing-to-pdf)
* [Sending sales order in email](#sending-sales-order-in-email)
* [Automatic numbering](#automatic-numbering)
* [Default tax](#default-tax)
* [Copying values from product to sales order item](#copying-values-from-product-to-sales-order-item)
* [Locking](#locking)
* [Automation with Workflows or BPM](#automation-with-workflows-or-bpm)

## Converting from Opportunity or Quote

Method 1. Create a new sales order, on the form specify needed opportunity or quote. Data will be copied from the opportunity/quote to the created sales order.

Method 2. Create a new sales order from Sales Orders relationship panel on the detail view of the opportunity/quote.

## Generating Invoices from Sales Order

You are able to create Invoices from the existing Sales Order record.

Method 1. Create a new invoice, on the form specify a needed sales order. Data will be copied from the sales order to the created invoice.

Method 2. Create a new invoice from Invoices relationship panel on the detail view of the sales order record.

## Total Values Layout

The layout of total value fields (in the bottom on detail view) can be modified at Administration > Layout Manager > Sales Orders > Bottom Total.

## Sales Order Items

Sales Order has a list of items. Each item can represent a certain product or a service with description, quantity, tax rate, list price and unit price fields. It's possible to sort items manually.

There is an ability to add custom fields for Sales Order Item entity using Entity Manager.

### Sales Order Items Layout

The layout of sales order items can be modified at Administration > Layout Manager > Sales Order Items > List (Item).

### Discount Rate

It's possible to specify a discount in percents. To have this ability, administrator should add 'Discount (%)' field to the List (Item) layout.

## Printing to PDF

Sales Orders can be printed to PDF. This action is available in the dropdown next to Edit button on the sales order’s detail view. Then, you will be prompted to select a template. More info about printing to PDF is available [here](printing-to-pdf.md).

### Templates

See the documentation [for quote templates](quotes.md#templates).

## Sending sales order in email

Sales Order PDF can be send in email as an attachment. Open a sales order record, click the dropdown next to Edit button and then click Email PDF.

## Automatic numbering

By default the *Number* field is auto-incremented. You can disable auto-increment at Administration > Entity Manager > Sales Order > Fields > number. It's also possible to make the number field read-only.

The prefix of the next number, the next number itself and the quantity of digits in the number can be configured at Administration > Entity Manager > Sales Order > Fields > numberA.

By default, there is no *Name* field on the *Detail* layout. The *Number* is used as a name. You can add the Number field at Administration > Entity Manager > Sales Order > Layouts > Detail.

## Default tax

You need to have a Tax record created in your CRM. Taxes can be accessed at Quotes list view > dropdown in the top-right corner > Taxes.

Administrator can specify a default Tax record at Administration > Entity Manager > Sales Order > fields > Tax > Default.

Note: For older versions of Sales Pack & EspoCRM, you need also to specify the default tax rate value at Administration > Entity Manager > Sales Order > fields > Tax Rate > Default.

## Copying values from product to sales order item

Field values can be transferred from a product to a sales order item upon product selection. Field names you want to be copied should coincide in Product and Sales Order Item entities.

You can select which fields you need to be copied at Administration > Entity Manager > Sales Order Item > Fields > Product > Fields to Copy.

## Locking

A Sales Order can locked if it's completed or canceled. When a record is locked, a specific fields become read-only. An administrator can configure which exactly fields at: Administration > Entity Manager > Sales Order > Edit.

If the settings parameter *Forbid order unlocking* is checked, once a record is locked, it can be unlocked only by an administrator.

## Automation with Workflows or BPM

The following service actions are available in Workflows and BPM tools:

* Add Sales Order Items
* Convert Currency
* Send in Email

## See also

* [Custom calculations for Quote totals](../development/quote-custom-calculations.md)
