# Guidelines on using emails

EspoCRM is designed to be able to work with emails right from within the system without the necessity to use an email client separately. Though users may still opt to use an email client and have both sent and received emails synced to Espo.

In this article:

* [IMAP accounts](#imap-accounts)
* [SMTP accounts](#smtp-accounts)
* [Working with emails](#working-with-emails)
* [Sending emails](#sending-emails)
* [Email folders](#email-folders)
* [Group email folders](#group-email-folders)
* [Email filters](#email-filters)
* [Email templates](#email-templates)
* [Manual import](#manual-import)

## IMAP accounts

*The section concerns email receiving.*

!!! note

    You need to have [cron](../administration/server-configuration.md#setting-up-crontab) properly configured in your system to have inbound emails working.

A regular user can set up an IMAP account on the Personal Email Accounts page (Emails tab > top-right menu > Personal Email Accounts).

Specify what folders to monitor in *Monitored Folders* field. By default, it's set to INBOX. 

If you use an **external email client** for email sending, you can add *Sent* folder to monitored ones. Emails sent from the external client will be imported to Espo. Note that your external client needs to be configured to store sent emails on the IMAP server.

*Fetch Since* allows you to choose the date emails should be imported from. Set it to some date prior today if you need to archive old emails.

There is the ability to specify *Folder* in a Personal Email Account. Incoming emails will be put in that Email Folder folder. Note that Emails Folders are personal for users.

For regular users, access to Personal Email Accounts must be allowed in Roles.

## SMTP accounts

*The section concerns email sending.*

Users can set SMTP settings in their Personal Email Accounts. Personal Email Accounts available at Emails tab > top-right menu > Personal Email Accounts. 

For regular users, access to Personal Email Accounts must be allowed in Roles.

An administrator can also allow to use the main system SMTP account as well as Group Email Accounts (needs to mark as Shared).

Users can have multiple SMTP accounts.

!!! important

    Email addresses that user can use to send emails from must be defined in *Emails* field of the *User* record. Only the admin can define user's email addresses (by default).

## Working with emails

Emails are fetched by Cron (in the background) every few minutes (period can specified by the administrator).

A user can see emails on the page accessed through the *Emails* tab.

There are the following default folders available:

* All – all emails in the system the user has access to; the user can see even emails of other users here (if Roles allow);
* Inbox – incoming emails sent to the user are automatically placed here;
* Sent – emails sent by the user;
* Draft – emails composed by the user but not yet sent; 
* Archive – inbox emails that the user explicitly moved to the Archive;
* Trash – inbox emails that the user explicitly moved to the Trash.

Additionally, there are also user's Email Folders and Group Email Folders listed.

The Email's *Status* field has the following values:

* *Sent* – sent by means of the CRM;
* *Imported* – fetched from an IMAP account or imported manually;
* *Draft* – created as a draft and not yet sent.

When a new email comes, the system tries to recognize which record this email belongs to. It can link it with Account, Lead, Opportunity, Case (and also Contact in B2C mode), etc. If it wasn't recognized, then the user can link it manually by filling in the *Parent* field.

If an email came from a new potential client, the user can convert it to a Lead (from the top-right menu).

It's possible to create a Task or Case from an email record (from the top-right menu).

If email addresses (From, To, CC) of the email record are known to the system, it will show the person they are related to (Contact, Lead, User, etc.). If some email address is new, you can create a Contact right from there.

All emails related to a specific record are shown in the History panel of that record. If some email is related, for example, to an opportunity but the opportunity is related to an account, it will be shown both in the opportunity and the account.

When **removing** an email it gets removed from the system entirely, so that it will disappear from their *Inbox*. To prevent this, use *Move to Trash*. An administrator may not grant *delete* access for users to prevent losing emails.

On the list view it's possible to **drag & drop** emails into folders by dragging by a subject link (as of v7.3).

### Inbox

Emails related to a user through the *Users* relationship are referred as their Inbox emails. Only Inbox emails can be moved to Archive, Trash or a personal Email Folder by a user. Only Inbox emails can be marked as read, not read or important by a user.

!!! important

    The same Email record can be located in the Inbox of multiple users.

An administrator can view and manage users an email is related to by clicking *View Users* action from the dropdown next to the *Edit* button.

As of v8.5. Regular users can view users an email is related to: Email detail view > dropdown next to *Edit* > View Users. If a user has *edit* access to a particular Email, they can also add other users to the Email so that it will appear in the Inbox of those users. Adding users requires the assignment permission.

### Concept

Espo does not work exactly like a regular personal email client. Espo is a central place where emails from multiple email accounts are gathered.

The same email record can appear in the inboxes of multiple users, for example, when they were both recipients of the email. When the same email is imported from multiple email accounts, only one email record will be stored in Espo. Emails are recognized as duplicates by their *Message-ID*.

A user with high privileges can see an email even if it was not addressed to them. This allows the monitoring of subordinates' communication within the organization.

Email folders in Espo are not connected with IMAP folders, there's no two-way sync between them by design.

## Sending emails

You can compose a new email in a few ways:

* using the *Compose Email* button on the Emails list view;
* replying on another email;
* clicking on an email address of some record;
* using the *Compose Email* action from the Activities panel on the detail view of a particular record.

There is the ability to select a template for an email you compose.

You can set up the email signature in the Preferences. This signature will be used for all emails you compose.

It's possible to use an **external email client**: the default one on your computer or device. For this, check *Use an external email client* in the Preferences.

## Email folders

Users can create their personal Email Folders to put some emails in for convenience. To create or edit folders, follow: the Emails list view > dropdown in the top-right corner > Folders. *Skip Notification* means that you won't be notified about incoming emails that get to the specific folder. By utilizing Email Filters, it's possible to put emails in folders automatically by specific criteria.

!!! note

    Email folders in EspoCRM have nothing to do with IMAP folders.

## Group email folders

*As of v7.3.*

Group Email Folders are shared for teams. An administrator can create group email folders and specify which teams have access to a particular folder.

If an email is moved from a group folder to a personal folder or the Inbox, it will unlink the email from that group folder.

There's the ability to automatically put inbound emails imported through a group email account to a specific group folder. It's also possible to move emails matching an email filter to a specific group folder (the filter should be related to a group email account).

Users that have access to a group folder can put there emails that they have edit access to. If an email is located in a group folder, a user does not have edit access to, they won't be able to move that email to another folder.

The field-level-security (in Roles) can be used to restrict the ability to change (edit) the group folder.

## Email filters

Administrator can create global Email Filters to skip not desirable emails. They are available at Administration > Email Filters.

Regular user can create Email Filters for their Personal Email Accounts or for their entire inbox. They are available at: Emails > dropdown in top-right corner > Filters.

There are two types of filters:

* Skip – email will be put in *Trash* or not imported if the filter is related to a Personal Email Account;
* Put in Folder – imported emails will be put into a specified user's folder automatically.

## Email templates

Email Templates are available at: Emails > dropdown in top-right corner > Email Templates. They can be used both for Mass Email sending and for regular emails. *One-off* checkbox means that the email template is supposed to be used only once, what is usual for email marketing.

It's possible to use placeholders in an email template's body and subject, for example, {Account.name}, {Person.emailAddress}. They will be replaced with values of a Parent record.

You can use additional reserved placeholders in the template body: `{optOutUrl}` and `{optOutLink}`. Available additional placeholders are listed in a side panel when you compose an email template.

An example of an unsubscribe link for Mass Email:

```
<a href="{optOutUrl}">Unsubscribe</a>
```

The list of available additional placeholders:

* `{today}` – today's date,
* `{now}` – current date & time,
* `{optOutUrl}` – opt-out url (only for mass email),
* `{optOutLink}` – opt-out link (only for mass email),
* `{optInUrl}` – opt-in url (only for lead capture confirm opt-in),
* `{optInLink}` – opt-in link (only for lead capture confirm opt-in).

### Handlebars support

Email Templates also support the Handlebars templating engine. It's the same template system used for [PDF templates](printing-to-pdf.md#templates) with double-brace placeholders, like `{{name}}`.

The Handlebars engine is only applied when an Email has a non-empty *Parent* field. The regular email template placeholder values are not available for Handlebars helpers.

## Manual import

It's possible to manually import specific emails. For example, if a customer sent an email to an employee's private email address, it may be reasonable to log that email in the CRM manually.

The are two ways of importing emails:

* Archive Email – create an email manually by specifying all fields on a form;
* Import EML (as of v8.4).

The ability to import emails requires a user to have access to the Import scope (set in Roles).
