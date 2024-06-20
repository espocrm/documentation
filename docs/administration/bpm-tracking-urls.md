# Tracking URLs with BPM

## Non-unique URL

*Available as of Advanced Pack 2.4.6 and EspoCRM 5.7.12.*

It's possible to add links into email body and catch when a recipient clicked on it. It provides the ability to automate an interaction with customers.

A Tracking URL can be created at Campaigns > top-right menu > Tracking URLs. Create URL and obtain a generated placeholder (example: `{trackingUrl:5d8206aa9d76df4c8}`). Use that placeholder as a URL of the link in your email template.

Further in the process flow, you will be able to catch a URL click with *Signal Intermediate Event (Catching)*.

Signal that is broadcasted once the tracking URL with id 'TRACKING_URL_ID' is clicked by a person represented in the system as the entity of 'ENTITY_TYPE' with id 'ID' will be: `clickUrl.ENTITY_TYPE.ID.TRACKING_URL_ID`. See example below.

Process flowchart example:

![BPM Tracking URL](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/tracking-urls.png)

In this example, target entity type is *Lead*.

Signal name, defined in catching event: `clickUrl.Lead.{$id}.5d8206aa9d76df4c8`, where `5d8206aa9d76df4c8` is an ID of *Tracking URL* (can be obtained from the address bar). You need to replace *5d8206aa9d76df4c8* with your ID. `{$id}` is a placeholder that will be automatically replaced with ID of the Lead.

### Example

You can get a downloadable example [here](bpm-examples.md#downloadable-examples).

## Unique URL

*Available as of Advanced Pack 2.7.0 and EspoCRM 6.1.3.*

Useful when an URL must be unique for a specific process. E.g. send an email for a feedback on provided customer support, the email contains unique links to rate quality of support.

A **signal**  `clickUniqueUrl.UNIQUE_ID` will be broadcasted when URL is opened by a recipient, where *UNIQUE_ID* will be a generated ID.

Use code `{trackingUrl:TRACKING_URL_ID.{$$variableName}}` in an **email template** instead of a URL: , where *variableName* is a name of the variable where generated ID is stored, *TRACKING_URL_ID* is an ID of the Tracking URL record (can be obtained from the address bar). The code will be automatically substituted with a proper URL when email is sent.

Steps:

1\. Create Tracking URL at Campaigns > top-right menu > Tracking URLs.


2\. In BPM: Use an *Execute Formula Script* action or *Script Task* to generate a unique and store it to a variable:

```
$uniqueId = util\generateId();
```

3\. In BPM: Add a *Send Message* task. Use an email template with a link `{trackingUrl:TRACKING_URL_ID.{$$uniqueId}}`. Replace `TRACKING_URL_ID` with the ID of the *Tracking URL* record. This link is supposed to be clicked by a recipient.

4\. In BPM: Use a *Signal Catching* event with the signal `clickUniqueUrl.{$$uniqueId}`.
