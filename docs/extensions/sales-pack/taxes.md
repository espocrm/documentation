# Taxes

*As of Sales Pack v3.0.*

The Tax feature is used to manage VAT and sales taxes.

In this article:

* [Tax record](#tax-record)
* [Tax classes](#tax-classes)
* [Tax rules](#tax-rules)

## Tax records

You can access the Tax list view via: Products > top-right menu > Taxes. Or use the search bar for quick access.

Access to Taxes is controlled by Roles.

A tax record can be applied to:

* Quotes
* Sales orders
* Invoices
* Credit notes
* Return orders
* Purchase orders

Line items added to an order receive their tax rate according to the selected tax record. It's also possible to re-calculate tax rates for already added items.

A tax record defines:

* Rate
* Shipping tax mode
* Item rules

### Standard rate

The *Rate* field defines the standard tax rate. When a tax record is selected for an order, all line items will use its standard rate unless a specific item rule applies to a product.

It can be reasonable to create a tax record with a zero rate for cases where tax is not applicable (for example, reverse charge scenarios).

### Shipping tax

The *Shipping Tax* defines how tax is applied to the shipping cost. Available modes:

* Proportional – Applies tax to shipping proportionally based on the tax rates of the items in the order. This is the most common mode.
* Fixed – The default rate is applied.

If the shipping tax mode is not specified, no tax will be applied to the shipping cost.

When items on an invoice have different tax rates, the E-invoice will include separate shipping charge entries with their respective VAT rates.

### Item rules

A tax record can include item rules. Each item rule defines an override tax rate for a specific Tax Class.

Products can be associated with one or more tax classes.

For zero-rate products, define a zero rate in the rule.

Item rules are ordered. The first rule that matches is applied, and the subsequent rules are skipped.

## Tax classes

Only an administrator can manage tax classes. Regular users can read tax classes if they have access enabled in Roles. Regular users are able to associate products with tax classes provided they have access to the Tax Class scope.

An administrator can access tax classes via: Administation > Tax Classes.

A single product can belong to one or more tax classes. While one class per product is usually sufficient, multiple classes may be necessary when the product's tax treatment differs across jurisdictions.

## Tax rules

!!! note

    Not to be confused with tax's item rules.

Tax rules enable automatic association of a created order with the appropriate Tax record.

Separate rule sets are used for sales and purchases.

Only an administrator can manage tax rules. An administrator can access tax rules via: Administation > Tax Rules. Purchase rules: Administation > Purchase Tax Rules.

One tax rule defines a Tax record and conditions. These conditions are evaluated against the Account record the order is related to.

When an order is created for a specific Account, the Tax record is automatically selected according to the evaluated tax rules.

Tax rules are ordered. The first rule that matches is applied, and the subsequent rules are skipped.

A rule with empty conditions is always applied. Such a rule can be placed at the end of the list to act as a default.

Rules can be set as inactive. This is useful, for example, when VAT is charged only after sales exceed a designated threshold. The rule can then be enabled accordingly.

In most cases, rule conditions would check:

* Country – To select the appropriate tax record for a specific country.
* Tax Number – If the VAT number is provided, then select the zero-rate tax record. Reverse charge scenario.

!!! note

    The *Tax Number* field is available in the Account entity type. By default, it's not added to the layout.

### Example

Let's assume our company is based in Germany and sells domestically, within the EU, and worldwide simultaneously.

| Condition             | Tax rule to apply           |
| --------------------- | --------------------------- |
| **Domestic** (same country) | Use seller's local VAT rate |
| **Intra-EU B2B** (customer is VAT registered) | Reverse charge (0% VAT) |
| **Intra-EU B2C** (not VAT registered) and total cross-border B2C sales < €10,000 | Use seller's local VAT |
| **Intra-EU B2C**, and threshold exceeded | Use customer's country VAT |
| **Outside EU** (export) | Exempt (0% VAT) |

We would need to create the following tax records:

* Zero – to cover Intra-EU B2B and Outside EU;
* Germany – to cover Domestic and Intra-EU B2C before thresold exceeded;
* Separate records for each EU country we are going to sell to.

We would need to create the following tax rules.

1\. Domestic.

This rule will map Accounts from Germany to the *Germany* tax record. In the rule's conditions, add a condition that checks whether the *Country* is set to Germany.

2\. Intra-EU B2B.

This rule will map Accounts from EU countries with the VAT number to the *Zero* tax record. In the rule's conditions, add an OR condition with child conditions for each EU country. Also add a condition checking whether the Tax Number is not empty.

!!! note

    You can use a custom field to deignate an account as EU based and set the value with formula. It will make defining the rule conditions simpler.

3\. Intra-EU B2C below threshold.

This rule will map Accounts from EU countries without the VAT number to the *Germany* tax record.

This rule is supposed to be deactivated once total cross-border B2C sales exceeds €10,000.

4\. Separate Intra-EU B2C rules for each EU country.

Each rule will map to a corresponding tax record of the EU country.

It's important that these rules are placed after the previous rule (the order or rules matters).

5\. Outside EU.

This rule will be the last one. It will map to the *Zero* tax record. It may not define any condition, acting as a default rule.

It's important that this rule is placed at the end.
