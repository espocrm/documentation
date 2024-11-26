# Purchase Orders

*As of Sales Pack v2.0.*

The Purchase Orders feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/).

Purchase Orders are issued to suppliers. They indicate what products the company needs to buy from the supplier, their quantities and arranged prices.

Access to Purchase Orders is controlled by Roles.

The Purchase Order has the *Supplier* field. Upon selecting a supplier, the Purchase Order address fields will be automatically populated. The selected supplier also determines prices that will be applied for products in the order.

Purchase Orders can be printed to PDF and sent in an email.

Multiple [Receipt Orders](receipt-orders.md) can be created from one Purchase Order. If you have created a Receipt Order which only partially covers items of a Purchase Order, the next created Receipt Order will contain only those items that are absent in the previous Receipt Order (or multiple Receipt Orders). Though you can add any extra items to the Receipt Order if you need.

In the article:

* [Printing to PDF](#printing-to-pdf)
* [Default tax](#default-tax)
* [Locking](#locking)

## Printing to PDF

Purchase Orders can be printed to PDF. This action is available in the dropdown next to Edit button on the record detail view. Then, you will be prompted to select a template. More info about printing to PDF is available in the [article](../../user-guide/printing-to-pdf.md).

### Templates

See the documentation [for quote templates](../../user-guide/quotes.md#templates).

## Default tax

You need to have a Tax record created in your CRM. Taxes can be accessed at: Purchase Order list view > dropdown in the top-right corner > Taxes.

Administrator can specify a default Tax record at Administration > Entity Manager > Purchase Order > fields > Tax > Default.

## Locking

A Purchase Order can locked if it's completed or canceled. When a record is locked, a specific fields become read-only. An administrator can configure which exactly fields at: Administration > Entity Manager > Purchase Order > Edit.

If the settings parameter *Forbid order unlocking* is checked, once a record is locked, it can be unlocked only by an administrator.
