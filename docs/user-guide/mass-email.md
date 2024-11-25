# Mass Email

In this article:

* [How to send mass email](#how-to-send-mass-email)
* [Test sending](#test-sending)
* [Opt-out](#opt-out)
* [Tracking URL](#tracking-url)
* [Target lists](#target-lists)
* [Campaign log](#campaign-log)
* [Bounce emails](#bounce-emails)
* [Settings](#settings)
* [Troubleshooting](#troubleshooting)

## How to send mass email

You need to have at least one **Target List** with target records and an **Email Template** in your CRM.

1. Create a new Campaign of type *Email* or *Newsletter*. Select one or a few target lists in the Target Lists field.
2. After the Campaign record is created, create a Mass Email for this campaign: click the plus icon on the Mass Email panel. Specify the Date Start (when emails should be sent) and select an Email Template. Make sure the Status is set to *Pending*.

If everything is set up right, emails should go out. They will be sent in portions. You can change the portion size at Administration > Outbound Emails. The administrator can change the **scheduling** at Administration > Scheduled Jobs > Send Mass Emails.

You can check if emails are sent in the Log panel on the Campaign detail view.

## Test sending

Click the right-side dropdown in a needed record in the Mass Email panel and then click *Send Test*.

## Opt-out

The system will append an opt-out link to all sent emails in case it's missing in the email template body. You can use a custom opt-out link in your email template.

!!! example

    ```html
    <a href="{optOutUrl}">Unsubscribe from the mailing list.</a>
    ```

An administrator can disable the mandatory opt-out links at Administration > Outbound Emails.

If *Opt-Out Entirely* is checked for a Mass Email, once the recipient clicks on the opt-out link, their email address will be marked as opted out so that marketing emails will never be sent to them, unless the email address is unmarked back. If the parameter is not checked, then the recipient will be marked as opted-out in all Target Lists related to the current Campaign. They still can receive marketing emails when a different Target List is used in another Campaign.

## Tracking URL

If you want to know that your recipient opened the link from your email, you need to create a **Tracking URL**. Specify a **Name**
 and a **URL** where your link should lead to. Then, you need to paste a generated code into your email template.

!!! example

    ```html
    <a href="{trackingUrl:55f2c87b09a220a78}">Try our demo</a>
    ```

## Target lists

Target Lists contain lists of Accounts, Contacts, Leads and Users records. Custom entities of the Person and Company types are supported too.

Users can populate target lists manually using the *Select* action in the corresponding panel on the Target List detail view. There is the ability to make filtering and then *Select All Results* of the search.

### Populating target lists with Reports

The [Reports](reports.md#syncing-with-target-lists) tool provides the ability to populate target lists with records matching specific criteria.

### Excluding target lists

Specify *Excluding Target Lists* to avoid sending mass emails to certain recipients. If there is a record with an email address that matches the email address of an excluded record, it will be excluded as well.

### Custom entity support

*[As of v7.1.](https://github.com/espocrm/espocrm/issues/2203)*

An administrator needs to create a many-to-many relationship between the Target List and the custom entity (of Person or Company type). Then, add the panel to the *Bottom Panels* layout of the Target List entity type.

## Campaign log

In the Campaign Log, you can see emails that have been sent, opened emails, bounced emails, who opted out, and who clicked the link in the email.

* Sent email
* Links clicked by the recipient
* Recipients who opted out
* Bounced emails (not delivered to the recipient)
* Emails opened by the recipient (disabled by default)

It's possible create a new Target List (dropdown in the top-right corner on panel) based on records from the log. For example, you can pick only contacts that clicked on a link (tracking URL).

## Bounce emails

A bounce email is an automatic email message from an email system reporting that a sent message has not been delivered.

There are two types of bounced emails: hard and soft. The hard-bounce will mark the recipient email address as invalid so no more emails will be sent to it in future. Soft-bounces will be only logged in the campaign log.

Bounced emails can be handled only by a *Group Email Account*. 

## Settings

Only for the administrator.

Mass Email system parameters are available at Administration > Outbound Emails > Mass Email panel.

* Max number of emails sent per hour – to avoid sending rate exceeding; the actual number of emails sent per hour will be always less than this limit; the more often the job is run per hour, the more close to the limit number the number of sent emails will be;
* Max number of emails sent per batch – how many emails to send per job run per one Mass Email (as of v8.1);
* Disable mandatory opt-out link − by default opt-out link is added even if it's absent in an Email Template, you can disable this behaviour;
* Email Open Tracking − whether to track email opening (currently, not working reliably with most email providers);
* Use [VERP](https://en.wikipedia.org/wiki/Variable_envelope_return_path) − for more reliable bounced email precessing.

Configure how often the sending job is run at: Administration > Scheduled Jobs > Send Mass Emails > Scheduling.

## Troubleshooting

Only for the administrator.

#### What to do if emails are not sent out

1. Check if _Send Test_ works. If doesn't work, then check if system SMTP settings are correct.
2. Check if you have setup cron for your system.
3. Check if you have *Send Mass Emails* Scheduled Job and it is *Active* (Administration > Scheduled Jobs > Send Mass Emails). Check if there is something in the log.

#### What if Tracking URLs have wrong URL that does not lead to your CRM

Check the *Site URL* parameter at Administration > Settings. The value must be the URL of your EspoCRM instance. This URL must be also accessible externally.

#### Bounced emails are not being logged

Bounced emails can be handled by a Group Email Account only. Make sure that you have a Group Email Account that monitors the mailbox bounced emails are being sent to.

Also some mail server providers can deviate from standards, so bounced emails can be not distinguished.

Enable *VERP* at Administration > Outbound Emails > Mass Email. This improves bounce recognition significantly. Note that it will work only if your SMTP provider supports VERP. 

## See also

* [Custom unsubscribe page](../development/campaign-unsubscribe-template.md)
* [Drip Email Campaign with BPM](../administration/bpm-drip-email-campaign.md)
