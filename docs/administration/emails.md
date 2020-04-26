# Email Administration

> Important. [Cron](server-configuration.md#setup-a-crontab) should be configured in your system to make email fetching work. You can find the information in your EspoCRM at Administration > Scheduled Jobs.

## Overview

EspoCRM has an ability to monitor IMAP mailboxes. Email can be fetched by Group Email Accounts and Personal Email Accounts. Group Email Accounts represents group mailboxes: the most common case is a support-team mailbox. Personal Email Accounts represents personal mailboxes of users.

As an email is coming, the system tries to link it with the appropriate record (Accounts, Lead, Opportunity, Case). Users who follow that record will receive notification about new email in the system, even if they are not listed in To or CC of the email.

Note: Email records are not duplicated in the system if they are fetched by different email accounts. If you remove an email record from the CRM it will be removed for all users. It's recommended to use **moving to trash** instead. It's recommended to restring *delete* access for users in Roles.

## Group Email Accounts

Only administrator can setup Group Email Accounts. Group Email Accounts can be used for both receiving and sending emails.

*Teams* field (of group email account record) determines which teams incoming emails will be assigned to. 

If the group email account has SMTP and it's checked as **shared**, then users will be able to use this account to send emails. An access to the account for sending is controlled by Roles through *Group Email Account* permission. If the permission level is set to `Teams` then users of the teams selected in *Teams* field of the group email account, will be able to use the group email account.

There is the ability to make the system send an **auto-reply** for incoming emails.

### Email-to-Case

There is an option to make the system create new case record from each email incoming to a specific group email account. Cases can be distributed to users of a specific team. There are three available distribuyion rules: *direct assignment*, *round-robin* and *less-busy*. 

Note: Only the first email in the thread creates a new case. Every subsequent email will be linked to the existing case record and note will be added to the Stream panel.

When a user want to send a reply to the customer, they need to make sure that the case is selected as a **parent** of the email that is being sent. It will add the group email address to *Reply-To* field of the email. So the customer's reply will be sent to the group address rather than to the user’s.

## Personal Email Accounts

Regular users can setup their own email accounts that need to be monitored. Emails > top right dropdown menu > Personal Email Accounts. Administrator also can manage personal email accounts of users.

Important: By default regular users doesn't have an **access** to personal email accounts. Administrator needs to allow an access to *Personal Email Accounts* scope in Roles.

## Email Filters

Email Filters allow the filtering of incoming emails according to specified criteria. E.g. if you don't want notification messages sent by some application to be imported to EspoCRM, you can create filter to make EspoCRM skip them.

Admin can create **global filters**, applied to all email accounts. Users can create filters for their own personal email account and for entire inbox.
