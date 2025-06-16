# Credit Notes

*As of Sales Pack v3.0.*

Credit Notes document adjustments made to previously issued invoices, such as returns or post-sale discounts.

Credit notes can be created from an invoice. If *On Invoice* is checked, the credit note will reduce the invoice's amount due. Otherwise, the credit note is treated as eligible for a refund payment.

In the article:

* [Printing to PDF](#printing-to-pdf)
* [Sending in email](#sending-in-email)
* [Locking](#locking)
* [E-Credit notes](#e-credit-notes)

## Printing to PDF

Invoices can be printed to PDF. This action is available in the dropdown next to Edit button on the Invoice detail view. Then, you will be prompted to select a template. More info about printing to PDF is available [here](../../user-guide/printing-to-pdf.md).

### Templates

See the documentation [for quote templates](../../user-guide/quotes.md#templates).

## Sending in email

A Credit Note PDF can be sent in an email as an attachment. Open a credit note record, click the dropdown next to Edit button and then click Email PDF.

The default email template can be set by the administrator: Administration > Sales Pack Settings > Email Templates.

To have the Credit Note entity selected as the email's parent, the administrator should add the Credit Note entity type to the parent type list. Administration > Entity Manager > Email > Fields > Parent > Entity List. As of v3.0.

## Locking

An Credit Note can be locked if it's completed or canceled. When a record is locked, a specific fields become read-only. An administrator can configure the field list at: Administration > Entity Manager > Credit Note > Edit.

If the settings parameter *Forbid order unlocking* is checked, once a record is locked, it can be unlocked only by an administrator.

## E-Credit notes

Credit notes can be exported to EN 16931 electronic credit notes in a UBL format.

To export a Credit Note to a UBL file, click **E-Credit Note** from the dropdown menu next to the **Edit** button on the Credit detail view. The UBL file can be also attached along with a PDF when sending a credit note in email.