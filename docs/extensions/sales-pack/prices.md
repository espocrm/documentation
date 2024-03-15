# Prices

Product sales prices can be determined by:

* price values in a Product record;
* Price Books.

In this article:

* [Price Books](#price-books)
* [Supplier Prices](#supplier-prices)
* [Import](#import)

## Price Books

*As of Sales Pack v2.0.*

The Price Books feature allows to have different prices for one product. A Price Book record contains prices for multiple products. Moreover, it can contain different prices for a single product: actual for a specific date period or quantity.

The Price Books feature is disabled by default. It can be enabled at Administration > Sales Pack (Settings). Access to Price Books is controlled by Roles.

The Price Books list view can be accessed at Products > the top-right menu > Price Books.

A Price Book can be associated with a specific Account. Note that the administrator needs to add the **Price Book** field to the *Detail* layout of the Account entity type to be able to associate accounts with price books.

The Quote, Sales Order and Invoice have the **Price Book** field. When a new record (order) is created, the Price Book is carried over from a related Account. It's possible to change the Price Book for in a specific order.

A Price Book can have a **Parent Price Book** and so on. If there's no price found for a specific product in a Price Book, then the system will look up the price in the Parent Price Book.

The **Default Price Book** can be specified at Administration > Sales Pack (Settings). It will be used to fetch default prices when there's no Price Book associated with an order.

When a product is added to an order and there's no price found in a related Price Book or there's no related Price Book, the Default Price Book will be used. If there's no Default Price Book, the price from the Product record will be used.

When a user changes the quantity of an order line, the system will look up the new unit price for that quantity. If there's such, it will prompt the user to apply the new unit price. The user can reject and leave the previous price.


### Rules

*As of Sales Pack v2.2.*

Price Rules can be added to a specific Price Book. One Rule can modify the base price for multiple Products. It's possible to add or subtract a percentage of the price, apply rounding, add or subtract a specific amount.


#### Target

Determines when the Rule will be applied.

* Product Category – applies to all Products of a speicific Category, including sub-categories;
* All – applies to all Products;
* Conditional – when a specific condition is met.

The admin user can add Conditions at Administration > Price Rule Conditions. Created conditions then will be available on the Price Rule form. Conditions are defined with a [Formula](../../administration/formula.md) expression. The expression should return true or false.

Special functions available for conditions:

* `ext\priceRule\accountAttribute` – returns an Account attribute value, e.g. `ext\priceRule\accountAttribute('type')`;
* `ext\priceRule\productAttribute` – returns a Product attribute value, e.g. `ext\priceRule\productAttribute('id')`.

Use case 1. A rule applied to Accounts with type Parnter.

Use case 2. A rule applied to Accounts that have already purchased the same product before.

#### Based On

What to use as a base price.

* Unit – the unit price defined in the Price Book or defined in the Product record; Price Book rules are not applied;
* Price Book – is obtained from the same Price Book; rules are applied;
* Supplier – the price of the Supplier;
* Cost – the cost specified in the Product record.

Use the *Price Book* base if your Price Book defines prices based on a markup and you also want to give an additional discount upon those calculated prices.

#### Percentage

A percentage of the standard price to deduct or add.

#### Rounding Method

* Half Up
* Up
* Down

#### Rounding Factor

The amount will be round off to the multiple of the specified value. E.g. if set to 100, prices will be 100, 400, 5200.

#### Surcharge

An amount to add after percentage and rounding are applied. Use a negative number to subtract.

To make prices to end with *9.99*, specify *-0.01* surcharge and use pricing factor *10*.

#### Min. Quantity

The rule will be applied only if the quantity of items being sold exceeds the specified value.

## Supplier Prices

*As of Sales Pack v2.0.*

A *Supplier* record can have prices for specific products. These prices are used when adding products to a Purchase Order associated with that Supplier.

A Supplier record can contain different prices for a single product: actual for a specific date period or quantity.

If there's no supplier price found for a product, the *Cost Price* of the product will be used instead.

## Import

It's possible to import Product Prices from a CSV file using the basic [Import tool](../../administration/import.md). To import into a specific Price Book, select that Price Book as a default field value at the second step of the Import.

Each CSV row must be associated with a corresponding Product record. It can be:

* The *Name* of the Product;
* The *Part Number* of the Product (as of v8.2).

In the similar fashion, it's possible to import Supplier Prices.

