# Tracking URLs with BPM

*Available since since Advanced Pack 2.4.6 and EspoCRM 5.7.12.*

It's possible to add links into email body and catch when the recipient clicked on it. It provides the ability to automate an interraction with customers.

Tracking URL can be created at Campaigns > top-right menu > Tracking URLs. Create URL and obtain a generated placeholder (example: `{trackingUrl:5d8206aa9d76df4c8}`). Use that placeholder as a URL of the link in your email template.

Further in the process flow, you will be able to catch a click with *Signal Intermediate Event (Catching)*.

Process flowchart example:

![BPM Tracking URL](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/tracking-urls.png)

In this example, target entity type is *Lead*.

Signal name, defined in catching event: `clickUrl.Lead.{$id}.5d8206aa9d76df4c8`, where `5d8206aa9d76df4c8` is an ID of *Tracking URL* (can be obtained from the address bar). You need to replace *5d8206aa9d76df4c8* with your ID. `{$id}` is a placeholder that will be automatically replaced with ID of the Lead.
