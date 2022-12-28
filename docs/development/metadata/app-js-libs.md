# app > jsLibs

Path: metadata > app > jsLibs.

JS libraries definitions for the loader.

Example:

```json
{
    "some-lib": {
        "path": "client/custom/modules/my-module/lib/some-lib.js",
        "devPath": "client/custom/modules/my-module/lib/original/some-lib.js",
        "exportsTo": "window",
        "exportsAs": "LibObjectName",
        "sourceMap": false
    },
    "ace-ext-language_tools": {
        "path": "client/lib/ace-ext-language_tools.js",
        "exportsTo": "ace.require.define.modules",
        "exportsAs": "ace/ext/language_tools"
    },
    "some-jquery-lib": {
        "path": "client/custom/modules/my-module/lib/some-jquery-lib.js",
        "devPath": "client/custom/modules/my-module/lib/original/some-jquery-lib.js",
        "exportsTo": "$.fn",
        "exportsAs": "some-jquery-lib",
        "sourceMap": true
    }
}
```

Libs can be required in the front-end the following ways:

```js
define('my-module-name', ['lib!some-lib'], (SomeLib) => {});
```

```js
Espo.loader.requirePromise('lib!some-lib').then(SomeLib => {});
```

## path

*string*

A path to a lib file.

## devPath

*string*

A path to the lib file for the developer mode.

## exportsTo

*string*

To where the lib is exported. Use dots to define a path.

## exportsAs

*string*

A key name by which the lib is available in a containing object.

## sourceMap

*boolean*

Whether the source map file is available.
