# Tax Codes

*As of Sales Pack v4.0.*

The Tax Codes functionality is the foundation of the tax engine. A tax code is a unique identifier (like *VAT20* or *EXMPT*) that serves two important roles:

- defines tax calculation logic;
- provides reporting capabilities.

Every document line item must have an associated tax code, even when tax is not applicable (for this, zero-rate tax codes are used).

Tax codes can be enabled or disabled at Administration > Sales Pack Settings > Tax Codes. Having tax codes enabled is recommended.

Access to tax codes is controlled by Roles. Regular users can be granted with edit access. Users that do not have explicit access to the Tax Code scope in their roles, still are able to select tax codes when they create a document.

To manage tax codes go to: Administration > Tax Codes. Here, you can create tax codes.

For a saved document, to view how taxes were applied, click *View Tax Details* from the menu next to the *Edit* button. In case of cash basis taxes, you can view applied taxes from a Payment entry.

### Tax code parameters

#### Status

Indicates whether the tax code is available in the system. Instead of removing tax codes that has been used in transactions, set them Inactive.

#### Selectable

Indicates that the tax code can be selected for line items. Disable this parameter for tax codes that are not meant to be used separately from a composite tax code.

#### Fore Sales

Whether the tax code can be used for sales transactions, such as Quote, Sales Order, and Invoice.

#### For Purchases

Whether the tax code can be used for purchase transactions, such as Purchase Orders and Bills.

#### Type

Available options:

- Percentage. Tax rate is defined by a percentage value.
- Fixed. A fixed amount tax. For example, $10 tax per each item regardless of the unit price.
- Composite. Tax code defines multiple nested tax codes. Use this type when multiple taxes must be applied for a product.

#### Rate

A tax rate in percents. Available only for Percentage type.

#### Base

Specifies which value is used as the tax base.

- Net Amount. The amount excluding taxes.
- Cumulative Total. The net amount plus all previously applied taxes. Has an effect only when the tax code is used in a composite tax.

#### Apply to Proportional Shipping

If enabled, this tax code will be included in proportional shipping tax calculations. You may need to disable this parameter for certain tax codes used in a composite tax.

If the proportional method is not used, this parameter has no effect. The parameter is available only for Percentage type.

#### Included in Price

Whether the tax amount is included in the unit price.

You may need to enable this parameter for taxes like excise. For taxes like VAT or GST, this parameter usually should be disabled.

#### Rounding Level

Defines how tax amounts are rounded.

- Line. Amounts are rounded on each line.
- Total. Precise line-level amounts are summed and then rounded.

The parameter is available only Percentage type.

#### Items

Available for Composite type.

Tax codes that will be applied when this tax code is used for a line item. An order of taxes matters.

#### Label

An optional label to be shown to customers. This label may be used in a PDF invoice. You may leave the label empty for taxes which are not supposed to be shown to customers.

#### Country

Can be used for reporting.
