# Email Administration

Important: [Cron](server-configuration.md#setting-up-crontab) should be configured in your system to make email fetching work.

## Overview

EspoCRM has the ability to monitor IMAP mailboxes. Emails can be fetched by Group Email Accounts and Personal Email Accounts. Group Email Accounts represent group mailboxes: the most common case is a support-team mailbox. Personal Email Accounts represent personal mailboxes of users.

As an email is coming, the system tries to link it with the appropriate record (Accounts, Lead, Opportunity, Case). Users who follow that record will receive notification about a new email in the system, even if they are not listed in To or CC of the email.

Note: Email records are not duplicated in the system if they are fetched by different email accounts. If you remove an email record from the CRM, it will be removed for all users. It's recommended to use **moving to trash** instead. It's recommended to restrict *delete* access for users in Roles.

## Group Email Accounts

Group email accounts can be accessed at Administration > Group Email Accounts.

Only administrator can setup Group Email Accounts. Group Email Accounts can be used for both receiving and sending emails.

*Teams* field (of group email account record) determines which teams incoming emails will be assigned to. 

If the group email account has SMTP and it's checked as **shared**, then users will be able to use this account to send emails. Access to the account for sending is controlled by Roles through *Group Email Account* permission. If the permission level is set to `Teams`, then users of the teams selected in *Teams* field of the group email account will be able to use the group email account.

There is the ability to make the system send an **auto-reply** for incoming emails.

### Making group email account system default

There's the ability to make a specific group email account to be used as a system default, meaning that all notifications and system emails will be sent from that account.

1. Create and configure group email account (at Administration > Group Email Accounts).
2. Navigate to Administration > Outbound Emails.
3. Specify the email address (the same your group email account has) in the *Email Address* field.
4. Make sure that the *Server* field is set empty (on the *SMTP* panel).


### Email-to-Case

There is an option to make the system create a new case record from each email incoming to a specific group email account. Cases can be distributed to users of a specific team. There are three available distribution rules: *direct assignment*, *round-robin* and *less-busy*. 

Note: Only the first email in the thread creates a new case. Every subsequent email will be linked to the existing case record and note will be added to the Stream panel.

When a user wants to send a reply to the customer, they need to make sure that the case is selected as a **parent** of the email that is being sent. It will add the group email address to *Reply-To* field of the email. So the customer's reply will be sent to the group address rather than to the user’s one.

## Personal Email Accounts

Regular users can set up their own email accounts that need to be monitored. Emails > top right dropdown menu > Personal Email Accounts.

The administrator also can manage personal email accounts of users (at Administration > Personal Email Accounts).

Important: By default, regular users don’t have **access** to personal email accounts. Administrator needs to allow access to *Personal Email Accounts* scope in Roles.

## Email Filters

Email Filters allow filtering of incoming emails according to specified criteria. E.g. if you don't want notification messages sent by some application to be imported to EspoCRM, you can create a filter to make EspoCRM skip them.

Admin can create **global filters**, applied to all email accounts. Users can create filters for their own personal email account and for the entire inbox.
