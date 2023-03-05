# Data Privacy

EspoCRM provides the ability to view and erase personal data for specific records (Contacts, Leads, Accounts).

In Entity Manager administrator can check certain fields as those that can contain personal data. This option is available for Accounts, Contacts, Leads entity types as well as custom entities of the Person types.

By default the following fields are marked as those that can contain personal data.

Contacts & Leads:

* Name
* Email
* Phone
* Address

Accounts:

* Email

On the detail view of the record in the menu (next to the edit button) there is the item *View Personal Data*. From there it's possible to erase certain fields (only if the user has 'edit' permission).

Regular uses will have an ability to view/erase personal data only if they have *Data Privacy Permission* (defined by roles).
