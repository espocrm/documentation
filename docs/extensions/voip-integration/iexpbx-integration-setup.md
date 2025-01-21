# iexPBX Integration Setup

iexPBX integration is available as part of [VoIP Integration extension](https://www.espocrm.com/extensions/voip-integration/). It allows to integrate EspoCRM with iexPBX server and other VoIP providers, read more details [here](https://www.espocrm.com/features/iexpbx-integration/).

## How to setup iexPBX Integration for an administrator

#### Step 1:

Fill in the connection details of your iexPBX server. To do this, go to the Administration (System panel) > Integrations > VoIP · iexPBX.

![iexPBX integration config](../../_static/images/extensions/voip-integration/iexpbx-admin-setup.png)

* **Name** – name of your connection.
* **Server URL** – URL of your iexPBX server.
* **API User** – API user of your iexPBX server.
* **API Secret** – API Secret of your iexPBX server.
* **Access Key to EspoCRM** – the key to access to EspoCRM to handle incoming/outgoing calls.
* **Default Country** – the country is used to format phone numbers.
* **Dial Format for outgoing calls** – a phone number format for outgoing (click-to-call) calls.
* **Call Recording** – if you want to have possibility to listen recorded calls. This option should also be enabled in your telephony server.
* **List of ignored numbers** – list of numbers which will be ignored. Popup window will not be displayed. Use numbers in the following formats: +14844608117 (full number match) or #4844608117# (regular expression).
* **Permitted Entities** – entities that will be displayed in the popup window and will be used to identify a caller by his phone number.
* **Apply global ACL for caller lookup** – apply global ACL rules (Administration > Roles) for caller lookup. This information is displayed in the popup window. If unchecked, no ACL restrictions are used.
* **Hide a Lead** – hide a Lead in a call popup when Account / Contact are available.
* **Display Accounts related to Contacts** – display only Accounts related to Contacts.
* **Automatically save a call** – automatically save incoming/outgoing calls in the system without having to press "Save" button.
* **Automatically open the caller information** – automatically open the caller information for incoming/outgoing calls.
* **Quick Create Entities** – entities which can be created through the call popup window.
* **Experimental features** – test experimental features.

#### Step 2:

Setup webhooks on iexPBX server to handle incoming/outgoing calls. It can be done by login to a web panel of your iexPBX server, go to Settings > API Integrations and define two Webhooks:

##### Call Event Webhook

- Function: `Arama Bilgisi Gönder`
- Fonksiyon 2: `Tümü`
- Type: `GET olarak`
- URL Address: `https://YOUR_ESPOCRM_URL/api/v1/Voip/webhook/IexPBX/YOUR_ACCESS_KEY?chanid={chanid}&src={src}&dst={dst}&type={calltype}`

![iexPBX Webhook 1](../../_static/images/extensions/voip-integration/iexpbx-call-event-webhook.png)

##### Call Status Webhook

- Function: `Kapatma Bilgisi Gönder`
- Fonksiyon 2: `Tümü`
- Type: `GET olarak`
- URL Address: `https://YOUR_ESPOCRM_URL/api/v1/Voip/webhook/IexPBX/YOUR_ACCESS_KEY?chanid={chanid}&status={status}&duration={duration}`

![iexPBX Webhook 2](../../_static/images/extensions/voip-integration/iexpbx-call-status-webhook.png)


## How to setup iexPBX Integration for users

Each user who wants to use iexPBX integration, should setup his access in the User’s Profile, under “VoIP Settings”.

![iexPBX User settings](../../_static/images/extensions/voip-integration/iexpbx-user-settings.png)

* **VoIP Server** – select your iexPBX server.
* **Your user extension** – your internal SIP extension for the iexPBX server (e.g. 101).
* **Your VoIP password** – your SIP password for your iexPBX server.
* **Display call notifications** – an option to enable/disable incoming/outgoing call notifications.
* **Silent notifications** – mute notification sound.
* **Use internal click-to-call** – an option to enable/disable the internal click-to-call feature. It is a feature to make outgoing calls through the iexPBX server. If the checkbox is unchecked, then an external application will handle “tel:” links.
