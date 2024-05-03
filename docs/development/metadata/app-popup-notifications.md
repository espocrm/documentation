# app > popupNotifications

Path: metadata > app > popupNotifications.

Popup notifications. A name => defs map.

Example:

```json
{
    "event": {
        "grouped": true,
        "providerClassName": "Espo\\Modules\\Crm\\Tools\\Activities\\PopupNotificationsProvider",
        "useWebSocket": true,
        "portalDisabled": true,
        "view": "crm:views/meeting/popup-notification"
    }
}
```

## grouped

*boolean*

*As of v7.3.*

Grouped popup notifications are fetched with a single API request.

## providerClassName

*class-string<Espo\Tools\PopupNotification\Provider\>*

*As of v7.3.*

A provider class. Actual only if the *grouped* parameter is set to true.

## useWebSocket

*boolean*

If WebSocket is configured and the parameter is set to true, notifications won't be polled in the front-end (except once, when the page is loaded). A topic 'popupNotifications.{name}' should be submitted with *Espo\Core\WebSocket\Submission*.

## disabled

*boolean*

Disables.

## portalDisabled

*boolean*

Disables in portals.

## view

*string*

A view for the popup notification.

## interval

*int*

A polling interval in seconds. Actual if *grouped* is false.

## url

*string*

An API endpoint used for polling. Actual if *grouped* is false.
