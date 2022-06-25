# Ajax Requests

See the [source file](https://github.com/espocrm/espocrm/blob/master/client/src/ajax.js) with JSDoc for more info.

By default an API base path `api/v1` is prepended to each request URL. 

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
  .catch(xhr => {});
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
* `[headers] {Object.<string,string>}` A request headers.
* `[dataType] {'xml'|'json'|'text'}` A data type.
* `[local] {boolean}` If true, the API URL won't be prepended.
