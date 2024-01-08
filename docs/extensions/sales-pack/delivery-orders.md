# Delivery Orders

*As of Sales Pack v2.0.*

Delivery Orders are used to document products being shipped to customers.

If the Warehouses feature is enabled, every Delivery Order record should be associated with a Warehouse.

Multiple Delivery Orders can be created from a single [Sales Order](../../user-guide/sales-orders.md). It may be reasonable when the delivery is split into parts or shippied from different warehouses. The Sales Order should have status *Ready* or *Complete* to be able to create a Delivery Order from it.

The following Delivery Order statuses are available:

* Draft – inventory is soft-reserved;
* Ready – inventory is reserved;
* In Progress – inventory is removed from stock;
* Completed – inventory is removed from stock;
* Canceled – inventory is unreserved or added back to stock (depending on the previous status);
* Failed – inventory is removed from stock.

It's possible to lock a Delivery Order. Locking disables the ability to change the status and items.

Access to Delivery Orders is controlled by Roles.

It's possible to print a Delivery Order to PDF and send the PDF in an email.
