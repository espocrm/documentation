# Guidelines on using emails

EspoCRM provides the ability to fetch emails from IMAP box. This makes possible to use EspoCRM as an email client along with CRM-specific features.

In this article:

* [IMAP accounts](#imap-accounts)
* [SMTP accounts](#smtp-accounts)
* [Gmail accounts](#gmail-accounts)
* [Working with emails](#working-with-emails)
* [Sending emails](#sending-emails)
* [Email folders](#email-folders)
* [Email filters](#email-filters)
* [Email templates](#email-templates)

## IMAP accounts

Note: You need to have [cron](../administration/server-configuration.md#setting-up-crontab) properly configured in your system to have inbound emails working.

User can setup IMAP account on Personal Email Accounts page (Emails tab > top-right menu > Personal Email Accounts).

Specify what folders to monitor in *Monitored Folders* field. By default it's set to INBOX. 

If you use an **external email client** for sending emails, you can add *Sent* folder to monitored ones. Emails sent from the external client will be imported to Espo. Note, that your external client needs to be configured to store sent emails on IMAP server.

*Fetch Since* allows you to choose the date emails should be archived from. Set it to some date prior today if you need to archive old emails.

There is an ability to specify *Folder* in Personal Email Account. Incoming emails will be put in that folder.

Note: For regular users access to personal email accounts must be allowed in Roles.

## SMTP accounts

Users can setup SMTP settings in their Personal Email Accounts. Personal email accounts available at Emails tab > top-right menu > Personal Email Accounts. 
Note: For regular users access to personal email accounts must be allowed in Roles.

Administrator also can allow to use the main system SMTP account as well as Group Email Accounts (mark as Shared).

Users can have multiple SMTP accounts.

Important: Email addresses, user can use to send emails from, must be defined in *Emails* field of *User* record. Only admin can define user's email addresses (by default).

## Gmail accounts

For connecting your Gmail account (IMAP and SMTP) you have two options:

1. Enable access for less secure application at your Google account settings.
2. Use [Google Integration](https://www.espocrm.com/extensions/google-integration/) that provides a secure authentication via Oauth2.

## Working with emails

Emails are fetched by cron (in the background) every few minutes (period can specified by Administrator).
You can see all your emails at Emails tab. There are standard folders Inbox, Sent, Draft emails at the left side.

*Status* field:

* *Sent* - was sent via CRM
* *Archived* – fetched from IMAP account or archived manually
* *Draft* – email was created as a draft

When the new email comes the system tries to recognize which record this email belongs to. It can link it with Account, Lead, Opportunity, Case (and Contact in B2C mode) etc. If it wasn't recognized, then user can link it manually by filling in *Parent* field.

If an email came from a new potential client, user can **convert** it **to Lead** (from the top-right menu).

It's possible to **create a Task or Case** from an email record (from the top-right menu).

If email addresses (from, to, cc) of the email record are known to the system, it will show the person they are related to (Contact, Lead, User etc). If some email address is new, you can **create contact** right from there.

All emails related to specific record are shown in History panel of that record. If some email is related, for example, to opportunity but opportunity is related to the account, it will be shown both in opportunity and account.

When **removing** an email it gets removed from the system entirely, so that it will disappear from their *Inbox*. To prevent this, use *Move to Trash*. Administrator may not grant *delete* access for users to prevent losing emails.

## Sending emails

You can compose new email by a few ways:

* *Compose Email* button on Emails list view;
* replying on another email;
* clicking on an email address of some record;
* *Compose Email* action of Activities panel.

There is the ability to **select template** of your email.

You can setup **email signature** in Preferences.

It's possible to use an **external email client** (the default one on your computer or device). For this check *Use an external email client* in Preferences.

## Email Folders

Users can create their own email folders to put some of emails in for convenience. List of available folders is available at Emails page at the left side. To create or edit folders follow Emails > dropdown in top-right corner > Folders. `Skip Notification` means that you won't be notified about incoming emails that fall into the certain folder. By utilizing Email Filters it's possible to put emails in folders automatically by specific criteria.

## Email Filters

Administrator can create global email filters to skip not desirable emails. They are available at Administration > Email Filters.

Regular user can create email filters for their Personal Email Accounts or for their entire inbox. They are available at Emails > dropdown in top-right corner > Filters.

There are two types of filters:

* Skip - email will be put in *Trash* or not imported if filter is related to Personal Email Account;
* Put in Folder - imported emails will be put into specified user's folder automatically.

## Email Templates

Email templates are available at Emails > dropdown in top-right corner > Email Templates. They can be used both for mass email sending and for regular emails. `One-off` checkbox means that email template supposed to be used only once, what is usual for email marketing.

It's possible to use placeholders in email template's body and subject e.g. {Account.name}, {Person.emailAddress}. They will be replaced with values of related records.

You can use additional reserved placeholders in template body: `{optOutUrl}` and `{optOutLink}`.
```
<a href="{optOutUrl}">Unsubscribe</a>
```
This is unsubscribe link for mass email.

The list of available additional placeholders:

* `{today}` - today's date,
* `{now}` - current date & time,
* `{optOutUrl}` - opt-out url (only for mass email),
* `{optOutLink}` - opt-out link (only for mass email),
* `{optInUrl}` - opt-in url (only for lead capture confirm opt-in),
* `{optInLink}` - opt-in link (only for lead capture confirm opt-in).

### Handlebars support

Available as of v5.9.0.

Note: This is an expiremental feature.

Email templates also support Handlebars. It's the same template system used for PDF templates with double-brace placeholders, like `{{name}}`.

It only applies to emails with the non-empty parent field.
