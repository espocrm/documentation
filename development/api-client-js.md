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

client.request('POST', 'Account', {name: 'some name'})
    .then(
        (response) => {
            console.log(response);
        }
    )
    .catch(
        (res) => {
            console.log(res.statusCode, res.statusMessage);
        }
    );

```


## Module

File `espocrm-api-client.js`:

```js

class Client {

    constructor (url, apiKey, secretKey, options) {
        this.url = url;
        this.apiKey = apiKey;
        this.secretKey = secretKey;

        if (this.url.substr(-1) == '/') {
            this.url = this.url.substr(0, -1);
        }

        this.urlPath = '/api/v1/';

        this.options = options || {};

        this.isHttps = url.toLowerCase().indexOf('https') === 0;
    }

    request (method, action, data) {
        method = method || 'GET';

        method = method.toUpperCase();

        let url = this._buildUrl(action);

        let headers = {};

        if (this.apiKey && this.secretKey) {
            let string = method + ' /' + action;

            let b2 = crypto
                .createHmac('sha256', this.secretKey)
                .update(string)
                .digest();

            let b1 = Buffer.from(this.apiKey + ':');

            let authPart = Buffer.concat([b1, b2]).toString('base64');

            console.log(authPart);

            headers['X-Hmac-Authorization'] = authPart;

        } else if (this.apiKey) {
            headers['X-Api-Key'] = this.apiKey;
        } else {
            throw new Error('Api-Key is not set.');
        }

        let postData;

        if (data) {
            if (method == 'GET') {
                const querystring = require('querystring');
                url += '?' + querystring.stringify(data);
            } else {
                postData = JSON.stringify(data);
                headers['Content-Type'] = 'application/json';
                headers['Content-Length'] = Buffer.byteLength(postData);
            }
        }

        return new Promise(
            function (resolve, reject) {
                let o = {
                    headers: headers,
                    method: method,
                };

                if (this.options.port) o.port = this.options.port;
                if (this.options.timeout) o.timeout = this.options.timeout;

                let h;
                if (this.isHttps) {
                    h = require('https');
                } else {
                    h = require('http');
                }

                const req = h.request(url, o, (res) => {
                    let data = '';
                    res.on('data', (chunk) => {
                        data += chunk;
                    });
                    res.on('end', () => {
                        if (res.statusCode < 200 || res.statusCode > 299) {
                            reject(res);
                            return;
                        }
                        try {
                            data = JSON.parse(data);
                        } catch (e) {
                            console.error(`Error: Could not parse response`);

                            reject({});
                            return;
                        }
                        resolve(data, res);
                    });
                });

                req.on('error', (e) => {
                    console.error(`Error: ${e.message}`);
                    reject(e);
                });


                if (data && method != 'GET') {
                    req.write(postData);
                }
                req.end();

            }.bind(this)
        );
    }

    _buildUrl (action) {
        return this.url + this.urlPath + action;
    }
}

if (module && module.exports) module.exports = Client;

```
