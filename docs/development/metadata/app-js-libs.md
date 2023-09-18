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
    "some-umd-lib": {
        "path": "client/custom/modules/my-module/lib/some-umd-lib.js"
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
define('my-module-name', ['some-lib'], (SomeLib) => {});
```

```js
import MyLib from 'my-lib';
```

```js
Espo.loader.requirePromise('some-lib').then(SomeLib => {});
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

## exposeAs

*string*

If set, the lib will be exposed to the window object. A variable name the lib will be set to. To be used for backward compatibility reasons.

## aliases

*string[]*

Additional module IDs the lib will be available by. Can be useful for establishing backward compatibility or when another lib requires this lib by a different ID.
