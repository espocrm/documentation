# Email Administration

!!! important

    [Cron](server-configuration.md#setting-up-crontab) should be configured in your system to make email fetching work.

## Overview

EspoCRM has the ability to monitor IMAP mailboxes. Emails can be fetched by Group Email Accounts and Personal Email Accounts. Group Email Accounts represent group mailboxes: the most common case is a support-team mailbox. Personal Email Accounts represent personal mailboxes of users.

As an email is coming, the system tries to link it with an appropriate record (Accounts, Lead, Opportunity, Case). Users who follow that record will receive a notification about the new email in the system, even if they are not recipients of the email.

!!! warning "Important"

    Email records **are not duplicated** in the system, even regardless of being fetched by different email accounts. If you remove an email record from the CRM, it will be removed for all users. It's recommended to **move to trash** instead. It's also recommended to restrict *delete* access for users in Roles.

## Access control

Access to imported emails is controlled by Roles. It means that if a particular email was imported from a mailbox of some user, other users will be able to see that email if they have access to that email.

By default, users don't have access to any emails. If a user has a *read* access level set to *own*, they will be able to see emails where their email address is either in the *From*, *To* or *CC* fields.

There are 4 access levels: No, Own, Team, All.

## Group Email Accounts

Group Email Accounts can be accessed at Administration > Group Email Accounts.

Only administrator can setup Group Email Accounts. Group Email Accounts can be used for both receiving and sending emails.

The *Teams* field determines which teams incoming emails will be assigned to. 

If a Group Email Account has the SMTP enabled and it's checked as **shared**, then users will be able to use this account when sending emails. Access to the account for sending is controlled by Roles through the *Group Email Account* permission. If the permission level is set to *teams*, then users of the teams selected in the *Teams* field of the Group Email Account will be able to use that Group Email Account.

There is the ability to make the system send an **auto-reply** for emails incoming to a Group Email Account.

### Making Group Email Account system default

There's the ability to make a specific Group Email Account to be used as a system default, meaning that all notifications and system emails will be sent from that account.

1. Create and configure a Group Email Account (at Administration > Group Email Accounts).
2. Navigate to Administration > Outbound Emails.
3. Specify the email address in the *Email Address* field. The email address should be exactly the same as in the created Group Email Account.
4. Make sure that the *Server* field value is empty (on the *SMTP* panel).

### Email-to-Case

There is an option to make the system create a new Case record from each email incoming to a specific Group Email Account. Cases can be distributed to users of a specific Team. There are three available distribution rules: *Direct Assignment*, *Round-Robin* and *Less-Busy*. 

!!! note

    Only the first email in the thread creates a new Case. Every subsequent email will be linked to the existing Case record and a Note will be added to the Stream.

When a user wants to send a reply to a customer, they need to make sure that the Case is selected as a **parent** of the email that is being sent. It will add the group email address to the *Reply-To* field of the email. So a customer's reply will be sent to the group address rather than to the user’s one.

## Personal Email Accounts

Regular users can set up their own email accounts that need to be monitored (at Emails tab > top right dropdown menu > Personal Email Accounts).

The administrator also can manage Personal Email Accounts of users (at Administration > Personal Email Accounts).

!!! warning "Important"

    By default, regular users don’t have **access** to Personal Email Accounts. The Administrator needs to allow access to the *Personal Email Accounts* scope in Roles.

!!! warning "Important"

    This is required to have the email functionality working properly. User records need to have their email address (or multiple addresses) set in the *Email* field. Only the administrator can change the *Email* field for users. It's supposed that the user's email address is the same as the email address of the user's Personal Email Account.

## Email Filters

Email Filters allow filtering of incoming emails according to specified criteria. For example, if you don't want notification messages sent by some application to be imported to EspoCRM, you can create a filter to make EspoCRM skip them.

The administrator can create **global** filters applied to all email accounts. Users can create filters for their own Personal Email Account and for their entire Inbox.
