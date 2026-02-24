# Taxes

*As of Sales Pack v3.0.*

With the Tax feature you can manage taxes, such as VAT, GST, sales tax, excise, and other taxes.

In this article:

* [Tax profiles](#tax-profiles)
* [Tax classes](#tax-classes)
* [Tax rules](#tax-rules)

See also:

* [Tax codes](tax-codes.md)

## Tax profiles

!!! note

    Tax Profile was named *Tax* in earlier versions.

A tax profile defines how taxes are applied to a document.

You can access tax profiles at: Products > top-right menu > Tax Profiles. Or use the global search for quick access.

Access to tax profiles is controlled by Roles.

A tax profile can be applied to:

* Quotes
* Sales orders
* Invoices
* Credit notes
* Return orders
* Purchase orders
* Bills
* Bill credits

Line items added to a document automatically receive the tax rate according to the Tax Profile assigned to the document. It's also possible to re-calculate tax rates for already added items.

Tax profiles can be automatically assigned to new documents using [Tax Rules](#tax-rules).

A tax profile defines:

* Tax code
* Shipping tax mode
* Shipping tax code
* Item rules

If tax codes are not enabled, a tax profile specifies a rate value instead of the tax code.

### Tax code

The Tax Code field defines the standard (default) tax. When a tax profile is selected for a document, all line items will use its default tax code unless a specific item rule applies to the item's product.

### Shipping tax mode

The *Shipping Tax Mode* defines how tax is applied to the shipping cost. Available modes:

* Proportional – Applies tax to shipping proportionally based on the taxes of the items in the document. This is the most common mode.
* Fixed – A specific tax is applied.

If the shipping tax mode is not specified, no tax will be applied to the shipping cost.

When items on an invoice have different tax rates, the E-invoice will include separate shipping charge entries with their respective VAT rates.

### Shipping tax code

Determines the tax code to apply to the shipping cost. Available only if the shipping tax mode is set to Fixed.

### Item rules

A tax profile can include item rules. Each item rule defines an override tax rate for a specific Tax Class. Item rules are ordered. The first rule that matches is applied, and the subsequent rules are skipped.

!!! example

    A product has a tax class named 'Zero-rated'. A tax item rule maps this tax class to a tax code with a zero rate. Then, every time the product is added to a document line, that tax code will be automatically set.

## Tax classes

Only an administrator can manage tax classes. Regular users can read tax classes if they have access enabled in Roles. Regular users are able to associate products with tax classes provided they have access to the Tax Class scope.

An administrator can access tax classes via: Administration > Tax Classes.

A single product can belong to one or more tax classes. While one class per product is usually sufficient, multiple classes may be necessary when the product's tax treatment differs across jurisdictions.

## Tax rules

!!! note

    Not to be confused with item rules of the tax profile.

Tax rules enable automatic association of a created document with the appropriate Tax Profile.

For sales and purchases separate rule sets are used.

Only an administrator can manage tax rules. An administrator can access tax rules at: Administration > Tax Rules. Purchase rules can be accessed at: Administration > Purchase Tax Rules.

One tax rule defines a Tax Profile and conditions. These conditions are evaluated against the Account record the order is related to.

When an order is created for a specific Account, the Tax Profile is automatically selected according to the evaluated tax rules.

Tax rules are ordered. The first rule that matches is applied, and the subsequent rules are skipped.

A rule with empty conditions is always applied. Such a rule can be placed at the end of the list to act as a default.

Rules can be set as inactive. This is useful, for example, when VAT is charged only after sales exceed a designated threshold. The rule can then be enabled accordingly.

In most cases, rule conditions would check:

* Country – To select the appropriate tax profile for a specific country.
* Tax Number – If the VAT number is provided, then select the zero-rate tax profile. Reverse charge scenario.

!!! note

    The *Tax Number* field is available in the Account entity type. By default, it's not added to the layout.

### Example

Let's assume our company is based in Germany and sells domestically, within the EU, and worldwide simultaneously.

| Condition                                                                        | Tax rule to apply           |
|----------------------------------------------------------------------------------|-----------------------------|
| **Domestic** (same country)                                                      | Use seller's local VAT rate |
| **Intra-EU B2B** (customer is VAT registered)                                    | Reverse charge (0% VAT)     |
| **Intra-EU B2C** (not VAT registered) and total cross-border B2C sales < €10,000 | Use seller's local VAT      |
| **Intra-EU B2C** and threshold exceeded                                          | Use customer's country VAT  |
| **Outside EU** (export)                                                          | Exempt (0% VAT)             |

We would need to create the following tax profiles:

* Zero – to cover Intra-EU B2B and Outside EU;
* Reverse charge – to cover all Intra-EU B2B;
* Germany – to cover Domestic and Intra-EU B2C before threshold exceeded;
* Separate records for each EU country we are going to sell to (B2C).

For each tax profile, we will create and select a unique tax code. 

We would need to create the following tax rules.

1\. Domestic.

This rule will map Accounts from Germany to the *Germany* tax profile. In the rule's conditions, add a condition that checks whether the *Country* is set to Germany.

2\. Intra-EU B2B.

This rule will map Accounts from EU countries with the VAT number to the *Reverse charge* tax profile. In the rule's conditions, add an OR condition with child conditions for each EU country. Also add a condition checking whether the Tax Number is not empty.

!!! note

    You can use a custom field to designate an Account as EU based and set the value with formula. It will make defining the rule conditions simpler.

!!! note

    It may be reasonable to create separate reverse charge tax profile for each country for reporting reasons.

3\. Intra-EU B2C below threshold.

This rule will map Accounts from EU countries without the VAT number to the *Germany* tax profile.

This rule is supposed to be deactivated once total cross-border B2C sales exceeds €10,000.

4\. Separate Intra-EU B2C rules for each EU country.

Each rule will map to a corresponding tax profile of the EU country.

It's important that these rules are placed after the previous rule (the order or rules matters).

5\. Outside EU.

This rule will be the last one. It will map to the *Zero* tax profile. It may not define any condition, acting as a default rule.

It's important that this rule is placed at the end.
