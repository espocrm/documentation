# VoIP Cusomization

In this article:
* [Custom call recording URL handler](#custom-call-recording-url-handler)
* [Displaying a call recording](#displaying-a-call-recording)
* [(Asterisk) Call recording](#asterisk-call-recording)
* [Adding a call name to a call popup](#adding-a-call-name-to-a-call-popup)
* [Add click-to-call feature to a custom entity](#add-click-to-call-feature-to-a-custom-entity)
* [Add custom entities to Quick Create Entities](#add-custom-entities-to-quick-create-entities)
* [Format phone number](#format-phone-number)
* [Additional info](#additional-info)


### Custom call recording URL handler

If the standard functionality is not enough for your URL recording, there is a possibility to create a custom call recording URL handler. For this, create a file located at `custom/Espo/Custom/Modules/Voip/Providers/Asterisk/Scripts/Recording.php` with the code:

```
<?php

namespace Espo\Custom\Modules\Voip\Providers\Asterisk\Scripts;

use Espo\Modules\Voip\Entities\VoipEvent as VoipEventEntity;

class Recording extends \Espo\Modules\Voip\Providers\Asterisk\Scripts\Recording
{
    public function generateUrl(VoipEventEntity $voipEventEntity)
    {
        // YOUR CUSTOM CODE
    }
}
```

After saving, clear a local cache (Administration > Clear Cache).

###  Displaying a call recording 

For displaying call recordings in EspoCRM, go to Administration > Layout Manager > select Calls entity and add the field "Recording" for Detail layout. See the screenshot:

![Displaying call recording](call-recording.png)

After that, clear a local cache (Menu > Clear Local Cache).

### (Asterisk) Call recording

The call recording should be configured on the Asterisk side, the URL of that record will be saved in EspoCRM.

The setup process:
1. Configure a call recording on the Asterisk side.
2. Login to EspoCRM under the administrator and go to the Asterisk connector (Administration > VoIP Settings > Asterisk AMI).
3. Enable the "Listen recorded calls" option and configure the "URL to recorded calls" field.
Possible parameters:
* "{VOIP_UNIQUEID}" - uniqueid of a call;
* "{Y}" - year of a call;
* "{m}" - month of a call;
* "{d}" - day of a call.
Example:
If we have a link in a format: "http://11.11.11.11/2019/11/25/1568202771.6.mp3", then the "URL to recorded calls" should be the following:
`http://11.11.11.11/{Y}/{m}/{d}/{VOIP_UNIQUEID}.mp3`
4. Display a call recording field in a layout of Call entity.

For displaying a call recording field in EspoCRM, go to Administration > Layout Manager > select Calls entity and add the field "Recording" for Detail layout. See the screenshot:

![asterisk-call-recording](call-recording.png)

After that, clear a local cache (Administration > Clear Cache).

### Adding a call name to a call popup

To display a Call name field in a call popup, please create/modify the file `custom/Espo/Custom/Resources/metadata/app/popupNotifications.json` with the code:

```
{
    "voipNotification": {
     
        "additionalFields": {
            "callName" : {
                "display": true,
                "fullWidth": true,
                "entity": "Call",
                "field": "name",
                "order": 9                
            }
       }
    }
}
```

* default order is 10.

Please make sure that your JSON data is correct after changes.
To take effect, clear a system cache (Administration > Clear Cache) and reload a page in your browser.

### Add click-to-call feature to a custom entity

To add a click-to-call feature to a custom entity you have to create/edit a file `/custom/Espo/Custom/Resources/metadata/entityDefs/<YOUR_ENTITY>.json`.

In this file should be defined a phoneNumber field (a field with "type": "phone"). Add the following line to this field:

```
{
    "fields": {
        "phoneNumber": {
            ......,
            "view": "voip:views/fields/phone"
        }
    }
}
```

Please make sure that your JSON data is correct after changes.

To take effect, clear a system cache (Administration > Clear Cache) and reload a page in your browser.

### Add custom entities to Quick Create Entities

To add some custom entities to Quick Create Entities, please create/modify the file `/custom/Espo/Custom/Resources/metadata/integrations/<CONNECTOR_NAME>.json` with the code:

(e.g. for Asterisk connector it's the file `/custom/Espo/Custom/Resources/metadata/integrations/Asterisk.json`)

```
{
    "fields": {
        "quickCreateEntities": {
            "options": [
                "__APPEND__",
                "<YOUR_CUSTOM_ENTITY>"
            ]
        }
    }
}
```

Please make sure that your JSON data is correct after changes.
To take effect, clear a system cache (Administration > Clear Cache) and reload a page in your browser.

### Format phone number

When a telephony server returns a phone number in a wrong format e.g. `004959123456789@SIP-PROVIDER-154303332258115083be1`. To get this number in a normal format, create/edit a file `custom/Espo/Custom/Resources/metadata/app/voip.json` and add the code:

```
{
    "phoneNumberReplacement": {
        "Asterisk": {
            "^goip-.*?\\/": "",
            "@SIP-PROVIDER.*": ""
        }
    }
}
```

where

* "Asterisk" - a connector ID;
* "@SIP-PROVIDER.\*" - regular expression to find unnecessary characters;
* "" - a string for replacing.

Note: JSON format has its own quoting, e.g. a symbol "/" should be quoted like "\\/".

Then go to Administrator panel > Clear cache.

### Additional info

**Dialout Channel** – channel format for outgoing calls.

It can be “SIP/###” or “PJSIP/###”, where ### is a user’s extension (internal number). The extension “###” will be substituted automatically depending on the user.