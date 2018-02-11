# Guidelines on Using Emails

EspoCRM provides the ability to fetch emails from IMAP box. This makes possible to use EspoCRM as an email client along with CRM-specific features.

## IMAP accounts

*Note: You need to have [cron](https://github.com/espocrm/documentation/blob/master/administration/server-configuration.md#setup-a-crontab) properly configured in your system to have inbound emails working.*

User can setup IMAP account on Personal Email Accounts page (Emails tab > top-right menu > Personal Email Accounts).

Specify what folders to monitor in Monitored Folders field. By default it's set to INBOX. If you use some external email client to send emails you can add Sent folder to archive those emails.

*Fetch Since* allows you to choose the date emails should be archived from. Set it to some date prior today if you need to archive old emails.

There is an ability to specify *Folder* in Persnoal Email Account. Incoming emails will be put in that folder.

## SMTP accounts

Users can setup SMTP settings in Preferences as well as in thier Personal Email Accounts. Administrator also can allow to use system SMTP (make it Shared).

Users can have multiple SMTP accounts (since version 4.2.0). But email addresses user can use to send emails from are defined by email addresses of *User* record.

## Working with Emails

Emails are fetched by cron (in background) every few minutes (period can specified by Administrator).
You can see all your emails at Emails tab. There are standard folders Inbox, Sent, Draft emails at the left side.

*Status* field. `Sent` means it was sent from CRM, `Archived` – fetched from IMAP account or archived manually, `Draft` – means that email was created as a draft.

When the new email comes the system tries to recognize which record this email belongs to. It can link it with Account, Lead, Opportunity, Case (and Contact in B2C mode) etc. If it wasn't recognized then user can link it manually by filling in *Parent* field.

If an email came from a new potential client user can **convert it to Lead**. Open Email entry and click Create Lead in top-right menu.

It's also possible to **create Task or Case** from an email record.

If email addresses (from, to, cc) in an email record are known to the system it will show the person they are related to (Contact, Lead, User etc). If some email address is new you can **create contact** right from there.

All emails related to specific record are shown in History panel of that record. If some email is related, for example, to opportunity but opportunity is related to the account, it will be shown both in opportunity and account.

## Sending Emails

You can compose new email by a few ways:
* *Compose Email* button on Emails list view;
* replying on another email;
* clicking on an email address of some record;
* *Compose Email* action of Activities panel.

There is an ability to **select template** of your email.

You can setup **email signature** in Preferences.

## Email Folders

Users can create their own email folders to put some of emails in for convenience. List of available folders is available at Emails page at the left side. To create or edit folders follow Emails > dropdown in top-right corner > Folders. `Skip Notification` means that you wan't be notified about incoming emails that fall into the certain folder. By utilizing Email Filters it's possible to put emails in folders automatically by specific criteria.

## Email Filters

Administrator can create global email filters to skip not desirable emails. They are available at Administration > Email Filters.

Regular user can create email filters for their Personal Email Accounts or for their entire inbox. They are available at Emails > dropdown in top-right corner > Filters.

There are two types of filters:
* Skip - email will be put in *Trash* or not imported if filter is related to Personal Email Account;
* Put in Folder - imported emails will be put into specified user's folder automatically.

## Email Templates

Email templates are available at Emails > dropdown in top-right corner > Email Templates. They can be used both for mass email sendings and for regular emails. `One-off` checkbox means that email template supposed to be used only once, what is usual for email marketing.

It's possible to use placeholders in email template's body and subject e.g. {Account.name}, {Person.emailAddress}. They will be replaced with values of related records.

You can use additional reserved placeholders in template body: {optOutUrl} and {optOutLink}.
```
<a href="{optOutUrl}">Unsubscribe</a>
```
This is unsubscribe link for mass email.
