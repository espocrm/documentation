# Products

Products feature is available in [Sales Pack](https://www.espocrm.com/extensions/sales-pack/).

Product items can be used with Opportunity and Quotes. They are also available for a customization in Entity Manager so you can create new relationships between products and other entities.

A product record has three price fields: Cost, List and Unit. There is the ability to automatically calculate Unit Price using different formulas according to a selected Pricing Type.

![Products list view](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/products/products.png)

Products can be added as line items to a Quote record. Product fields can be printed in PDF. More detail [here](quotes.md#templates).

Products can be added as line items to an Opportunity record. By default this feature is disabled. You need to add *Line Items* field to *Detail* layout of Opportunity in Layout Manager. Make the cell full-width wide using minus icon.

## Categories

Each product record can belong to some product category. Product Categories are presented as a hierarchical tree structure. Each category can have sub-categories.

Product Category is a separate entity type, hence an access can be controlled by ACL.
