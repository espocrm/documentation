# Webhooks

Webhooks allow other applications to subscribe to specific events happening in EspoCRM and receive data related to those events. Webhooks are supposed to be created via API by other applications. The webhook has a specific *Event* and *URL*. Every time the event occurs, the system will send POST request with some payload to the specified URL.

Webhooks can be created only by API Users (via API request) and Administrators. API User has to have *Webhooks* scope enabled in *Roles*. API User has also to have access to all entity types for which webhooks are planned to be created.

* [Subscription](#subscription)
* [Events](#events)
* [Webhook requests](#webhook-requests)
* [Error handling](#error-handling)
* [Signature checking](#signature-checking)
* [Config parameters](#config-parameters)
* [Debugging](#debugging)

## Subscription

### Creating request

`POST api/v1/Webhook`

```json
{
    "event": "EVENT",
    "url": "URL"
}
```

Webhook ID (*id*), secret key (*secretKey*) will be sent back in a response.


### Deleting request

`DELETE api/v1/Webhook/WEBHOOK_ID`

```json
{
    "event": "EVENT",
    "url": "URL"
}
```

### Administration

Administrator can manage webhooks at Administration > Webhooks. It's possible to remove, edit or create webhooks there.

## Events

!!! note

    The list of available entity types can be obtained at Administration > Entity Manager.

### ENTITY_TYPE.create

Triggered when a record is created. All record attributes will be sent in payload.

Example: `Account.create`

### ENTITY_TYPE.update

Triggered when a record is updated. Only updated record attributes will be sent in payload.

Example: `Account.update`

### ENTITY_TYPE.delete

Triggered when a record is removed.

Example: `Account.delete`

### ENTITY_TYPE.fieldUpdate.FIELD

Triggered when a specific field is updated. New field attributes will be sent in payload.

Example: `Account.fieldUpdate.assignedUserId`

!!! note

    The list of available fields can be obtained at Administration > Entity Manager > fields.


## Webhook requests

Every webhook request (sent by EspoCRM to a specified URL) is of POST type. A content type is *application/json*.

Events related to the same hook are sent in batches. Request payload is always an array (even if only one record is sent).

One event occurred:

```json
[
    {
        "id": "someId",
        "name": "some name"
    }
]
```

Multiple events occurred:

```json
[
    {
        "id": "someId1",
        "name": "some name 1"
    },
    {
        "id": "someId2",
        "name": "some name 2"
    }
]
```

Request sending is processed by a scheduled job *Process Webhook Queue* (Administration > Scheduled Jobs). By default, it runs every 5 minutes. You can change the scheduling.

## Error handling

When EspoCRM is trying to send a webhook request and an error occurs, EspoCRM will process it in the following ways:

* errors 400, 401, 403, 404, 405, 408, connection timed out, or connection failed - will try to make another attempt;
* error 410 - hook will be removed immediately.

## Signature checking

It's possible to check the authenticity of a webhook request by comparing a signature passed in *X-Signature* header with a value calculated on a server that receives the request.

Example for PHP:

```php
$signature = base64_encode($webhookId . ':' . hash_hmac('sha256', $payload, $secretKey, true));
```

* *webhookId* can be obtained from a response upon a webhook creation or at Admninistration > Webhooks;
* *secretKey* can be obtained from a response upon a webhook creation or at Admninistration > Webhooks;
* *payload* is a payload of a request


## Config parameters

Can be set manually in `data/config.php`

*webhookMaxCountPerUse*r = 50

*webhookQueueEventPortionSize* = 20

*webhookQueuePortionSize* = 20

*webhookBatchSize* = 50

*webhookMaxAttemptNumber* = 4

*webhookFailAttemptPeriod* = '10 minutes'

*webhookConnectTimeout* = 5 (seconds)

*webhookTimeout* = 10 (seconds)

## Debugging

Queues are stored in two database tables: `webhook_queue_item` and `webhook_event_queue_item`.

You can enable [debug mode](troubleshooting.md#debug-mode) to see more details in the log.
