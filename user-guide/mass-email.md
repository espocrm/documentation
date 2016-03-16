# Mass Email

## How to send mass email

You need to have at least one Target List with target records and Email Template in your crm.

1. Create new Campaign with a status `Email` or `Newsletter`. Select one or a few target lists in `Target Lists` field.
2. After Campaign record is created create Mass Email for this campaign: click plus on Mass Email panel. Specify _Date Start_ - when emails should be sent, and select _Email Template_. Make sure _Status_ set as `Pending`.

If everything is setup right emails should go out. They should be sent each hour with portions (you can change portion size in Administration > Outbound Emails). Administrator can change it by updating `Scheduling` field of `Check Group Email Accounts` Scheduled Job.

You can check if emails are sent in Log panel.

## Test what will be sent to recipients

Click right dropdown on the mass email row in _Mass Email_ panel and then click _Send Test_.

## Log

In log you can see:
* Sent email;
* Emails opened by recipient;
* Links clicked by recipient;
* Recipients who opted out;
* Bounced emails (not delivered to recipient).

## Opt-out link

By default the system will append opt-out to all sent emails. But you can use custom one in your Email Template.

Example:
```html
<a href="{optOutLink}">Unsubsribe from the mailing list.</a>
```

## Tracking URL

If you want to know that your recipient opened the link from your email you need to create Tracking URL. Specify any _Name_
 and _URL_ where your link should lead to. Then you will need to paste generated code into your Email Template.

 Example:
 ```html
<a href="{trackingUrl:55f2c87b09a220a78}">Try our demo</a>
 ```

## Excluding Target Lists

Specify Excluding Target Lists to avoid sending mass email to certain recipients. If there is a record with the email address that matches the email address of any excluding record, the first record will be excluded as well.

## Troubleshooting

_For Administrators_

#### What to do if emails are not sent out.

1. Check if _Sent Test_ works. If does't work then check if system SMTP settings are correct.
2. Check if you have setup cron for your system.
3. Check if you have `Check Group Email Accounts` Scheduled Job and it is `Active`. Check if there are something in Log.


#### What if Tracking URLs has wrong url that does not lead to your crm.

Check 'siteUrl' paramater in `data/config.php` file. It mube be set as URL of your EspoCRM accessible from the external world.



