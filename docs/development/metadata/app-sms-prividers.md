# app > smsProviders

Path: metadata > app > smsProviders.

SMS providers. A name => defs map.

Example:

```json
{
    "Twilio": {
        "senderClassName": "Espo\\Modules\\SmsProviders\\Twilio\\TwilioSender"
    }
}
```

## senderClassName

*class-string<Espo\Core\Sms\Sender>*

A sender class.
