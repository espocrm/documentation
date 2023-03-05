# Mass Email

In this article:

* [How to send mass email](#how-to-send-mass-email)
* [Test sending](#test-what-will-be-sent-to-recipients)
* [Opt-out-link](#opt-out-link)
* [Tracking URL](#tracking-url)
* [Target lists](#target-lists)
* [Campaign log](#campaign-log)
* [Bounce emails](#bounce-emails)
* [Settings](#settings)
* [Troubleshooting](#troubleshooting)

## How to send mass email

You need to have at least one Target List with target records and an Email Template in your CRM.

1. Create a new Campaign with the type `Email` or `Newsletter`. Select one or a few target lists in the *Target Lists* field.
2. After the Campaign record is created create a Mass Email for this campaign: click the plus icon on the Mass Email panel. Specify the _Date Start_ − when emails should be sent, and select a _Email Template_. Make sure the *Status* is set as `Pending`.

If everything is setup right emails should go out. They should be sent each hour in portions (you can change the portion size at Administration > Outbound Emails). Administrator can change the *Scheduling* of the 'Check Group Email Accounts' scheduled job.

You can check if emails are sent in Log panel.

## Test what will be sent to recipients

Click on the right dropdown on the mass email row in the _Mass Email_ panel and then click _Send Test_.

## Opt-out link

The system appends an opt-out link to all sent emails if it's missing in the email body. You can use a custom opt-out link in your email template.

!!! example

    ```html
    <a href="{optOutUrl}">Unsubscribe from the mailing list.</a>
    ```

Administrator can disable the mandatory opt-out links at Administration > Outbound Emails.

## Tracking URL

If you want to know that your recipient opened the link from your email, you need to create Tracking URL. Specify any _Name_
 and _URL_ where your link should lead to. Then you will need to paste a generated code into your email template.

!!! example

    ```html
    <a href="{trackingUrl:55f2c87b09a220a78}">Try our demo</a>
    ```

## Target lists

Target Lists contains lists of Accounts, Contacts, Leads and Users records. Custom entities of the Person and Company types are supported too (as of v7.1).

Users can populate target lists manually using _Select_ action on the corresponding panel on Target List detail view. There is the ability to make filtering and then select all results of the search.

### Populating target lists with Reports

[Reports](reports.md#syncing-with-target-lists) feature provides the ability to populate target lists with records matching specific criteria.

### Excluding target lists

Specify Excluding Target Lists to avoid sending mass emails to certain recipients. If there is a record with the email address that matches the email address of an excluded record, it will be excluded as well.

### Custom entity support

*[As of v7.1.](https://github.com/espocrm/espocrm/issues/2203)*

The admin needs to create a many-to-many relationship between the Target List and the custom entity (of Person or Company type). Then add the panel to the Bottom Panels layout of the Target List entity.

## Campaign log

In the Campaign Log you can see emails that have been sent, opened emails, bounced emails, who opted out, and who clicked the link in the email.

* Sent email
* Links clicked by the recipient
* Recipients who opted out
* Bounced emails (not delivered to the recipient)
* Emails opened by the recipient (disabled by default)

It's possible to utilize this log by creating a Target List (dropdown in the top-right corner on panel) based on records from log. For example, you pick only contacts that clicked on the link (tracking url).

## Bounce emails

Bounce email is an automatic email message from an email system reporting that a sent message has not been delivered.

There are two types of bounced emails: hard and soft. The hard-bounce will mark the recipient email address as invalid so no more email will be sent to it in future. Soft-bounces will be only logged in the campaign log.

Bounced emails can be handled only by a group email account. 

## Settings

Only for Administrator.

Mass Email system parameters available at Administration > Outbound Emails > Mass Email panel.

* Max number of emails sent per hour;
* Disable mandatory opt-out link − by default opt-out link is added even if it's absent in Email Template, you can disable this behaviour;
* Email Open Tracking − whether to track email opening (not working with most of email providers);
* Use [VERP](https://en.wikipedia.org/wiki/Variable_envelope_return_path) − for more reliable bounced email precessing.

## Troubleshooting

Only for Administrator.

#### What to do if emails are not sent out.

1. Check if _Send Test_ works. If doesn't work, then check if system SMTP settings are correct.
2. Check if you have setup cron for your system.
3. Check if you have 'Send Mass Emails' Scheduled Job and it's 'Active' (Administration > Scheduled Jobs > Send Mass Emails). Check if there is something in the log.

#### What if Tracking URLs has wrong url that does not lead to your crm.

Check *Site URL* parameter at Administration > Settings. The value must be the URL of your EspoCRM, this URL must be accessible externally.

#### Bounced emails are not being logged

Bounced emails can be handled by a group email account only. Make sure that you have a group email account that monitors the mailbox bounced emails are sent to.

Also some mail server providers can deviate from standards, so bounced emails can be not distinguished.

## See also

* [Custom unsubscribe page](../development/campaign-unsubscribe-template.md)
* [Drip Email Campaign with BPM](../administration/bpm-drip-email-campaign.md)
