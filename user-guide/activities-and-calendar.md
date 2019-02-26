# Activities and Calendar

There are three types of activities available in EspoCRM by default: 

* Meetings;
* Calls;
* Tasks.

Administrator can create a custom entity of Event type. Then at Administration > Settings > Activities it's possible to set this entity type as an Activity and make it available in Calendar.

There is 'My Activities' dashlet showing actual and upcoming activity records related to the current user.

Accounts, Contacts, Leads, Opportunities, Cases have the Activities panel on the detail view. Custom entities of Base Plus type have the Activities panel as well.

## Meetings, Calls

### Attendees

There are 3 types of attendees supported: Users, Contacts, Leads. For each attendee it's possible to specify acceptance status: Accepted, Tentative, Declined. There is an ability to send invitation emails to attendees by clicking the button in the top-right corner. Attendees will be able to set their acceptance status by clicking on a corresponding link in the email.

### Reminders

There are two types of reminders: Popup (in-app message) and Email.

### Default duration

Default duration can be changed by administrator at Administration > Entity Manager > Meetings / Calls > Fields > Duration > Default. It must be specified in seconds.

## Tasks

Date Start and Date Due fields are not required. Dates can be specified with or without time parts.

### Reminders

Reminders for the task record will be available only if Date Due is specified and it has time part.

## Calendar

Calendar displays Meetings, Calls, Tasks. It's also possible to show custom entities of Event type.

Supported views:

* Month;
* Week;
* Day;
* Timeline.

Users can add Calendar on their dashboard.

It's possible to view calendar of another user (is you have an access determined by roles). Calendar button is available on the user's detail view.

### Refreshing calendar

To refresh calendar items you can click on the date range title at the top in the center.

### Shared Calendar

Shared calendar is available since the version 5.2.0.

Users can create custom shared views that will display events of specific teams.

Note: User must have a proper 'User Permission' to be able to use shared calendars.

Shared view is also available for Timeline. It allows to view events of multiple users.

### Custom entities on Calendar

Administrator can create a custom entity of Event type. Then at Administration > Settings > Activities it's possible to set this entity type as an Activity and make it available in Calendar.

By default Assigned User field determines a user who will the record on his/her Calendar. There is a possibility to have [multiple assigned users](../administration/multiple-assigned-users.md).
