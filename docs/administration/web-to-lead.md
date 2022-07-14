# Web-to-Lead

## Lead Capture

By utilizing the Lead Capture feature administrator can create an entry point for capturing leads through API. Follow Administration > Lead Capture to create the entry point.

Parameters:

* Subscribe to Target List – a created lead will be added to a specified target list;
* Subscribe Contact if exists – if a contact with the same email exists, then the contact will be added to the target list;
* Target Team – a team created leads will be assigned to;
* Campaign – statistics will be available in the log of a selected campaign record;
* Payload Fields – what fields need to be sent in payload (from the web form to the API entry point).

### Double Opt-in (confirmed opt-in)

If double opt-in is enabled, then your subscribers will need to confirm their intention to opt-in by clicking on a link in an email. The email will be sent automatically once data is received through API.

Create Email Template that will be used for a double opt-in. You can use following placeholders in a template body:

* `{optInUrl}` - confirmation URL;
* `{optInLink}` - confirmation link;
* `{optInDate}` - date when a subscription request was submitted (as of v5.6.10);
* `{optInTime}` - time when a subscription request was submitted (as of v5.6.10);
* `{optInDateTime}` - date and time when a subscription request was submitted (as of v5.6.10).

A confirmation link will be added automatically if you haven’t inserted a placeholder in the email template.

## Posting API request

Your web site needs to make a POST request to send the form data to your CRM. A request **doesn't require any authorization**. You just need to use a specific URL with an API Key. The information about the request is available in the side panel on Lead Capture detail view.

Required headers:

* Content-Type: application/json
* Accept: application/json


### PHP

You can use [API client for PHP](../development/api-client-php.md).

Example:

```php
<?php

require_once('EspoApiClient.php');

$client = new EspoApiClient('https://URL_OF_YOUR_CRM');

$apiKey = 'f1b04885f28ee1a6d55dd203daed68f9'; // specify your API key here

$formData = [
    'firstName' => $_POST['firstName'],
    'lastName' => $_POST['lastName'],
    'emailAddress' => $_POST['emailAddress'],
];

$client->request('POST', 'LeadCapture/' . $apiKey, $formData);

```

### Python

[API client in Python](../development/api-client-python.md)

### Directly by a web browser

Example:

```html
<div id="web-to-lead-form-container">
    <form id="web-to-lead-form">
        <div>
            <input type="text" name="firstName" placeholder="First Name">
        </div>
        <div>
            <input type="text" name="lastName" placeholder="Last Name" required>
        </div>
        <div>
            <input type="email" name="emailAddress" placeholder="Email Address" required>
        </div>
        <div>
            <button type="submit" name="submit">Submit</button>
        </div>
    </form>
</div>

<script type="text/javascript">
    let webToLeadFormElement = document.getElementById('web-to-lead-form');
    let webToLeadFormIsSubmitted = false;

    webToLeadFormElement.addEventListener('submit', event => {
        event.preventDefault();

        if (webToLeadFormIsSubmitted) {
            return;
        }

        webToLeadFormIsSubmitted = true;
        webToLeadFormElement.submit.setAttribute('disabled', 'disabled');

        let payloadData = {
            firstName: webToLeadFormElement.firstName.value,
            lastName: webToLeadFormElement.lastName.value,
            emailAddress: webToLeadFormElement.emailAddress.value,
        };

        // A needed URL can be found on the Lead Capture detail view.
        let url = 'https://URL_OF_YOUR_CRM/api/v1/LeadCapture/API_KEY';

        let xhr = new XMLHttpRequest();
    
        xhr.open('POST', url, true);
    
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.setRequestHeader('Accept', 'application/json');
    
        xhr.onreadystatechange = () => {
            if (this.readyState == XMLHttpRequest.DONE && this.status == 200) {
                let containerElement = document.getElementById('web-to-lead-form-container');
    
                containerElement.innerHTML = 'Sent';
            }
        };
    
        xhr.onerror = () => {
            webToLeadFormElement.submit.removeAttribute('disabled');
            webToLeadFormIsSubmitted = false;
        };
    
        xhr.send(JSON.stringify(payloadData));
    });
</script>
```

The `Access-Control-Allow-Origin` header (see [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)) can be set in `data/config.php` with the parameter `leadCaptureAllowOrigin`. The default value is `*`.

```
    'leadCaptureAllowOrigin' => '*',
```

## Lead assignment distribution

By utilizing [Workflows](workflows.md) or [BPM tool](bpm.md), you can create an assignment rule that will distribute leads among team users. There are Round-Robin and Least-Busy rules available.

To apply the rule for only leads coming through the entry point, you can use a condition checking Campaign field.


## Hooks

It's possible to catch a lead capture event with built-in [hooks](../development/hooks.md#additional-default-hooks). Requires coding.

## See also

* [Drip Email Campaign with BPM](bpm-drip-email-campaign.md)
