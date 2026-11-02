---
search:
  boost: 2
---

# Notifications

EspoCRM notifies users about events relevant to them. Notifications are delivered in-app (the bell icon on the navbar) and, optionally, by email.

### In-app notifications

Users receive in-app notifications about:

* new Stream entries (posts, status updates, received emails, etc.) in records they [follow](../user-guide/stream.md);
* being assigned to a record;
* mentions in posts;
* posts addressed to them;
* reactions to their posts;
* being added as an attendee or a collaborator.

By default, the application checks for new notifications using a polling method.
If [WebSocket](../administration/websocket.md) is enabled, notifications are delivered instantly.

### Email notifications

Users can receive email notifications about:

* being assigned to a record;
* mentions in posts;
* posts in records they follow;
* status updates in records they follow;
* emails received in records they follow;
* posts addressed to them.

Email notifications are disabled by default. An administrator needs to [enable](#email-notifications) them,
and users can opt out in their [preferences](#preferences). Notifications about followed records are sent only for the entity types specified by the administrator (by default, only Cases).

### Popup notifications

Popup notifications are notifications that appear in the bottom-right corner of the screen, on top of the page.
Unlike regular notifications, they are not listed under the bell icon. They are intended for messages that require the user's immediate attention.

A popup notification stays on the screen until the user closes it. It can also be collapsed and expanded later.
Closing a popup notification in one browser tab closes it in other tabs as well.

If the *Notification Sound* parameter is checked in Preferences, a sound is played when a popup notification appears.

By default, the application checks for new popup notifications using a polling method.
If [WebSocket](../administration/websocket.md) is enabled, they are delivered instantly.

Developers can add custom popup notification [types](../development/metadata/app-popup-notifications.md).

#### Reminders

Out of the box, popup notifications are used for [reminders](../user-guide/activities-and-calendar.md#reminders)
about Meetings, Calls and Tasks, as well as records of custom entity types of the *Event* type. A popup notification is shown when a reminder of the *Popup* type is due.

## Administration

Notification settings are available at Administration > Notifications.

### In-app notifications

* *Entities to notify about upon assignment* – entity types for which users receive
an in-app notification when a record is assigned to them.
Only entity types without the Stream are available here.
For entity types with the Stream enabled, assignment notifications are delivered as Stream notifications.
Default: Meetings, Calls, Emails.
* *Display new notification number in page title* – the number of new notifications will be displayed
in the browser tab title.

### Email notifications

* *Notifications upon assignment* – send email to a user when a record is assigned to them.
* *Assignment email notifications scopes* – entity types to send assignment emails for.
* *Send email notifications about mentions in posts*
* *Notifications about updates in Stream for internal users*
* *Notifications about updates in Stream for portal users*
* *Stream email notifications scopes* – users receive email notifications about Stream updates
only in followed records of the specified entity types. Default: Cases.
* *What to notify about* – Stream note types to send emails about: Posts, Status updates, Received emails.
* *Delay of email notifications (in seconds)* – a post can be edited within this timeframe
before the notification is sent. Default: 30.

!!! note

    Email notifications require the [system email account](../administration/emails.md#system-email-account) and [cron](../administration/server-configuration.md#setting-up-crontab) to be configured.

### Admin notifications

* *System notifications in administration panel* – displays notifications on the Administration page, e.g.
when scheduled jobs are not running.
* *Show notification when new EspoCRM version is available*
* *Show notification when new versions of extensions are available*

## Preferences

Users can configure notifications on the *Notifications* tab in their Preferences (the menu in the top-right corner > Preferences). An administrator can edit preferences of a specific user from the user's detail view.

* *Email notifications upon assignment* – available if enabled by the administrator.
* *Email assignment notifications* – entity types to receive assignment emails for. Unchecked entity types are ignored.
* *Email notifications about mentions in posts* – available if enabled by the administrator.
* *Email notifications about posts and status updates* – available if enabled by the administrator.
* *In-app assignment notifications* – entity types to receive in-app assignment notifications for. Unchecked entity types are ignored.
* *In-app notifications about reactions* – notifications when someone reacts to the user's post.
* *Notifications about reactions for non-followed records* – if not checked, the user won't be notified about reactions to their posts in records they don't follow.
* *Group notifications* – enables [grouping](#grouping). Checked by default.
* *Notification Sound* – plays a sound when a new notification arrives.

Which records a user receives Stream notifications about depends on the records they follow.
Auto-follow parameters are available on the *General* tab of Preferences.

## Grouping

*As of v10.0.*

When grouping is enabled, notifications are combined into groups:

* Notifications about Stream updates are grouped by the record. 
The group also includes notifications about reactions, additions to attendees and to collaborators in that record.
* Notifications about received emails are combined into a single group.
* Other notifications are not grouped.

The new notification counter on the bell icon counts groups rather than individual notifications.
For example, 10 updates in the same Account record will be counted as 1 new notification. A group displays the number of new entries in it and can be expanded to view every single notification.
If a group contains an update about the record being assigned to the user, it is marked with the *Assigned* label.

Grouping is enabled by default. Each user can turn it off in their preferences with the *Group notifications* parameter.
