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
* [Locking](#locking)
* [E-Invoicing](#e-invoicing)

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

## E-Invoicing

*As of Sales Pack v2.4.*

Invoices can be exported to EN 16931 electronic invoices in a UBL format. The following CIUS specifications are supported:

* XRechnung
* PEPPOL BIS Billing 3.0
* CIUS-RO e-Factura
* CIUS-IT
* CIUS-AT-GOV
* CIUS-AT-NAT
* CIUS-ES-FACE
* NLCIUS

To export an Invoice to a UBL file, click **E-Invoice** from the dropdown menu next to the **Edit** button on the Invoice detail view. The UBL file can be also attached along with a PDF when sending an Invoice in email.

!!! note

    An E-Invoice can exported only if it is valid. It must include certain mandatory fields depending on the specification.

### Settings

E-Invoicing settings are available at Administration > Sales Pack Settings > Electronic Invoicing. Here you can specify the system **Default Format** to prevent the need to select the format each time you are exporting an invoice.

Specify **Seller Information** fields that will be included in electronic invoices. Fields, such as Company Name, Company Address, Electronic Address, VAT Number, etc.

### Account

To include a buyer's electronic address in electronic invoices, you need to specify the electronic address in an Account record. The Sales Pack comes with two additional fields in the Account entity type: Electronic Address Scheme and Electronic Address Identifier. Add these fields to the *Detail* layout at Administration > Entity Manager > Account > Layouts > Detail. Then, you will be able to set these fields in Accounts.

### Country codes

The EN 16931 standard requires countries to be represented as ISO 3166-1 alpha-2 codes. But in Espo, the *Address* field allows a country to be an arbitrary string. As of EspoCRM v8.3 it's possible to [map](../administration/addresses.md) country names to ISO 3166-1 alpha-2 codes. This mapping is used when E-Invoices are generated.

Note that it's possible to automatically populate country records with English names.

Example: If you run business from Germany, your customer is also in Germany and you use the word *Germany* when storing the country in Espo, you need to create a *Germany* Address Country record with a *DE* code.

## Locking

An Invoice can locked if it's completed or canceled. When a record is locked, a specific fields become read-only. An administrator can configure which exactly fields at: Administration > Entity Manager > Invoice > Edit.

If the settings parameter *Forbid order unlocking* is checked, once a record is locked, it can be unlocked only by an administrator.

## See also

* [Custom calculations for Quote totals](../development/quote-custom-calculations.md)
