# API Usage Tutorial

## In EspoCRM

1. Go to Administration > Roles and create a **new role** with permissions you want to grand for the API user.
  * Note: For versions below 5.9.0 it's recommended to set *Assignment Permission* to `all`.
2. Go to Administration > API Users and create a new API User. Select the created role. An **API Key** will be generated, you will need to use it in your API requests further.

## In external application

* [PHP](#php)
* [Javascript (Nodejs)](#javascript-nodejs)
* [Python](#python)

### PHP

1. Create a new PHP file: `EspoApiClient.php` with the code copied from [here](api-client-php.md#class).
2. Include this file in the place where you want to call EspoCRM API and use it. See the code below.

```php
<?php

require_once('EspoApiClient.php');

$url = 'https://address-of-your-espocrm';
$apiKey = 'copy API key from API user to here';

$client = new EspoApiClient($url);
$client->setApiKey($apiKey);

// example creating a new lead
try {
    $response = $client->request('POST', 'Lead', [
        'firstName' => 'Test',
        'lastName' => 'Hello',
    ]);
} catch (\Exception $e) {
    $errorCode = $e->getCode();
}
```

Check `data/logs` in your EspoCRM if something went wrong. See [error codes](api.md#error-codes).

### Javascript (Nodejs)

1. Create a new JS file: `espocrm-api-client.js` with the code copied from [here](api-client-js.md#module).
2. Use `require` function to include the module in the place where you want to call EspoCRM API and use it. See the code below.

```js
const Client = require('./espocrm-api-client');

const client = new Client(
    'https://address-of-your-espocrm',
    'copy API key from API user to here'
);

// POST request example
var payload = {
    name: 'some name',
    type: 'Customer',
};

client
    .request('POST', 'Account', payload)
    .then(
        (response) => {
            // success
            console.log(response);
        }
    )
    .catch(
        (res) => {
            // error
            console.log(res.statusCode, res.statusMessage);
        }
    );
```


Check `data/logs` in your EspoCRM if something went wrong. See [error codes](api.md#error-codes).

### Python

1. Create a new file: `espocrm-api-client.py` with the code copied from [here](api-client-python.md#class).
2. Install *requests* package with the command: `pip install requests`.
3. Use the client. See the code:

```python
from espo_api_client import EspoAPI

client = EspoAPI('https://address-of-your-espocrm', 'paste_api_key_here')

params = {
    "select": "id,phoneNumber",
    "where": [
        {
            "type": "equals",
            "attribute": "emailAddress",
            "value": 'some@email.com',
        },
    ],
}

result = client.request('GET', 'Lead', params)
```
