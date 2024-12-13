# Activities & Calendar

There are three types of activities available in EspoCRM by default:

* Meetings
* Calls
* Tasks

An administrator can create a custom entity type of an *Event* type. Then, at Administration > Settings > Activities, it's possible to set this entity type as an *Activity* and make it available in the *Calendar*.

The *My Activities* dashlet displays current and upcoming activity records associated with the current user.

Accounts, Contacts, Leads, Opportunities, and Cases have the Activities panel on the detail view. Custom entity type of the *Base Plus* type have the Activities panel as well.

In this article:

* [Meetings & Calls](#meetings-calls)
* [Tasks](#tasks)
* [Calendar](#calendar)

## Meetings & Calls

### Attendees

There are 3 types of attendees: Users, Contacts, and Leads. For each attendee, it's possible to specify acceptance status: Accepted, Tentative or Declined.

There is the ability to send **invitation emails** to attendees by clicking the button in the top-right corner. Attendees will be able to set their acceptance status by clicking on a corresponding link in the email. The template for invitation emails can be changed at Administration > Template Manager > Invitation.

When an event has status *Not Held*, it's possible to send a cancellation email to attendees. It can be done from the top-right menu on the Meeting (or Call) detail view.

### Reminders

There are two types of reminders: Popup and Email. Reminders will be applied to an *Assigned User* and users specified in the *Users* field.

### Default duration

Default duration can be changed by the administrator at Administration > Entity Manager > Meetings / Calls > Fields > Duration > Default. It must be specified in seconds.

## Tasks

The Date Start and Date Due fields are not required. Dates can be specified with or without time parts.

### Reminders

*Reminders* field is hidden if the *Date Due* field is empty. It will show up once it's filled in.

### Scheduler

The scheduler panel provides the ability to view free & busy time ranges for user attendees when creting or editing an event. Available for Meetings, Calls, and custom entities of the Event type.

The scheduler panel can be added or removed at Administration > Entity Manager > Layouts > {Entity Type} > Bottom Panels.

Which entity types will be taken into account when showing busy time ranges can be configured at Administration > Settings > Free/Busy Entity List.

## Calendar

Calendar displays Meetings, Calls, and Tasks. It's also possible to show custom entities of the Event type.

Supported views:

* Month
* Week
* Day
* Timeline

Users can also add the Calendar to their dashboard.

It's possible to view the calendar of another user (is you have an access determined by Roles). The *Calendar* button is available on the user's detail view.

### Refreshing calendar

To refresh calendar items, you can click on the date range title at the top in the center.

### Shared calendar

Users can create custom shared views that will display events of specific teams.

!!! note

    A user must have a proper *User Permission* set in [Roles](../administration/roles-management.md) to be able to use shared calendars. Set the permission to *team* or *all* to enable.

!!! note

    The Shared view displays events of users of a selected team. It doesn't necessary display events assigned to that team (e.g. event is assigned to the team, but doesn't assigned to any user of that team).

The Shared view is also available for the *Timeline* view. It allows to view events of multiple users.

### Custom entities on calendar

An administrator can create a custom entity of the Event type. Then, at Administration > Settings > Activities, it's possible to set this entity type as an Activity and make it available in Calendar.

For custom entities, by default, the *Assigned User* field determines a user who will see the record on they Calendar. There is the ability to have [multiple assigned users](../administration/multiple-assigned-users.md).

## See also

* [Working time calendar](working-time-calendar.md)
* [How to manage your calendar](https://www.espocrm.com/tips/calendar/)
