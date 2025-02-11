# API Client Implementation in Javascript (Nodejs)

* [Usage](#usage)
* [Module](#module)

## Usage

```js

const Client = require('./espocrm-api-client');

const client = new Client(
    'https://your-espocrm-site',
    'API_KEY',
    'SECRET_KEY' // optional, if hmac auth is used
);

// POST example

const payload = {
    name: 'Some name',
};

client
    .request('POST', 'Account', payload)
    .then(response => {
        // success
        console.log(response);
    })
    .catch(response => {
        // error
        console.log(response.statusCode, response.statusMessage);
    });

// GET example

const params = {
    maxSize: 5,
    where: [
        {
            type: 'equals',
            attribute: 'type',
            value: 'Customer',
        },
    ],
    select: ['id', name'],
};

client
    .request('GET', 'Account', params)
    .then(response => {
        console.log(response);
    })
    .catch(response => {
        // error
        console.log(response.statusCode, response.statusMessage);
    });
```

## Module

File `espocrm-api-client.js`:

```js
class Client {

    constructor (url, apiKey, secretKey, options) {
        this.url = url;
        this.apiKey = apiKey;
        this.secretKey = secretKey;

        if (this.url.substr(-1) === '/') {
            this.url = this.url.substr(0, this.url.length -1);
        }

        this.options = options || {};

        this.urlPath = '/api/v1/';
        this.isHttps = url.toLowerCase().indexOf('https') === 0;
    }

    request (method, action, data) {
        method = method || 'GET';
        method = method.toUpperCase();

        let url = this._buildUrl(action);

        let headers = {};

        if (this.apiKey && this.secretKey) {
            let string = method + ' /' + action;

            const crypto = require('crypto');

            let b2 = crypto
                .createHmac('sha256', this.secretKey)
                .update(string)
                .digest();

            let b1 = Buffer.from(this.apiKey + ':');

            let authPart = Buffer.concat([b1, b2]).toString('base64');

            headers['X-Hmac-Authorization'] = authPart;
        }
        else if (this.apiKey) {
            headers['X-Api-Key'] = this.apiKey;
        }
        else {
            throw new Error('Api-Key is not set.');
        }

        let postData;

        if (data) {
            if (method === 'GET') {
                const querystring = require('querystring');

                url += '?' + querystring.stringify({searchParams: JSON.stringify(data)});
            }
            else {
                postData = JSON.stringify(data);

                headers['Content-Type'] = 'application/json';
                headers['Content-Length'] = Buffer.byteLength(postData);
            }
        }

        return new Promise((resolve, reject) => {
            let o = {
                headers: headers,
                method: method,
            };

            if (this.options.port) {
                o.port = this.options.port;
            }

            if (this.options.timeout) {
                o.timeout = this.options.timeout;
            }

            const h = this.isHttps ? require('https') : require('http');

            const req = h.request(url, o, res => {
                let data = '';

                res.on('data', chunk => {
                    data += chunk;
                });

                res.on('end', () => {
                    if (res.statusCode < 200 || res.statusCode > 299) {
                        reject(res);

                        return;
                    }

                    try {
                        data = JSON.parse(data);
                    }
                    catch (e) {
                        console.error(`Error: Could not parse response`);
                        reject({});

                        return;
                    }

                    resolve(data, res);
                });
            });

            req.on('error', e => {
                console.error(`Error: ${e.message}`);
                reject(e);
            });

            if (data && method !== 'GET') {
                req.write(postData);
            }

            req.end();
        });
    }

    _buildUrl (action) {
        return this.url + this.urlPath + action;
    }
}

if (module && module.exports) {
    module.exports = Client;
}

```
