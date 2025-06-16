# Purchase Orders

*As of Sales Pack v2.0.*

The Purchase Orders feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/).

Purchase Orders are issued to suppliers. They indicate what products the company needs to buy from the supplier, their quantities and arranged prices.

Access to Purchase Orders is controlled by Roles.

The Purchase Order has the *Supplier* field. Upon selecting a supplier, the Purchase Order address fields will be automatically populated. The selected supplier also determines prices that will be applied for products in the order.

Purchase Orders can be printed to PDF and sent in an email.

Multiple [Receipt Orders](receipt-orders.md) can be created from one Purchase Order. If there's one created Receipt Order that only partially covers the items of a Purchase Order, the next created Receipt Order will contain only those items that are absent in the previous Receipt Order (or multiple Receipt Orders). Though you can add any extra items to the Receipt Order if you need.

In the article:

* [Printing to PDF](#printing-to-pdf)
* [Sending in email](#sending-in-email)
* [Locking](#locking)

## Printing to PDF

Purchase Orders can be printed to PDF. This action is available in the dropdown next to Edit button on the record detail view. Then, you will be prompted to select a template. More info about printing to PDF is available in the [article](../../user-guide/printing-to-pdf.md).

### Templates

See the documentation [for quote templates](../../user-guide/quotes.md#templates).

## Sending in email

A Purchase Order PDF can be sent in an email as an attachment. Open a Purchase Order record, click the dropdown next to Edit button, and then click Email PDF.

The default email template can be set by the administrator: Administration > Sales Pack Settings > Email Templates.

To have the Purchase Order entity selected as the email's parent, the administrator should add the Purchase Order entity type to the parent type list. Administration > Entity Manager > Email > Fields > Parent > Entity List. As of v3.0.

## Locking

A Purchase Order can be locked if it's completed or canceled. When a record is locked, a specific fields become read-only. An administrator can configure the field list at: Administration > Entity Manager > Purchase Order > Edit.

If the settings parameter *Forbid order unlocking* is checked, once a record is locked, it can be unlocked only by the administrator.
