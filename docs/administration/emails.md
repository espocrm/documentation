# Email Administration

> Important. [Cron](server-configuration.md#setup-a-crontab) should be configured in your system to make email fetching work. You can find the information in your EspoCRM at Administration > Scheduled Jobs.

## Overview

EspoCRM has an ability to monitor IMAP mailboxes. Email can be archived in two ways: Group Email Accounts and Personal Email Accounts. Group Inbound Accounts are intended for group mailboxes: the most common case is a support box. Personal Email Accounts are intended for users’ personal mailboxes.

As an email is coming the system tries to link it with the appropriate record (Accounts, Lead, Opportunity, Case). Users who follow that record will receive notification about a new email in the system, even if they are not in To or CC.

Note, that email records are not duplicated for different users. If you remove an email record from the crm it will be removed for all users. It's recommended to use moving to trash instead. Delete access if restricted for regular users by default.

## Group Email Accounts

Only administrator can setup Group Email Accounts. Group Email Accounts can be used for both receiving and sending emails. Sending emails from group accounts has been available since 4.9.0 version.

Teams field determines which teams incoming emails will be assigned to. 

If the group email account has SMTP and it's checked as shared, then an access will be controlled by Roles through Group Email Account permission. Teams field will be used if permission level is set to 'team'.

There is an ability to make the system send an auto-reply for incoming emails.

## Email-to-Case

There is an option to make the system create new case record from each email incoming to a specific group email account. Cases can be distributed to users of a specific team. There are three available distribuyion rules: *direct assignment*, *round-robin* and *less-busy*. 

Note: Only the first email in the thread creates a new case. Every subsequent email will be linked to the existing case record and note will be added to the Stream panel.

When a user want to send a reply to the customer, they need to make sure that the case is selected as a **parent** of the email that is being sent. It will add the group email address to *Reply-To* field of the email. So the customer's reply will be sent to the group address rather than to the user’s.

## Personal Email Accounts

Users can setup their own email accounts that need to be monitored. Emails > Top Right Dropdown Menu > Personal Email Accounts. Administrator also can manage users' email accounts.

Important: By default regular users doesn't have an **access** to personal email accounts. Administrator needs to allow an access to *Personal Email Accounts* scope in Roles.

## Email Filters

These allow the filtering of incoming emails according to specified criteria. E.g. if you don't want notification messages sent by some application to be imported to EspoCRM, you can create filter to make EspoCRM skip them.

Admin can create global filters, applied to all email accounts. Users can create filters for their own personal email account and for entire inbox.
