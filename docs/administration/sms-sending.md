# SMS Sending

EspoCRM has the built-in functionality for sending SMS, but it's not shipped with any provider implementation. The official [SMS Providers](https://github.com/espocrm/ext-sms-providers/) extension includes implementations for the following SMS providers:

- Twilio
- Spryng
- sms77a
- smstools
- SerwerSms

Out-of-the-box it's possible to send SMS from formula-script or from PHP code. The [VoiP Integration](https://www.espocrm.com/extensions/voip-integration/) has the ability to send SMS from UI (only for the Twilio provider).

In this article:

* [Setting up](#setting-up)
* [Sending with formula](#sending-with-formula)
* [Two-Factor Authentication](#two-factor-authentication)
* [VoIP integration for Twilio](#voip-integration-for-twilio)

## Setting up

Download the extension package from the [GitHub repository](https://github.com/espocrm/ext-sms-providers/releases) (under Assets section). Then upload and install the package in Espo at Administration > Extensions.

After the SMS Providers extension is installed, go to Administration > SMS and select the **SMS Provider** you want to use from the drop-down list. Also, in the **SMS From Number** field, enter the number with the country code (e.g. +11111111111) from which you will be sending SMS messages.

Next, go to Administration > Integrations, select your provider, and set up needed credentials and parameters.

## Sending with formula

It's possible to send SMS from a formula-script with the [ext\sms\send](formula.md#extsmssend) function.

### With Workflow

*Requires [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).*

With the Workflow tool it's possible to set up Espo to SMS notification on a specific condition.

Create a Workflow rule with the needed trigger type and conditions. Add the *Execute Formula Script* action and paste the following formula-script:

```
$body = 'Hi! This is an SMS notification from EspoCRM.';

$phoneNumber = phoneNumber;

$smsId = record\create(
    'Sms',
    'to', $phoneNumber,
    'body', $body
);

ext\sms\send($smsId);
```

## Two-Factor Authentication

[SMS 2FA](2fa.md#authentication-via-sms) is supported out-of-the-box, but you need to have an implementation for your SMS provider (SMS Providers extension).

Note that the *Phone* field of the user, for whom you want to set up the Two-Factor Authentication, must be filled in with at least one number.

1. At Administration > Authentication, check the box *Enable 2-Factor Authentication*. Add the *SMS* value in the field *Available 2FA methods*. Save changes. 
2. At Administration > Users, select the user for which the 2FA will be configured.
3. On the detail view of the user, click on the *Access* button and check the box *Enable 2-Factor Authentication*. Also, choose *SMS* 2FA Method in the drop down list. Click the *Apply* button.
4. Enter the Administrator password, select a phone number that will be used for 2FA in the *Phone* dropdown list, and click the *Send Code* button.
5. Enter the code that will be sent to the selected phone number and click the *Apply* button.


## VoIP integration for Twilio

The [VoIP integration](https://www.espocrm.com/extensions/voip-integration/) integration allows to send and receive SMS/MMS from UI.

In order for the Twilio Integration to work for receiving and making calls, SMS and MMS, first configure it according to [this instructions](https://docs.espocrm.com/extensions/voip-integration/twilio-integration-setup/). 

At Administration > VoIP Routers > the phone number required for sending and receiving SMS, check the *SMS* and *MMS* boxes for those team users for whom you need in the Team Users panel.

Also, you need to enable Twilio messaging geographic permissions: 

1. Login to your *Twilio* account. 
2. Navigate to the *Programmable SMS* > *Settings* > *[Geo Permissions](https://www.twilio.com/console/sms/settings/geo-permissions)*. 
3. Enable needed countries.

Do not forget to set *[Grant access to Messages](https://docs.espocrm.com/extensions/voip-integration/customization/#grant-access-to-messages)* for the required users.

Keep in mind that for the Twilio Trial account you will need to add a [*Verified Phone Numbers* or *Caller ID*](https://support.twilio.com/hc/en-us/articles/223180048-Adding-a-Verified-Phone-Number-or-Caller-ID-with-Twilio).

After that, you can proceed to installation and configuration of the SMS Providers extension.
