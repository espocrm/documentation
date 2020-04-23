# Confirmation dialog

Showing a confirmation modal dialog to a user before doing some actions.

Available in views.

```js
    this.confirm({
        message: this.translate('someMessageName', 'messages'),
        confirmText: this.translate('Confirm'), // text of the confirmation button
    }).then(
        function () {
            // here do some actions
        }.bind(this)
    );
```
