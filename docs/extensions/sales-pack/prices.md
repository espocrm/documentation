# Prices

Product prices can be determined by:

* price values in a Product record;
* Price Books.

## Price Books

*As of Sales Pack v2.0.*

The Price Books feature allows to have different prices for one product. A Price Book record contains prices for multiple products. Moreover, it can contain different prices for a single product: actual for a specific date period or quantity.

The Price Books feature is disabled by default. It can be enabled at Administration > Sales Pack (Settings). Access to Price Books is controlled by Roles.

The Price Books list view can be accessed at Products > the top-right menu > Price Books.

A Price Book can be associated with a specific Account. Note that the administrator needs to add the **Price Book** field to the *Detail* layout of the Account entity type to be able to associate accounts with price books.

The Quote, Sales Order and Invoice have the **Price Book** field. When a new record (order) is created, the Price Book is carried over from a related Account. It's possible to change the Price Book for in a specific order.

A Price Book can have a **Parent Price Book** and so on. If there's no price found for a specific product in a Price Book, then the system will look up the price in the Parent Price Book.

The **Default Price Book** can be specified at Administration > Sales Pack (Settings). It will used to fetch default prices when there's no Price Book associated with an order.

When a product is added to an order and there's no price found in a related Price Book or there's no related Price Book, the Default Price Book will be used. If there's no Default Price Book, the price from the Product record will be used.

When a user changes the quantity of an order line, the system will look up the new unit price for that quantity. If there's such, it will prompt the user to apply the new unit price. The user can reject and leave the previous price.

## Supplier Prices

*As of Sales Pack v2.0.*

A *Supplier* record can have prices for specific products. These prices are used when adding products to a Purchase Order associated with that Supplier.

A Supplier record can contain different prices for a single product: actual for a specific date period or quantity.

If there's no supplier price found for a product, the *Cost Price* of the product will be used instead.
