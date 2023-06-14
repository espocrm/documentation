# Ajax Requests

*Espo.Ajax* object is used to make reqeusts to Espo API endpoints. See the [source file](https://github.com/espocrm/espocrm/blob/master/client/src/ajax.js) with JSDoc for more info. An API base path `api/v1` is prepended to each request URL. 

GET:

```js
Espo.Ajax.getRequest(url, data, options)
    .then(response => {})
    .catch(xhr => {});
```

POST:

```js
Espo.Ajax.postRequest(url, data, options)
    .then(response => {})
    .catch(xhr => {
        if (xhr.status === 403) {
            // Prevent error handling in the global handler.
            xhr.errorIsHandled = true;
            // Do something.
        }
    });
```

Example:

```js
Espo.Ajax.getRequest('MyController/action/getSomeDataById', {id: id})
    .then(response => {
        // A parsed response.
        console.log(response);
    });
```

## Request options

* `[timeout] {Number}` A timeout.
* `[headers] {Object.<string, string>}` A request headers.
* `[dataType] {'xml'|'json'|'text'}` A data type.
