# Mass Email

In this article:

* [How to send mass email](#how-to-send-mass-email)
* [Test sending](#test-what-will-be-sent-to-recipients)
* [Opt-out-link](#opt-out-link)
* [Tracking URL](#tracking-url)
* [Target Lists](#target-lists)
* [Campaign Log](#campaign-log)
* [Settings](#settings)
* [Troubleshooting](#troubleshooting)

## How to send mass email

You need to have at least one Target List with target records and Email Template in your crm.

1. Create new Campaign with a type `Email` or `Newsletter`. Select one or a few target lists in *Target Lists* field.
2. After Campaign record is created create Mass Email for this campaign: click plus on Mass Email panel. Specify _Date Start_ - when emails should be sent, and select _Email Template_. Make sure *Status* is set as `Pending`.

If everything is setup right emails should go out. They should be sent each hour with portions (you can change portion size in Administration > Outbound Emails). Administrator can change it by updating *&Scheduling* field of 'Check Group Email Accounts' Scheduled Job.

You can check if emails are sent in Log panel.

## Test what will be sent to recipients

Click right dropdown on the mass email row in _Mass Email_ panel and then click _Send Test_.

## Opt-out link

By default the system will append opt-out to all sent emails. But you can use custom one in your Email Template.

Example:

```html
<a href="{optOutUrl}">Unsubscribe from the mailing list.</a>
```

Administrator can disable mandatory opt-out link being added by system at Administration > Outbound Emails.

## Tracking URL

If you want to know that your recipient opened the link from your email, you need to create Tracking URL. Specify any _Name_
 and _URL_ where your link should lead to. Then you will need to paste generated code into your Email Template.

 Example:

```html
<a href="{trackingUrl:55f2c87b09a220a78}">Try our demo</a>
```

## Target Lists

Target Lists contains the lists of Accounts, Contacts, Leads and Users records.

Users can populate target lists manually using _Select_ action on the corresponding panel on Target List detail view. There is an ability to make filtering and then select all results of the search.

### Populating target lists with Reports

[Reports](reports.md#syncing-with-target-lists) feature provides an ability to populate target lists with records matching specific criteria.

### Excluding Target Lists

Specify Excluding Target Lists to avoid sending mass email to certain recipients. If there is a record with the email address that matches the email address of any excluding record, the first record will be excluded as well.

## Campaign Log

In Campaign Log you can see emails that have been sent, opened emails, bounced emails, who opted out, and who clicked the link in the email.

* Sent email
* Links clicked by recipient
* Recipients who opted out
* Bounced emails (not delivered to recipient)
* Emails opened by recipient (disabled by default)

It's possible to utilize this log by creating Target List (dropdown in the top-right corner on panel) based on records from log. For example, you pick only contacts that clicked on the link (tracking url).

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

Check *Site URL* parameter at Administrtion > Settings. The value must be the URL of your EspoCRM, this URL must be accessible externally.

#### Bounced emails are not being logged

Bounced emails can be handled by group email account only. Make sure that you have a group email account that monitors the mailbox bounced emails are sent to.

Also some mail server providers can deviate from standards, so bounced emails can be not distinguished.

## See also

* [Custom unsubscribe page](../development/campaign-unsubscribe-template.md)
* [Drip Email Campaign with BPM](../administration/bpm-drip-email-campaign.md)
