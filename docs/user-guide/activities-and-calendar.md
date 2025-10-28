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

#### Invitations

There is the ability to send **invitation emails** to attendees by clicking the button in the top-right corner. Attendees will be able to set their acceptance status by clicking on a corresponding link in the email. 

When an event has status *Not Held*, it's possible to send a cancellation email to attendees. It can be done from the top-right menu on the Meeting (or Call) detail view.

The template for invitation emails can be changed at Administration > Template Manager > Invitation.

Available template placeholders and data values:

* `inviteeName` – a name of the recipient;
* `recordUrl` – a URL to the Espo meeting record;
* `acceptLink` – a URL to accept the meeting;
* `declineLink` – a URL to decline the meeting;
* `tentativeLink` – a URL to set as tentative;
* `entityType` – a translated entity type (Meeting or Call);
* `entityTypeLowerFirst` – a translated entity type starting with a lower case letter (meeting or call);
* `isUser` – whether the recipient is a User, a boolean value;
* `dateStartFull` – a meeting start date/time in full format (as of v9.0);
* `timeZone` – a time zone name applied to date-time placeholder values (as of v9.0).

You can also use Meeting's (or Call's) fields as placeholders.

### Reminders

There are two types of reminders: Popup and Email. Reminders specified on the form will be applied to the current user, assuming this used is a participant. Other participant will have their default reminders automatically applied.

!!! note

    When creating a Meeting or Call, only the reminder options that will occur in the future are listed. For example, if you create a meeting scheduled to occur in 15 minutes, you won't be able to set a reminder for '1 hour before'. This option won't be available in the list. If you change the Date Start to a later time, the option will appear.

Arbitrary period values can entered in the reminder field by typing a number.

### Default duration

Default duration can be changed by the administrator at Administration > Entity Manager > Meetings / Calls > Fields > Duration > Default. It must be specified in seconds.

### Default date

For the Meeting and custom Event entity types, by default, the default values for Date Start and Date End are set to 'now'. You can change it to 'today' (meaning the event will be set as All-Day by default). For this, in the Entity Manager, do the following:

1. Set the default values for the Date Start and Date End fields to 'None'.
2. Set the default values for the Date Start (all day) and Date End (all day) fields to 'Today'.
3. Set the default value for the Duration field to 86400.
4. Set the default value for the Is All-Day field to true (check the checkbox).

### Scheduler

The scheduler panel provides the ability to view free & busy time ranges for user attendees when creating or editing an event. Available for Meetings, Calls, and custom entities of the Event type.

The scheduler panel can be added or removed at Administration > Entity Manager > Layouts > {Entity Type} > Bottom Panels.

Which entity types will be taken into account when showing busy time ranges can be configured at Administration > Settings > Free/Busy Entity List.

## Tasks

The Date Start and Date Due fields are not required. Dates can be specified with or without time parts.

### Reminders

The *Reminders* field is hidden if the *Date Due* field is empty. It will show up once it's filled in.

!!! note

    When the Date Due does not have a time part, the end of the day will be used as the base time for a reminder.

Arbitrary period values can entered in the reminder field by typing a number.

### Collaborators

*As of v9.0.*

The collaborators feature can be enabled for Tasks at Administration > Entity Manager > Task > Edit.

Users added as collaborators to a Task will have read and stream access, provided their access level, as defined by Roles, is other than no.

When a user creates a Task, they will be automatically added as a collaborator, even if the Task is assigned to another user. The assignee becomes a collaborator too.

The list view filter *Shared* shows Tasks where the current user is a collaborator. The *My Activities* dashlet has a parameter *Include Shared*.

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
* [Meeting scheduler](../extensions/meeting-scheduler/index.md)
