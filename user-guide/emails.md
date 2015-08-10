#Guidelines on Using Emails

EspoCRM provides the ability to fetch emails from IMAP box. This makes possible to use EspoCRM as an email client along with CRM-specific features.

##Setup IMAP account

User can setup IMAP account on Personal Email Accounts page (Emails tab > top-right menu > Personal Email Accounts).

Specify what folders to monitor in Monitored Folders field. By default it's set to INBOX. If you use some external email client to send emails you can add Sent folder to archive those emails.

*Fetch Since* allows you to choose the date emails should be archived from. Set it to some date prior today if you need to archive old emails.

##Setup SMTP

User can setup SMTP settings in Preferences. Administrator also can allow to use system SMTP (make it Shared).

##Working with Emails

Emails are fetched by cron (in background) every few minutes (period can specified by Administrator).
You can see all your emails in Emails tab. There is a filter to show Inbox, Sent, Draft emails.

Status field indicates how the email was created. Sent means it was sent from CRM, *Archived* – fetched from IMAP account, *Draft* – means that email was created as a draft.

When new email come the system tries to recognize which record this email belongs to. It can link it to Account, Lead, Opportunity, Case (and Contact in B2C mode). If it wasn't recognized user can link it manually filling *Parent* field.

If an email came from a new potential client user can **convert it to Lead**. Open Email entry and click Create Lead in top-right menu.

It's also possible to **create Task or Case** from the email entry.

If email addresses (from, to, cc) in an email entry are known to the system it will show the person it is related to (Contact or Lead). If some email address is new you can **create contact** right from there.

All emails related to a specific record are shown in History panel of that record. If some email is related e.g. to opportunity but opportunity is related to the account, it will shown both in opportunity and account.

##Sending Emails

You can compose new email few ways:
* *Compose Email* button on Emails list view;
* replying on another email;
* clicking on an email address of some record;
* *Compose Email* action of Activities panel.

There is ability to **select template** of your email.

You can setup **email signature** in Preferences.

If you **save email as draft** you can edit it later. Just change filter to Draft to show all draft emails
