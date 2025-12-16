# Monkey patching

[Monkey patching](https://en.wikipedia.org/wiki/Monkey_patch) allows to dynamically extend any frontend class.


!!! warning

    Monkey patching is not considered an upgrade-safe method and should be used as a last resort.

1\. Define the JS file that will be loaded with the Espo page.

Create `custom/Espo/Custom/Resources/metadata/app/client.json`:

```json
{
    "scriptList": [
        "__APPEND__",
        "client/custom/my-patch.js"
    ],
    "developerModeScriptList": [
        "__APPEND__",
        "client/custom/my-patch.js"
    ]
}
```

Note that *developerModeScriptList* is only needed when you use the developer mode.

After that, clear cache.

2\. Create a patching JS file.

Create `client/custom/my-patch.js`:

```js
/**
 *  In this example, we extend the login view.
 */
require(['views/login'], View => {

    const defaultAfterRender = View.prototype.afterRender;

    // Extending the `afterRender` method.
    View.prototype.afterRender = function () {
        defaultAfterRender.call(this);

        // Custom code here.
        console.log("Custom login view is rendered.");
    };
});
```

Note that you can patch multiple classes in one file.
