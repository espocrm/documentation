# Inventory Management

*As of Sales Pack v2.0.*

The Inventory Management feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/).

The Inventory Management feature allows to track product quantities, locations in warehouses, transfers between warehouses, and a history of purchase and sales. It allows to validate product availability before selling it to a customer.

The Inventory Management feature is disabled by default. To enable it, you need to enable **Inventory Transactions** at Administration > Sales Pack (Settings).

In this article:

* [Inventory Transactions](#inventory-transactions)
* [Quantity](#quantity)
* [Inventory Numbers](#inventory-numbers)
* [Warehouses](#warehouses)
* [Inventory Adjustments](#inventory-adjustments)
* [Transfer Orders](#transfer-orders)
* [Transaction compressing](#transaction-compressing)
* [Formula functions](#formula-functions)

## Inventory Transactions

The transactional model is used for the inventory management. Each transaction record represents an action performed on a specific inventory item. It includes the following fields:

* Number – auto-increment number;
* Product;
* Quantity – a positive or negative value: positive for a movement in, negative for movement out;
* Parent – a record that is generated the transaction; e.g. Receipt Order, Delivery Order;
* Type – transfer, reserve, or soft-reserve;
* Warehouse – what warehouse the transaction is related to;
* Inventory Number – used for products tracked by number.

Access to Inventory Transactions is controlled by Roles. The administrator can allow specific users to read and/or create transactions.

Note that usually users are not supposed to create transactions manually. Transactions are created automatically when the status of an order record is changed.

The following entity types automatically create inventory transaction records:

* Delivery Order – items are removed from stock or reserved;
* Receipt Order – items are added to stock;
* Transfer Order – items are moved between warehouses or reserved before the move;
* Inventory Adjustment – items added or removed;
* Sales Order – items are soft-reserved before delivery is created.

## Quantity

The following quantity values are available for a Product:

* Available – all items excluding reserved and soft-reserved;
* On Hand – all excluding reserved;
* Soft-Reserved – selected for a Sales Order, or selected for a draft Delivery or Transfer;
* Reserved – selected for a Delivery or Transfer;
* In Transit – currently moved between warehouses;
* On Order – ordered from a supplier and not yet received.

!!! note

    In some cases, the total available quantity displayed for a product may be less than the sum of available quantities across individual warehouses. This occurs because Sales Orders soft-reserve inventory. Since the Sales Order entity is not linked to a specific warehouse, the reservation is applied globally and does not directly reduce the quantities shown for each warehouse.

    You can disable soft-reservation for Sales Orders by removing the *Ready* status from the Soft-Reserve status list. The parameter is available under: Administration > Entity Manager > Sales Order > Edit.

## Inventory Numbers

It's possible to track specific products by Inventory Numbers. There are two type of numbers: Batch and Serial. The type of the Inventory Number is defined by the field *Inventory Number Type* in a Product.

Access to Inventory Numbers is controlled by Roles.

From the Inventory Number detail view it's possible to view the **History**: receipts, deliveries, transfers between warehouses, and adjustments.

It's possible to view quantity for a specific Inventory Number.

### Batch

Multiple inventory items can be assigned to one Batch number.

When inventory is received, Batch numbers should be assigned to products that are tracked by batch. It's possible to split a Receipt Order Item into multiple batches.

When inventory is delivered to a customer, Batch numbers should be selected for products that are tracked by batch.

### Serial

Only one inventory item can be assigned to one Serial number.

When inventory is received, Serial numbers should be assigned to every item for products that are tracked by serial. It's possible to **Import Serial Numbers** from a CSV file within a Receipt Order.

When inventory is delivered to a customer, Serial numbers should be selected for products that are tracked by serial.

!!! important

    You can create Batch or Serial numbers for a product only if that product is marked as tracked by Batch or Serial correspondingly.

### Removal Strategy

The Removal Strategy is defined in a Product record. It determines how Inventory Numbers will be sorted when a user picks a number for a delivery or transfer order.

Available options:

* FIFO – first in, first out; sorted by *Incoming Date* in ascending order;
* FEFO – first expired, first out; sorted by *Expiration Date* in ascending order;
* LIFO – last in, first out; sorted by *Incoming Date* in descending order.

## Warehouses

The Warehouses feature is disabled by default. It can be enabled at Administration > Sales Pack (Settings).

Access to Warehouses is controlled by Roles.

The Receipt Order and Delivery Order have the mandatory *Warehouse* field. When products are delivered to a customer, they can be shipped from multiple warehouses. In this case, you need to create multiple Delivery Orders.

Inventory can be moved between Warehouses with Transfer Orders.

Inventory from a specific Warehouse can be exluded from stock availability by disabling the *Available for Stock* field in the Warehouse record.


## Transfer Orders

Transfer Orders can be utilized only if the Warehouses feature is enabled. Access to Transfer Orders is controlled by Roles.

Transfer Orders allow moving inventory between Warehouses. When a Transfer Order record has the *In Progress* status, its items are counted as In Transit. They do not belong to any warehouse while in this state.

## Inventory Adjustments

Inventory Adjustments are used to correct inventory quantity manually. Within a single adjustment, it's possible to specify a new quantity for multiple products. You can also utilize Inventory Adjustments to enter initial stock quantities.

If the Warehouses feature is enabled, a specific warehouse must be selected for an adjustment.

When an adjustment is *Started*, all the affected inventory will be locked in the entire system until the adjustment is *Complete*. It's not possible to reserve or transfer inventory that is being locked by a started adjustment.

Access to Inventory Adjustments is controlled by Roles.

## Transaction compressing

As the Inventory Transaction table grows, the system may became slower to calculate product quantities. For this reason, there is the functionality that compresses the inventory transaction table.

Balanced transaction pairs can be removed. E.g. when the same item quantity is reserved and then unreserved, it will generate two transactions with opposite quantity values.

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


## Formula functions

*As of Sales Pack v3.0.*

### ext\product\quantity

`ext\product\quantity(PRODUCT_ID, [WAREHOUSE_ID])`

### ext\product\quantityOnHand

`ext\product\quantityOnHand(PRODUCT_ID, [WAREHOUSE_ID])`

### ext\product\quantityReserved

`ext\product\quantityReserved(PRODUCT_ID, [WAREHOUSE_ID])`

### ext\product\quantityInTransit

`ext\product\quantityInTransit(PRODUCT_ID)`

### ext\inventoryNumber\quantityOnHand

`ext\inventoryNumber\quantityOnHand(INVENTORY_NUMBER_ID, [WAREHOUSE_ID])`

### ext\inventoryNumber\quantityReserved

`ext\inventoryNumber\quantityReserved(INVENTORY_NUMBER_ID, [WAREHOUSE_ID])`

### ext\inventoryNumber\quantityInTransit

`ext\inventoryNumber\quantityInTransit(INVENTORY_NUMBER_ID)`
