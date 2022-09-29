# SMS Sending

In order to send SMS and MMS of any kind to EspoCRM (sending SMS manually, mass SMS, SMS notifications, SMS Two Factor Authentication), you first need to install the [SMS Providers](https://github.com/espocrm/ext-sms-providers/) extension.

The following SMS providers are currently supported by the extension:

- [Twilio](#configuring-for-twilio)
- Spryng
- sms77a
- smstools
- SerwerSms 



---

In this article:

* [Setting up](#setting-up)
* [Manual SMS Sending](#manual-sms-sending)
* [Mass SMS Sending](#mass-sms-sending)
* [Notification SMS Sending](#notification-sms-sending)
* [SMS Two Factor Authentication](#sms-two-factor-authentication)

## Setting up

In the [espocrm/ext-sms-providers](https://github.com/espocrm/ext-sms-providers/) repository, go to the **Releases** tab and download the `sms-providers-1.4.0.zip` archive (or any other latest version).

After you have downloaded the required archive with the extension, go to your instance in the browser to the *Administration* > *Extensions* tab and upload the downloaded archive, then install it.

After SMS Providers extension installation, go to *Administration* > *SMS* and select the **SMS Provider** you need in the drop-down list. Also, in the **SMS From Number** field, enter the number with the country code (*like +11111111111*) from which you will send SMS messages.

Next, go to *Administration* > *Integrations* and set up the SMS Provider you need.

## Manual SMS Sending

Will be filled soon.

## Mass SMS Sending

To send mass SMS, you will need to create a Report and Workflow ([Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) extension features).

To begin with, you need to create a Report with a list of contacts/leads/accounts for which you want to send SMS. You can learn more about Reports [here](https://docs.espocrm.com/user-guide/reports/).

After that, you need to create a Workflow with the *Target Entity* (Contact/Lead/Account) for which you created the Report, and with the *Trigger Type* **[Scheduled](https://docs.espocrm.com/administration/workflows/#scheduled)**. Set Scheduling as you need, with what frequency SMS should be sent. You can learn more about Workflows [here](https://docs.espocrm.com/administration/workflows/).

After that, for this Workflow, select **Execute Formula Script** *Action* and paste this formula:

```
$body = string\concatenate('Hi, ', name, '! This is SMS notification from EspoCRM.');

$smsId = record\create(
    'Sms',
    'to', phoneNumber,
    'body', $body
);

ext\sms\send($smsId);
```

This action uses the creation of a variable (*$body*) using **[string\concatenate](https://docs.espocrm.com/administration/formula/#stringconcatenate)** formula, which stores the plain text and the attribute of the entity (*name*). You can paste any other text. This will be the **body** of your SMS.

## Notification SMS Sending

To send SMS notification, you will need to create a Workflow ([Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) extension feature). 
You can learn more about Workflows [here](https://docs.espocrm.com/administration/workflows/).

You can choose any *Target Entity* and *Trigger Type* you want. In any case, at the end you will need to select **Execute Formula Script** *Action* and paste this formula:

```
$body = 'Hi! This is SMS notification from EspoCRM.';

$smsId = record\create(
    'Sms',
    'to', '+11111111111',
    'body', $body
);

ext\sms\send($smsId);
```

This action uses the creation of a variable (*$body*) , which stores the plain text. You can insert any other text in single brackets instead of text `Hi! This is SMS notification from EspoCRM.`. This will be the **body** of your SMS.

## SMS Two Factor Authentication

Note that the Phone field of the user for whom you want to set up 2FA must be filled in with at least one phone number.

1. Go to *Administration* > *Authentication* and check box **Enable 2-Factor Authentication**. Add the `SMS` value in field **Available 2FA methods**. Save changes. 
2. Go to *Administration* > *Users* and select the user for which 2FA will be configured.
3. In the record of this user, click on the **Access** button and check the box *Enable 2-Factor Authentication*. Also, choose `SMS` 2FA Method in the drop down list. Click the Apply button.
4. Enter the Administrator password, select a phone number that will be used for 2FA in the *Phone* dropdown list, and click the **Send Code** button.
5. Enter the code that will be sent to the selected phone number and click the Apply button.


## Configuring for Twilio

In order for Twilio Integration to work for receiving and making calls, SMS and MMS, first configure it according to [this instructions](https://docs.espocrm.com/extensions/voip-integration/twilio-integration-setup/). 

At *Administration* > *VoIP Routers* > `the phone number required for sending and receiving SMS`, check the **SMS** and **MMS** boxes for those team users for whom you need in the Team Users panel.

Also, you need to enable Twilio messaging geographic permissions: 

1. Login to your **Twilio** account. 
2. Navigate to the *Programmable SMS* > *Settings* > *[Geo Permissions](https://www.twilio.com/console/sms/settings/geo-permissions)*. 
3. Enable needed countries.

Do not forget to set **[Grant access to Messages](https://docs.espocrm.com/extensions/voip-integration/customization/#grant-access-to-messages)** for the required users.

Keep in mind that for Twilio Trial account you will need to add a [**Verified Phone Numbers** or **Caller ID**](https://support.twilio.com/hc/en-us/articles/223180048-Adding-a-Verified-Phone-Number-or-Caller-ID-with-Twilio).

After that, you can proceed to the full installation and configuration of the SMS Providers extension.
