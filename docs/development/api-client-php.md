# API Client Implementation in PHP

* [Usage](#usage)
* [Class](#class)

## Usage

```php
$client = new EspoApiClient('https://your-espocrm-site');

$client->setApiKey('API_KEY');

$response = $client->request('POST', 'Lead', [
    'firstName' => 'Test',
    'lastName' => 'Hello',
]);

$response = $client->request('GET', 'Opportunity', [
    'maxSize' => 10,
    'select' => 'id,name,assignedUserId',
    'orderBy' => 'createdAt',
    'order' => 'desc',
    'primaryFilter' => 'open',
]);

$fileContentsResponse = $client->request('GET', "Attachment/file/{$attachmentId}");
```

### Api Key Authentication

```php
$client = new EspoApiClient('https://your-espocrm-site');
$client->setApiKey('API_KEY');
```

### HMAC Authentication

```php
$client = new EspoApiClient('https://your-espocrm-site');
$client->setApiKey('API_KEY');
$client->setSecretKey('SECRET_KEY');
```

### Authentication with username and password

Note: Not recommended.

```php
$client = new EspoApiClient('https://your-espocrm-site', 'USERNAME', 'PASSWORD');
```


## Class

Copy this class into a separate PHP file and then include that file in your code.

```php
<?php

class EspoApiClient
{
    private $url;

    private $userName = null;

    private $password = null;

    protected $urlPath = '/api/v1/';

    private $lastCh;

    private $lastResponse;

    private $apiKey = null;

    private $secretKey = null;

    public function __construct($url = null, $userName = null, $password = null)
    {
        if (isset($url)) {
            $this->url = $url;
        }

        if (isset($userName)) {
            $this->userName = $userName;
        }

        if (isset($password)) {
            $this->password = $password;
        }
    }

    public function setUrl($url)
    {
        $this->url = $url;
    }

    public function setUserName($userName)
    {
        $this->userName = $userName;
    }

    public function setPassword($password)
    {
        $this->password = $password;
    }

    public function setApiKey($apiKey)
    {
        $this->apiKey = $apiKey;
    }

    public function setSecretKey($secretKey)
    {
        $this->secretKey = $secretKey;
    }

    /**
     * Send request to EspoCRM.
     *
     * @param string $method
     * @param string $action
     * @param array|null $data
     * @return array
     * @throws \Exception
     */
    public function request($method, $action, array $data = null)
    {
        $method = strtoupper($method);

        $this->checkParams();

        $this->lastResponse = null;
        $this->lastCh = null;

        $url = $this->normalizeUrl($action);

        $ch = curl_init($url);

        $headerList = [];

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

        if ($this->userName && $this->password) {
            curl_setopt($ch, CURLOPT_USERPWD, $this->userName.':'.$this->password);
            curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
        }
        else if ($this->apiKey && $this->secretKey) {
            $string = $method . ' /' . $action;
            $authPart = base64_encode($this->apiKey . ':' . hash_hmac('sha256', $string, $this->secretKey, true));
            $authHeader = 'X-Hmac-Authorization: ' .  $authPart;

            $headerList[] = $authHeader;
        }
        else if ($this->apiKey) {
            $authHeader = 'X-Api-Key: ' .  $this->apiKey;

            $headerList[] = $authHeader;
        }

        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_HEADER, true);

        if ($method != 'GET') {
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
        }

        if (isset($data)) {
            if ($method == 'GET') {
                curl_setopt($ch, CURLOPT_URL, $url. '?' . http_build_query($data));
            }
            else {
                $payload = json_encode($data);

                curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);

                $headerList[] = 'Content-Type: application/json';
                $headerList[] = 'Content-Length: ' . strlen($payload);
            }
        }

        if (!empty($headerList)) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headerList);
        }

        $this->lastResponse = curl_exec($ch);
        $this->lastCh = $ch;

        $parsedResponse = $this->parseResponce($this->lastResponse);
        $responseCode = $this->getResponseHttpCode();
        $responseContentType = $this->getResponseContentType();

        if ($responseCode == 200 && !empty($parsedResponse['body'])) {
            curl_close($ch);

            if ($responseContentType === 'application/json') {
                return json_decode($parsedResponse['body'], true);
            }

            if (substr($responseContentType, 0, 12) === "application/") {
                //echo $action;
                return $parsedResponse['body'];
            }

            return $parsedResponse['body'];
        }

        $header = $this->normalizeHeader($parsedResponse['header']);

        $errorMessage = !empty($header['X-Status-Reason']) ?
            $header['X-Status-Reason'] :
            'EspoClient: Unknown Error';

        curl_close($ch);

        throw new \Exception($errorMessage, $responseCode);
    }

    public function getResponseContentType()
    {
        return $this->getInfo(CURLINFO_CONTENT_TYPE);
    }

    public function getResponseTotalTime()
    {
        return $this->getInfo(CURLINFO_TOTAL_TIME);
    }

    public function getResponseHttpCode()
    {
        return $this->getInfo(CURLINFO_HTTP_CODE);
    }

    protected function normalizeUrl($action)
    {
        return $this->url . $this->urlPath . $action;
    }

    protected function checkParams()
    {
        $paramList = [
            'url',
        ];

        foreach ($paramList as $name) {
            if (empty($this->$name)) {
                throw new \Exception('EspoClient: Parameter "' . $name . '" is not defined.');
            }
        }

        return true;
    }

    protected function getInfo($option)
    {
        if (isset($this->lastCh)) {
            return curl_getinfo($this->lastCh, $option);
        }
    }

    protected function parseResponce($response)
    {
        $headerSize = $this->getInfo(CURLINFO_HEADER_SIZE);

        return [
            'header' => trim( substr($response, 0, $headerSize) ),
            'body' => substr($response, $headerSize),
        ];
    }

    protected function normalizeHeader($header)
    {
        preg_match_all('/(.*?): (.*)\r\n/', $header, $matches);

        $headerArray = [];

        foreach ($matches[1] as $index => $name) {
            if (isset($matches[2][$index])) {
                $headerArray[$name] = trim($matches[2][$index]);
            }
        }

        return $headerArray;
    }
}

```
