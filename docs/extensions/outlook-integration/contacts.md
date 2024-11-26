# Outlook Integration. Contacts

!!! note

    Before proceeding to this article it's recommended to [set up the integration](setting-up.md).

Outlook Contacts Integration  is available in the [extension](https://www.espocrm.com/extensions/outlook-integration/). Compatible with EspoCRM 5.6.3 and higher.

Provides the ability to push EspoCRM contacts and leads to Outlook Contacts (People) into a specific folder. Fields being pushed: First Name, Last Name, Email Address, Phone Number, and Account Name.

* [Setting up for users](#setting-up-for-users)
* [Pushing to Outlook](#pushing-to-outlook)

## Setting up for users

Assuming that the administrator has already set up the integration.

Go to your user detail view (the menu on the very top-right corner > click on your user name). Then, click *External Account* button.

![External account button](../../_static/images/extensions/outlook-integration/external-account-button.png)

Click *Outlook* on the left panel, check *Enabled* checkbox and then click *Connect* button.

![Connect](../../_static/images/extensions/outlook-integration/connect.png)

A popup will show up asking for a user consent.

If everything went fine, a green label *Connected* should show up.

!!! important

    If you connected successfully, but *Outlook Contacts* checkbox didn't show up, that means that the administrator did not grant you access to *Outlook Contacts* scope.

Check *Outlook Contacts* checkbox and configure parameters and then click *Save*.

## Pushing to Outlook

1. Go to the contacts or leads list view.
2. Select needed items. You can also select all search results.
3. From *Actions* dropdown menu click *Push to Outlook*.

It's also possible to push from the detail view. The action is available in the dropdown next to *Edit* button.
