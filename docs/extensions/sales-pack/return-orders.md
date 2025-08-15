# Return Orders

*As of Sales Pack v2.0.*

Return Orders are used to document product returned from customers. A Return Order can be created from a completed Sales Order. Multiple [Receipt Orders](receipt-orders.md) can be created from a single Return Order.

If the Warehouses feature is enabled, a Receipt Order record can be associated with a Warehouse the return is supposed to be shipped to.

Access to Return Orders is controlled by Roles.

## Printing to PDF

Return Orders can be printed to PDF. This action is available in the dropdown next to Edit button on the Delivery Order detail view. Then, you will be prompted to select a template.

## Sending in email

A Return Order PDF can be sent in an email as an attachment. Open a Return Order record, click the dropdown next to Edit button and then click Email PDF.

The default email template can be set by the administrator: Administration > Sales Pack Settings > Email Templates.

To have the Return Order entity selected as the email's parent, the administrator should add the Return Order entity type to the parent type list. Administration > Entity Manager > Email > Fields > Parent > Entity List. As of v3.0.
