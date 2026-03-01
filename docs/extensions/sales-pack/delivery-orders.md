# Delivery Orders

*As of Sales Pack v2.0.*

Delivery Orders document the shipment of products to customers.

If the Warehouses feature is enabled, every Delivery Order record must be associated with a Warehouse.

Multiple Delivery Orders can be created from a single [Sales Order](../../user-guide/sales-orders.md). It may be reasonable when a delivery is split into parts or shipped from different warehouses.

When a delivery order is issued, the stock quantities of the included products are reduced.

The Delivery Order statuses:

* Draft – inventory is soft-reserved;
* Ready – inventory is reserved;
* In Progress – inventory is removed from stock;
* Completed – inventory is removed from stock;
* Canceled – inventory is unreserved or added back to stock (depending on the previous status);
* Failed – inventory is removed from stock.

Access to Delivery Orders is controlled by Roles.

It's possible to print a Delivery Order to PDF and send the PDF in an email.

## Locking

A Delivery Order can be locked if it's completed or canceled. When a record is locked, a specific fields become read-only. An administrator can configure the field list at: Administration > Entity Manager > Delivery Order > Edit.

If the settings parameter *Forbid order unlocking* is checked, once a record is locked, it can be unlocked only by an administrator.

## Sending delivery order in email

A Delivery Order PDF can be sent in an email as an attachment. Open an Delivery Order record, click the dropdown next to Edit button and then click Email PDF.

The default email template can be set by the administrator: Administration > Sales Pack Settings > Email Templates.

To have the Delivery Order entity selected as the email's parent, the administrator should add the Delivery Order entity type to the parent type list. Administration > Entity Manager > Email > Fields > Parent > Entity List. As of v3.0.
