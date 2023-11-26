# Products

The Products feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/).

Products can be added as line items in Opportunities, Quotes, Sales Orders and Invoices.

The Product entity type is available for customization in the Entity Manager. You can add custom fields to the Product as well as custom relationships between the Product and other entity types.

A product record has three price fields: *Cost*, *List* and *Unit*. There is the ability to automatically calculate the *Unit Price* using different formulas according to a selected *Pricing Type*.

The product can be marked as *Tax-free*. It will prevent applying the tax rate upon adding the product to a quote, sales order or invoice.

![Products list view](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/products/products.png)

Product fields can be printed in PDF. More detail [here](quotes.md#templates).

## Opportunity line items

Products can be added as line items in an Opportunity record. By default, this feature is disabled. Administrator needs to add the *Item List* field to the *Detail* layout of the Opportunity in the Layout Manager. Make the cell full-width wide using minus icon.

## Categories

Each product record can belong to some product category. Product Categories are presented as a hierarchical tree structure. Each category can have sub-categories.

The Product Category is a separate entity type, hence the access is controlled by Roles.
