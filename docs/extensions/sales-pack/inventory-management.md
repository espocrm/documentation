# Inventory Management

*As of Sales Pack v2.0.*

The Inventory Management feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/).

The Inventory Management feature allows to track product quantities, location in warehouses, transfers between warehouses, a purchase and sales history. It allows to validate product availability before selling it to a customer.

The Inventory Management feature is disabled by default. To enable it, you need to enable **Inventory Transactions** at Administration > Sales Pack (Settings).

In this article:

* [Inventory Transactions](#inventory-transactions)
* [Quantity](#quantity)
* [Inventory Numbers](#inventory-numbers)
* [Warehouses](#warehouses)
* [Inventory Adjustments](#inventory-adjustments)
* [Transfer Orders](#transfer-orders)
* [Transaction compressing](#transaction-compressing)

## Inventory Transactions

The transactional model is used for the inventory management. A single transaction record determines some action with a specific inventory item and items. It contains the following fields:

* Number – auto-increment number;
* Product;
* Quantity – a positive or negative value; positive indicates a movement in, negative – out;
* Parent – a record that generated the transaction; e.g. Receipt Order, Develivery Order;
* Type – transfer, reserve, or soft-reserve;
* Warehouse – what warehouse the transaction is related to;
* Inventory Number – needed when the product is tracked by a number.

Access to Inventory Transactions is controlled by Roles. The administrator can allow specific users to read and/or create transactions.

Note that usually users are not supposed to create transactions manually. Transactions are created automatically when a status of an order record is changed.

## Quantity

The following quantity values are available for a Product:

* Available – all items excluding soft-reserved;
* On Hand – all excluding reserved;
* Soft-Reserved – selected for a Sales Order, or selected for a draft Delivery or Transfer;
* Reserved – selected for a Delivery or Transfer;
* In Transit – currently moved between warehouses;
* On Order – ordered from a supplier and not yet received.

## Inventory Numbers

It's possible to track specific products by Inventory Numbers. There are two type of numbers: Batch and Serial. The type of the Inventory Number is defined by the field *Inventory Number Type* in a Product.

Access to Inventory Numbers is controlled by Roles.

From the Inventory Number detail view it's possible to view the **History**: receipts, deliveries, transfers between warehouses and adjustments.

It's possible to view quantity for a specific Inventory Number.

### Batch

Multiple inventory items can be assigned to one Batch number.

When inventory is received, Batch numbers should be assigned to products that are tracked by batch. It's possible to split a Receipt Order Item into multiple batches.

When inventory is delivered to a customer, Batch numbers should be selected for products that are tracked by batch.

### Serial

Only one inventory item can be assigned to one Serial number.

When inventory is received, Serial numbers should be assigned to every item for products that are tracked by serial. It's possible to **Import Serial Numbers** from a CSV file within a Receipt Order.

When inventory is delivered to a customer, Serial numbers should be selected for products that are tracked by serial.

## Warehouses

The Warehouses feature is disabled by default. It can be enabled at Administration > Sales Pack (Settings).

Access to Warehouses is controlled by Roles.

The Receipt Order and Delivery Order have the mandatory *Warehouse* field. When products are delivered to a customer, they can be shipped from multiple warehouses. In this case, you need to create multiple Delivery Orders.

It's possible to move inventory between Warehouses with Transfer Orders.

## Transfer Orders

Actual only if the Warehouses feature is enabled. Access to Transfer Orders is controlled by Roles.

Transfer Orders allow moving inventory between Warehouses.

## Inventory Adjustments

Adjustments are used to correct inventory quantity manually. Within a single adjustment, it's possible to specify new quantity for multiple products.

If the Warehouses feature is enabled, a specific warehouse must be selected for an adjustment.

When an adjustment is *Started*, all the affected inventory will be locked in the entire system until the adjustment is *Complete*. It's not possible to reserve or transfer inventory that is being locked by a started adjustment.

Access to Inventory Adjustments is controlled by Roles.

## Transaction compressing

As the Inventory Transaction table grows, the system may became slower to calculate product quantities. For this reason, there is the functionallity that compresses the inventory transaction table.

Balanced transaction pairs can be removed. E.g. when the same item quantity is reserved and then unreserved, it will generate two transactins with opposite quantity values.

If there are multiple transactions that differentiate only by quantity, they can be merged into one. The new quantity will be the sum of all.

Compressing can be configured to be run automatically. You need to create **Inventory Transaction Compress** job at Administration > Scheduled Jobs.

It's also possible to run compressing manually from the CLI:

```
bin/command inventory-compress
```

Only for transactions prior a specific date:

```
bin/command inventory-compress --before=2024-01-01
```

Receipt Orders, Delivery Orders and Transfer Orders can be marked as *Locked*. It will disallow changing their status and items. After that, it is possible to detach transactions from records that were locked. These detached transactions can be consequently compressed.

Detaching can be configured to be run automatically. You need to create **Inventory Transaction Detaching** job at Administration > Scheduled Jobs.

Or run from the CLI:

```
bin/command inventory-detach
```

It's also possible create a scheduled job that automatically locks old Receipt Orders, Delivery Orders and Transfer Orders.
