# Google Integration. Contacts

**Note**: Before proceeding to this article it's recommended to [set up the integration](setting-up.md).

Features:

* The ability to push your EspoCRM contacts and leads to Google Contacts;
* The ability to choose Google Contacts groups;
* Available fields: *Name*, *Description*, *Email Addresses*, *Phone Numbers*, and *Account Name*.

## Setting-up for users

Assuming, that the administrator has already set up the integration.

Go to your user detail view (the menu on the very top-right corner > click on your user name). Then, click *External Account* button.

![External account button](../../_static/images/extensions/google-integration/external-account-button.png)

Click *Google* on the left panel, check *Enabled* checkbox and then click *Connect* button.

![Connect](../../_static/images/extensions/google-integration/connect.png)

A popup will show up asking for a user consent.

If everything went fine, a green label *Connected* should show up.

**Important**: If you connected succesfully, but *Google Contacts* checkbox didn't show up, that means that the administrator did not grant you access to *Google Contacts* scope.

Check *Google Calendar* checkbox. You can select *Google Contacts Groups*, to which EspoCRM records will be pushed.

After that, you need to click *Save*.

## Pushing to Google

Go to Contacts or Leads list view, select needed items, then click *Actions* dropdown and click *Push to Google*.

A single portion can contain up to 10 records. The rest will be pushed in idle mode (by cron).

![Push to Google](../../_static/images/extensions/google-integration/push-to-google.png)

After that, you can find your contacts in Google.
