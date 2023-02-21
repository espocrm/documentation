# API Client Implementation in PHP

Require [Espo Api Client](https://github.com/espocrm/php-espo-api-client) with Composer:

```
composer require espocrm/php-espo-api-client
```

### Usage

```php
use Espo\ApiClient\Client;

$client = new Client('https://your-espocrm-site');

$client->setApiKey('API_KEY');

$response = $client->request(Client::METHOD_POST, 'Lead', [
    'firstName' => 'Test',
    'lastName' => 'Hello',
]);

$response = $client->request(Client::METHOD_GET, 'Opportunity', [
    'maxSize' => 10,
    'select' => 'id,name,assignedUserId',
    'orderBy' => 'createdAt',
    'order' => 'desc',
    'primaryFilter' => 'open',
]);

$parsedBody = $response->getPasredBody();

$fileContentsResponse = $client->request(Client::METHOD_GET, "Attachment/file/{$attachmentId}")
    ->getBodyPart();
```

### Api Key Authentication

```php
$client = new Client('https://your-espocrm-site');
$client->setApiKey('API_KEY');
```

### HMAC Authentication

```php
$client = new Client('https://your-espocrm-site');
$client->setApiKey('API_KEY');
$client->setSecretKey('SECRET_KEY');
```
