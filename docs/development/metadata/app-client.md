# app > client

Path: metadata > app > client.

General definitions for the front-end client.

## scriptList

*string[]*

JS files to include on the HTML page. Use `__APPEND__` to append custom values w/o removing existing.

## developerModeScriptList

*string[]*

JS files to include on the HTML page in the developer mode. Use `__APPEND__` to append custom values w/o removing existing.

## linkList

*Object[]*

Example:

```json
{
    "linkList": [
        "__APPEND__",
        {
            "href": "client/custom/fonts/custom-font.woff2",
            "as": "font",
            "type": "font/woff2",
            "rel": "preload",
            "noTimestamp": true,
            "crossorigin": true
        }
    ]
}
```

Link tags to include on the HTML page. Use `__APPEND__` to append custom values w/o removing existing.

## cssList

*string[]*

CSS files to include on the HTML page. Use `__APPEND__` to append custom values w/o removing existing.

Example:

```json
{
    "cssList": [
        "__APPEND__",
        "path/to/your/file.css"
    ]
}
```

## favicon

*string*

A favicon image path. The default value: `client/img/favicon.ico`.

## favicon196

*string*

A big favicon image path. The default value: `client/img/favicon196x196.png`.
