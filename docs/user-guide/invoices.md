# Invoices

The Invoices feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/) extension.

An Invoice record represents a group of products or services with their quantities and prices.

You can add the *Invoices* panel to Account detail view to be able to see related sales orders. At Administration > Layout Manager > Accounts > Relationships.

You can add the Invoices panel to Opportunity detail view at Administration > Layout Manager > Opportunities > Relationships.

In the article:

* [Converting from Opportunity, Quote or Sales Order](#converting-from-opportunity-quote-or-sales-order)
* [Total Values Layout](#total-values-layout)
* [Invoice Items](#invoice-items)
* [Printing to PDF](#printing-to-pdf)
* [Sending invoice in email](#sending-invoice-in-email)
* [Automatic numbering](#automatic-numbering)
* [Default tax](#default-tax)
* [Copying values from product to invoice item](#copying-values-from-product-to-invoice-item)
* [Automation with Workflows or BPM](#automation-with-workflows-or-bpm)

## Converting from Opportunity, Quote or Sales Order

Method 1. Create a new invoice, on the form specify the needed opportunity/quote/sales order. Data will be copied from the opportunity/quote/sales order to the created invoice.

Method 2. Create a new invoice from Invoices relationship panel on the detail view of the opportunity/quote/sales order.

## Total Values Layout

The layout of total value fields (in the bottom on detail view) can be modified at Administration > Layout Manager > Invoices > Bottom Total.

## Invoice Items

Invoice has a list of items. Each item can represent a certain product or a service with description, quantity, tax rate, list price and unit price fields. It's possible to sort items manually.

There is an ability to add custom fields for Invoice Item entity using Entity Manager.

### Invoice Items Layout

The layout of invoice items can be modified at Administration > Layout Manager > Invoice Items > List (Item).

### Discount Rate

It's possible to specify a discount in percents. To have this ability, administrator should add 'Discount (%)' field to the List (Item) layout.

## Printing to PDF

Invoices can be printed to PDF. This action is available in the dropdown next to Edit button on the invoice’s detail view. Then, you will be prompted to select a template. More info about printing to PDF is available [here](printing-to-pdf.md).

### Templates

See the documentation [for quote templates](quotes.md#templates).

## Sending invoice in email

Invoice PDF can be send in email as an attachment. Open an invoice record, click the dropdown next to Edit button and then click Email PDF.

## Automatic numbering

By default, the *Number* field is auto-incremented. You can disable auto-increment at Administration > Entity Manager > Invoice > Fields > number. It's also possible to make the number field read-only.

The prefix of the next number, the next number itself and the quantity of digits in the number can be configured at Administration > Entity Manager > Invoice > Fields > numberA.

By default, there is no *Name* field on the *Detail* layout. The *Number* is used as a name. You can add the Number field at Administration > Entity Manager > Invoice > Layouts > Detail.

## Default tax

You need to have a Tax record created in your CRM. Taxes can be accessed at Quotes list view > dropdown in the top-right corner > Taxes.

Administrator can specify a default Tax record at Administration > Entity Manager > Invoices > fields > Tax > Default.

## Copying values from product to invoice item

Field values can be transferred from a product to an invoice item upon product selection. Field names you want to be copied should coincide in Product and Invoice Item entities.

You can select which fields you need to be copied at Administration > Entity Manager > Invoice Item > Fields > Product > Fields to Copy.

## Automation with Workflows or BPM

The following service actions are available in Workflows and BPM tools:

* Add Invoice Items
* Convert Currency
* Send in Email

## See also

* [Custom calculations for Quote totals](../development/quote-custom-calculations.md)
