# Receipt Orders

*As of Sales Pack v2.0.*

Receipt Orders are used to document products received from suppliers or returned by customers.

If the Warehouses feature is enabled, every Receipt Order record must be associated with a Warehouse.

Multiple Receipt Orders can be created from a single [Purchase Order](purchase-orders.md), for example when deliveries are split into parts or sent to different warehouses. A Purchase Order must have status *Released* or *Complete* to be able to create a Receipt Order from it.

Receipt Orders can be created from a [Return Order](return-orders.md).

The following Receipt Order statuses are available:

* Draft;
* Ready;
* Completed – inventory is added to stock;
* Canceled.

It's possible to lock a Receipt Order. Locking disables the ability to change the status and items.

Access to Receipt Orders is controlled by Roles.

It's possible to print a Receipt Order to PDF and send the PDF in an email.

When a Receipt Order contains products that are tracked by Batch or Serial numbers, to be able to complete the order, one needs to specify numbers for those products.

It's possible to import Serial numbers from a CSV file within a Receipt Order.

## Locking

A Receipt Order can be locked if it's completed or canceled. When a record is locked, a specific fields become read-only. An administrator can configure the field list at: Administration > Entity Manager > Receipt Order > Edit.

If the settings parameter *Forbid order unlocking* is checked, once a record is locked, it can be unlocked only by an administrator.
