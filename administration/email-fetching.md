#Email Fetching


>Important. Cron should be configured in your system to make Email Fetching feature working. You can find the infornation in your EspoCRM: Administration > Scheduled Jobs.


##Overview

EspoCRM has an ability to monitor IMAP mailboxes. Email can be archived in two ways: Group Email Accounts and Personal Email Accounts. Group Inbound Accounts are intended for group mailboxes: the most common case is a support box. Personal Email Accounts are intended for users’ personal mailboxes.

As email is coming the system is trying to link it with an appropriate record (Acconts, Lead, Opportunity, Case). Users who follow that record will receive notification about a new email in the system. Even if they are not in To or CC.

##Group Email Accounts

Only administrator can setup Group Email Accounts. It’s possible to select team that incoming emails will be assigned to. There is an ability to make the system send auto-reply email.

##Email-to-Case

There is an option to make the system create cases from incoming group emails. 
This feature is intended for support teams. 
Cases can be distributed to users from a specified team following next ways: 
`direct assignment`, `round-robin` and `less-busy`. 
Only the first email in the thread creates a new case. 
Every following one will be linked to the existing case record and displayed in its Stream panel.

When users want to send a reply to the customer they need to make sure that the case in selected as a parent of the email that is being sent. It will make the customer reply to the group email address rather than to user’s one.

##Personal Email Accounts

Users can setup their own email accounts that are needed to be monitored. Emails > Top Right Dropdown Menu > Personal Email Accounts. Administrator also can manage users' email accounts.

##Email Filters

Allow to filter incoming emails according to specified criteria. E.g. if you don't need notification messages sent by some application be imported to EspoCRM you can create filter to make EspoCRM to skip them.

Admin can create global filters, applied to all email accounts, leaving `Parent` field empty. Users can create filters for only own personal email account.
