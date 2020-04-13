# API Usage Tutorial

## In EspoCRM

1. Go to Admninistration > Roles and create a new role with permissions you want to grand for the API user.
2. Go to Administration > API Users and create a new API User. Select the created role. An **API Key** will be generated, you will need to use it in your API requests further.

## In external application

### PHP

1. Create a new PHP file: `EspoApiClient.php` with the code copied from [here](api-client-php.md#class).
2. Include this file in the place where you want to call EspoCRM API and use it. See the code below.

```php
<?php

require_once('EspoApiClient.php');

$url = 'https://address-of-your-espocrm';
$apiKey = 'copy key from API user here';

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
