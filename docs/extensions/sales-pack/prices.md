# Prices

Product sales prices can be determined by:

* price books (enabled by default);
* product-level prices.

Both price sources can be enabled or disabled under Administration > Sales Pack (Settings). Both sources can be enabled
simultaneously. In this case, the product-level price is used as a fallback.

In this article:

* [Price books](#price-books)
* [Supplier prices](#supplier-prices)
* [Tax inclusive pricing](#tax-inclusive-pricing)
* [Import](#import)
* [Mass update](#mass-update)

## Price books

*As of Sales Pack v2.0.*

The Price Books feature allows to have different prices for one product. A price book record contains prices for multiple products. One price book can contain different prices for a single product, applied for a specific effective date period or a specific item quantity.

The Price Books feature can be enabled or disabled under Administration > Sales Pack (Settings). Access to Price Books is controlled by Roles.

The Price Books list view can be accessed at Products > the top-right menu > Price Books.

A price book can be associated with a specific Account. Note that the administrator needs to add the **Price Book** field to the *Detail* layout of the Account entity type to be able to associate accounts with price books.

The Quote, Sales Order and Invoice have the **Price Book** field. When a new record is created, the Price Book is carried over from the related Account. It's possible to change the Price Book for a specific document.

A Price Book can have a **Parent Price Book** and so on. If there's no price found for a specific product in a Price Book, then the system will look up the price in the Parent Price Book.

The **Default Price Book** can be specified at Administration > Sales Pack (Settings). It will be used to fetch default prices when there's no Price Book associated with an order.

When a product is added to a document as a line item and there's no price found in the related Price Book or there's no related Price Book, the Default Price Book will be used. If there's no Default Price Book, and product-level prices are enabled, the price from the Product record will be used. Otherwise, the price won't be set for the line item, and the user will need to set it manually.

When a user changes the quantity in a line item, the system will look up the new unit price for the new quantity. If the new unit price is found, it will prompt the user to apply the new unit price. The user can reject and keep the previous price.

It is possible to apply a Price Book to already added line items. The **Apply Price Book** action is available from the dropdown menu next to the plus button that adds line items.

### Min. Quantity

If set, the price applies only if the item quantity exceeds the specified value.

### Effective dates

The Date Start and Date End fields determine when the price is applicable. The Date End is inclusive. Both the Date Start and the Date End fields are optional.

### Rules

*As of Sales Pack v2.2.*

Price Rules can be added to a specific Price Book. One Rule can modify the base price for multiple Products. It's possible to add or subtract a percentage of the price, apply rounding, add or subtract a specific amount.

![Rule](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/extensions/sales-pack/price-rule.png)

#### Target

The Target field determines when the Rule should be applied. The following options are available:

* Product Category – applies to all Products of a specific Category, including sub-categories;
* All – applies to all Products;
* Conditional – when a specific condition is met.

An administrator can add custom Conditions at Administration > Price Rule Conditions. Created conditions then will be available on the Price Rule form. Conditions are defined with a [Formula](../../administration/formula.md) expression. An expression should return true or false.

Special functions available for conditions:

* `ext\priceRule\accountAttribute` – returns an Account attribute value, e.g. `ext\priceRule\accountAttribute('type')`;
* `ext\priceRule\productAttribute` – returns a Product attribute value, e.g. `ext\priceRule\productAttribute('id')`.

Formula based conditions make the pricing functionality highly flexible, allowing to implement a wide range of pricing models. See a few simple use cases below.

**Use case 1:** A rule applied to Accounts with type Partner.

```
ext\priceRule\accountAttribute('type') == 'Partner'
```

**Use case 2:** A rule applied to Accounts that have already purchased the same product before.

```
record\exists(
    'SalesOrderItem',
    'productId', ext\priceRule\productAttribute('id'),
    'accountId', ext\priceRule\accountAttribute('id'),
    'salesOrderStatus', 'Completed' 
)
```

#### Based On

What to use as a base price.

* Unit – the price for a quantity of 1 defined in the Price Book or the unit price defined in the Product record; Price Book rules are not taken into account;
* Price Book – the price is obtained from the same Price Book with rules are applied;
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

If specified, the rule applies only if the item quantity exceeds the value.

#### Effective dates

The Date Start and Date End fields determine when the rule is applicable. The Date End is inclusive. Both the Date Start and the Date End fields are optional.

## Tax inclusive pricing

*As of Sales Pack v4.0.*

Tax inclusive pricing can be enabled for a price book. When a tax inclusive price book is selected for a document, all unit prices are treated as tax inclusive.

If the default price book is set as tax inclusive, documents without a selected price book will use tax inclusive pricing. In other words, if you want to use tax inclusive pricing by default, your default price book should be set to tax inclusive.

Tax inclusive pricing is available only for sales, it's not available for purchases.

## Supplier prices

*As of Sales Pack v2.0.*

A *Supplier* record can have prices for specific products. These prices are used when adding products to a Purchase Order associated with that Supplier.

A Supplier record can contain different prices for a single product: applied for a specific date period or a specific item quantity.

If there's no supplier price found for a product, and product-level prices are enabled (in settings), then the *Cost Price* of the product will be used as a unit price.

## Import

It's possible to import Product Prices from a CSV file using the basic [Import tool](../../administration/import.md). To import into a specific Price Book, select that Price Book as a default field value at the second step of the Import.

Each CSV row must be associated with a corresponding Product record. It can be:

* The *Name* of the Product;
* The *Part Number* of the Product (as of v8.2).

In the similar fashion, it's possible to import Supplier Prices.

!!! tip

    It's possible to export Product Prices from Espo, update prices in a spreadsheet software using formula and then, import new prices back into Espo.

## Mass update

*As of Sales Pack v2.3.*

It's possible to update prices for multiple records from the list view. Select specific records or all search results, then click **Actions** and **Update Price**. It will propose to enter a markup or discount, add a surcharge amount.

Mass price update is supported for:

* Products (Cost, List and Unit price)
* Product Prices
* Supplier Product Prices

The Product Prices list view can be reached by: Products tab > top-right menu > Price Books > top-right menu > Product Prices.

The Supplier Product Prices list view can be reached by: Products tab > top-right menu > Suppliers > top-right menu > Supplier Product Prices.
