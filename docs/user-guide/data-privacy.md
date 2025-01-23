# Data Privacy

EspoCRM provides the ability to view and erase personal data for specific records.

In the Entity Manager, an administrator can mark certain fields as those that contain personal data. This option is available for Accounts, Contacts, Leads, and custom entity types of the Person types.

By default, the following fields are marked as those that can contain personal data.

Contacts & Leads:

* Name
* Email
* Phone
* Address

Accounts:

* Email

To view or erase personal data for a specific record, go to the detail view, then click *View Personal Data* from the dropdown next to the *Edit* button. From there, it's possible to erase certain fields (if the User has edit access).

Regular uses have the ability to view or erase personal data only if they have *Data Privacy* permission (defined in Roles).
