# API Client Implementation in PHP

```php
<?php

class EspoApiClient
{
    private $url;

    private $userName;

    private $password;

    protected $urlPath = '/api/v1/';

    protected $userAgent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.82 Safari/537.36';

    private $lastCh;

    private $lastResponse;

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

    /**
     * Send request to EspoCRM
     *
     * @param string $method
     * @param string $action
     * @param array|null $data
     *
     * @return array | \Exception
     */
    public function request($method, $action, array $data = null)
    {
        $this->checkParams();

        $this->lastResponse = null;
        $this->lastCh = null;

        $url = $this->normalizeUrl($action);

        $ch = curl_init($url);

        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_USERPWD, $this->userName.':'.$this->password);
        curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_USERAGENT, $this->userAgent);
        curl_setopt($ch, CURLOPT_HEADER, true);

        if (isset($data)) {
            if ($method == 'GET') {
                curl_setopt($ch, CURLOPT_URL, $url. '?' . http_build_query($data));
            } else {
                $payload = json_encode($data);
                curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
                curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                    'Content-Type: application/json',
                    'Content-Length: ' . strlen($payload))
                );
            }
        }

        $this->lastResponse = curl_exec($ch);
        $this->lastCh = $ch;

        $parsedResponse = $this->parseResponce($this->lastResponse);

        if ($this->getResponseHttpCode() == 200 && !empty($parsedResponse['body'])) {
            curl_close($ch);
            return json_decode($parsedResponse['body'], true);
        }

        $header = $this->normalizeHeader($parsedResponse['header']);
        $errorMessage = !empty($header['X-Status-Reason']) ? $header['X-Status-Reason'] : 'EspoClient: Unknown Error';

        curl_close($ch);
        throw new \Exception($errorMessage, $this->getResponseHttpCode());
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
        $paramList = array(
            'url',
            'userName',
            'password',
        );

        foreach ($paramList as $name) {
            if (empty($this->$name)) {
                throw new \Exception('EspoClient: Parameter "'.$name.'" is not defined.');
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

        return array(
            'header' => trim( substr($response, 0, $headerSize) ),
            'body' => substr($response, $headerSize),
        );
    }

    protected function normalizeHeader($header)
    {
        preg_match_all('/(.*): (.*)\r\n/', $header, $matches);

        $headerArray = array();
        foreach ($matches[1] as $index => $name) {
            if (isset($matches[2][$index])) {
                $headerArray[$name] = trim($matches[2][$index]);
            }
        }

        return $headerArray;
    }
}

```
