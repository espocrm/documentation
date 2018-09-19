# Web-to-Lead

## Lead Capture

Note: Available since 5.4.0 version.

By utilizing Lead Capture feature administrator can create an entry point for capturing leads through API. Create an entry point at Administration > Lead Capture.

* Subscribe to Target List - Created lead will be added to a specified target list;
* Subscribe Contact if exists - If a contact with the same email exists then contact will be added to the target list;
* Target Team - A team to assign a created lead to;
* Campaign - Statystics will be avilable in a campaign log;
* Payload Fields - Select what fields need to be passsed.

### Double Opt-in (confirmed opt-in)

If double opt-in is enabled then your subscribers will need to confirm their intention to opt-in by clicking on a link in an email. The email will be send automatically once data is received through API.

Create Email Template that will be used for a double opt-in. You can use following placeholders in a template body:

* `{optInUrl}` - confirmation URL;
* `{optInLink}` - confirmation link.

A confirmation link will be added automatically if you didn't insert a placeholder in the email template.

## Posting API request

Your web site need to make a POST request to send form data to you CRM. A request doesn't require any authorization. You just need to use a specific URL with an API Key. Infomation about request is available in the side panel on Lead Capture detail view.

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
    'emailAddress' => $_POST['emailAddress']
];

$client->request('POST', 'LeadCapture/' . $apiKey, $formData);

```

### Python

[API client in Python](../development/api-client-python.md)

### Directly by a web browser


Expample:

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
    var webToLeadFormElement = document.getElementById('web-to-lead-form');
    var webToLeadFormIsSubmitted = false;

    webToLeadFormElement.addEventListener('submit', function (event) {
        event.preventDefault();
        if (webToLeadFormIsSubmitted) return;
        webToLeadFormIsSubmitted = true;
        webToLeadFormElement.submit.setAttribute('disabled', 'disabled');

        var payloadData = {
            firstName: webToLeadFormElement.firstName.value,
            lastName: webToLeadFormElement.lastName.value,
            emailAddress: webToLeadFormElement.emailAddress.value
        };

        var url = 'https://URL_OF_YOUR_CRM/api/v1/LeadCapture/API_KEY';

        var xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.setRequestHeader('Accept', 'application/json');
        xhr.onreadystatechange = function() {
            if (this.readyState == XMLHttpRequest.DONE && this.status == 200) {
                var containerElement  = document.getElementById('web-to-lead-form-container');
                containerElement.innerHTML = 'Sent';
            }
        }
        xhr.onerror = function() {
            webToLeadFormElement.submit.removeAttribute('disabled');
            webToLeadFormIsSubmitted = false;
        }
        xhr.send(JSON.stringify(payloadData));
    });
</script>
```

'Access-Control-Allow-Origin' header can be set in data/config.php with the parameter `leadCaptureAllowOrigin`.

## Lead assignment distribution

By utilizing [Workflows](workflows.md) or [BPM tool](bpm.md) you can create an assignment rule that will distribute leads among team users. There are Round-Robin and Least-Busy rules available.

To apply the rule for only leads coming through the entry point you can use a condition checking Campaign field.
