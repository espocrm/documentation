# Meeting Scheduler

*Requires EspoCRM v9.0.*

Available in the [Meeting Scheduler](https://www.espocrm.com/extensions/meeting-scheduler/) extension.

With the Meeting Scheduler tool you can create online pages where contacts can book meetings with CRM users. Contacts can choose from time slots when the host is available. The scheduler configuration can help avoid meeting overload. You can also set up automated meeting distribution among multiple hosts.

In this article:

* [Access](#access)
* [General](#general)
* [Setting up](#setting-up)
* [Overrides](#overrides)
* [Questions](#questions)
* [One-time links](#one-time-links)
* [Requests](#requests)
* [Round-robin host distribution](#round-robin-host-distribution)
* [Zoom integration](#zoom-integration)
* [Microsoft Teams integration](#microsoft-teams-integration)

## Access

Access to Meeting Schedulers and Meeting Requests are controlled by roles.

An administrator can allow regular users to create and edit scheduler pages by setting needed access levels for the Meeting Scheduler scope.

There's a possible configuration where a Meeting Scheduler is managed by one user but requests are distributed to other users. To be able to access Meeting Requests where a user is a host, the user should have the Meeting Scheduler scope enabled. Setting the action levels for the scope is not required – they all can be set to 'no'.

The Meeting Scheduler Hosts scope allows users to configure schedulers that distribute meetings to other users.

## General

The system uses the parameter *Free/Busy Entity List* when determing busy time slots. This parameter is available under: Administration > Settings.

!!! note

    An attendee is required to fill in the email address when booking a meeting.

## Setting up

You can access the Meeting Schedulers list view from the navbar. There, you can create a new Meeting Scheduler.

It's also possible to access Meeting Schedulers from the Meeting's list view.

### General

#### Name

The name field will be used for meeting names and for the page title of the scheduling page.

#### Active

If a scheduler is not set as Active, the scheduling page will be unaccessible.

#### Date Start, Date End

The Date Start and Date End fields allow to set a period during which the scheduling page is functional.

#### Description

The description does not play any role other than of a description text for a user who view the scheduler.

### Setup

#### Meeting durations

Specify meeting duration options an invitee can pick from.

#### Meeting time precision

The granularity of time slots available for scheduling meetings.

#### Buffer time before meeting

The amount of time automatically reserved before a meeting starts to prevent back-to-back scheduling.

#### Buffer time after meeting

The amount of time automatically reserved after a meeting ends to prevent back-to-back scheduling.

#### Minimum lead time before meeting

The shortest amount of time that must pass between the moment a meeting is scheduled and its start time.

#### Scheduling window

How far in the future a meeting can be scheduled.

#### Daily limit

*As of v1.1.*

Maximum number of meetings that can be scheduled in a day. If more than the specified number are scheduled via the form, the day will be excluded from availability.

#### Require approval by host

A meeting won't be created until the request is approved by the host. The primary host can approve requests.

#### Do not require approval if Contact exists

If a meeting request is created by an invitee that already exists in the CRM as a Contact, then the approval step will be skipped. The email address is used to find a matching Contact.

#### Do not reserve if unapproved

If checked, then while a request is created but still is unapproved, it won't affect the host's availability. Multiple requests on the same time slots are possible in this case.

#### Require confirmation by invitee

A meeting won't be created until the request is confirmed by the invitee. The invitee will receive an email asking for confirmation. They can also cancel the request from the email.

#### Do not require approval if Contact exists

If a meeting request is created by an invitee that already exists in the CRM as a Contact, then the confirmation step will be skipped. The email address is used to find a matching Contact.

#### Do not reserve if unconfirmed

If checked, then while a request is created but still is unconfirmed, it won't affect the host's availability. Multiple requests on the same time slots are possible in this case.

#### Confirmation window

A period during which the invitee can confirm the request. After its expiration, the request will be marked as Expired.

#### Send email invitation

If checked, then an email invitation will be sent to the invitee upon meeting creation. The email invitations functionality is an out-of-the-box feature of EspoCRM. The email template can be configured under Administration > Template Manager > Invitation · Meeting.

The invitee can accept or decline the meeting from the invitation email.

#### Online location

Specify the external service that will be used for online meetings. See below about the Zoom integration.

#### Forbid free email domains

If checked, an invitee won't be able to specify an email address of free email providers. Such as gmail.com, outlook.com, etc. They will be asked to use their work email address.

#### Blocklists

Selected Target Lists will be used as blocklists. If an invitee uses an email address that matches the email address of any target of the selected Target List, they won't be able to create a request.

#### Meeting Description

The description text that will be added to the meeting record.

### Schedule

Here you need to specify the availability schedule.

The *Schedule* field defines time ranges of the general day schedule. Below, specify available weekdays. For each weekday, it's possible to define a custom day schedule. For example, on Friday you can have a shorter working day.

The *Time Zone* defines the time zone of the configured schedule. Only this time zone is taken into account for the availability schedule. The user's time zone and the system default time zone have no effect here.

#### Consider working time

If checked, the working time of a host will be taken into account in their availability. For example, if a host is on day-off, they won't be available in the scheduler.

The Working Time Calendar is the out-of-the-box feature in EspoCRM.

Note that it's possible to override the availability schedule for specific day ranges and for specific hosts. See below about overrides.

### Form

Here you configure the scheduling page (form). The form URL will be generated after the Meeting Scheduler record is created. You can also re-generate the form URL. After re-generating, the form won't be accessible by the previous URL.

#### Language used on form

Choose the language that will be used on the scheduling form. You can edit labels for the needed language under Administration > Label Manager > Meeting Scheduler, Meeting Request.

#### Allowed hosts for form embedding

It's possible to include the scheduling form in an inline frame element (iframe) on a website. You need to specify the host of the website you are going to include the form on.

#### Form Captcha

Enables ReCaptcha for the form. To be able to use Captcha, you need to configure it under Administration > Integrations.

#### Text to display on form

The text will be displayed on the scheduling page at the top.

#### URL to redirect to after form submission

If specified, once an invitee submits the form, they will be redirected to the specified URL.

The `meetingSchedulerRequest` URI parameter with the request ID will be appended to the URL. This allows to retrieve the request data (for software developers).

#### Text to display after form submission

The text that will be displayed to an invitee once they submitted the form.

#### Enable Form URL

If not checked, the form won't be accessible by the form URL.

### Hosts

Here you can specify hosts and configure their distribution.

If no hosts are specified, then meetings will be assigned to the assigned user of the Meeting Scheduler record.

Only users who have the Meeting Scheduler Hosts scope enabled in their roles can edit the Hosts section.

More information about host distribution is available in the Round-Robin section below.

#### Fixed hosts

Designate hosts that should always attend a meeting. If at least one of the fixed hosts is not available at a specific time, it won't be possible to schedule a meeting then.

One of the fixed hosts is designated as primary. Meetings will be assigned to the primary host.

It's possible to have no fixed hosts.

#### Rotating hosts

Rotating hosts are automatically picked by a specific round-robin algorithm. If at least one rotating host is available at a specific time, the time slot is treated as available for scheduling.

#### Number of rotating hosts per meeting

It's possible to have multiple rotating hosts picked per meeting. A meeting cannot be scheduled if the number of available hosts is fewer than the specified number.

If the value is not specified, it's treated as one – only one rotating host will be picked.

## Overrides

Overrides allow to change scheduling for a specific date period. There are two types of overrides: *Not Available* and *Available*.

An override can be associate with a specific user (host). If the host is not specified, the override is applied to the entire scheduler.

## Questions

By default, there are two mandatory fields on the scheduling form: *Name* and *Email Address*. It's possible to add additional custom question.

Available field types:

* String
* Text
* Enum
* Checkbox
* Checklist
* Phone
* Number
* Decimal

Questions can be set as required or optional. It's possible to specify a tooltip text for specific questions. Certain questions can be inactivated.

An attendee's answers to the questions will be available in the Meeting Request record. They will be also added to the meeting's description.

## One-time links

One-time links are useful when you don't want to share your main scheduler page to avoid unwanted meetings. You can send a one-time link to a specific customer, allowing them to book a meeting with you.

* Once a link is consumed, it's not available anymore.
* Optionally, you can set an expiration date and time for a link.
* A link can be associated with a specific Contact or Lead. In this case the created meeting will be automatically associated with that contact regardless of what email address the attendee specified. On the scheduling form, the email address will be pre-filled with the contact's email address.

Note that one-time links function even if the Form URL is deactivated.

## Requests

Once an invitee filled in the scheduling form a Meeting Request is created. The request is assigned to the primary host of the meeting. If neither approval nor confirmation are required, the request will be set as Completed. Otherwise, it will be set as Pending.

Requests can be approved and canceled by the request assignee, the scheduler assignee, and users who have edit access to the scheduler.

Meetings requests can be accessed from navbar. The My Meeting Requests dashlet can be added on the dashboard.

Unconfirmed requests expire. The expiry period is defined by the scheduler's configuration.

On the Meeting Request detail view you can view the attendee's answers to the questions.

## Round-robin host distribution

!!! note

    Host distribution can be configured only by users who have the Meeting Scheduler Hosts scope enabled in their roles.

There are two distribution methods available:

* Priority-Least-Recent
* Balanced

### Priority-Least-Recent method

Available hosts with the highest priority are picked. Among them, the one that has been scheduled least recently is chosen.

There are three priority levels for hosts: Low, Medium, and High.

You can view and edit hosts selection orders by clicking *View Rotating Hosts* next to the *Edit* button.

#### Assignee priority boost

A host assigned to the Contact will receive the priority boost. This value defines the number of priority steps to increase.

### Balanced method

The available host with the fewest past selections adjusted by weight is chosen.

You can view and edit hosts' weights and selection numbers by clicking *View Rotating Hosts* next to the *Edit* button.

Weight can be an arbitrary number. A host with a weight of 100 will receive twice as many meetings as a host with a weight of 50.

#### Assignee weight boost

A host assigned to the Contact will receive the specified weight boost.

Use this parameter if you want to give priority to a contact's assignee.

#### Out-runner threshold

Hosts that were selected more than the average, exceeding the specified threshold, will be excluded from availability. Weights are taken into account in calculation.

Use this parameter if you don't want having hosts who received substantially more meetings than other hosts.

## Zoom integration

The Zoom integration is available as a separate [extension](../zoom-integration/index.md).

With the Zoom integration installed, Zoom is available as an option in the *Online Location* field of a Meeting Scheduler record. To be able to select the Zoom location, users need to have access to the *Zoom Meetings* scope in their roles.

When a meeting is created through the scheduler, a Zoom meeting is automatically created in the meeting assignee's Zoom account. The Join URL is stored in the Espo meeting.

## Microsoft Teams integration

The integration with Microsoft Teams is implemented in the [Outook Integration](https://www.espocrm.com/extensions/outlook-integration/) extension.

With the extension installed, the Microsoft is available as an option in the *Online Location* field of a Meeting Scheduler record. To be able to select the Microsoft location, users need to have access to the *Outlook Calendar* scope in their roles. They also need to be connected to Outlook in their External Account settings and to have the Calendar checkbox enabled. Note that the sync direction can be set to any value including *None*.

When a meeting is created through the scheduler, a Microsoft meeting is automatically created in the meeting assignee's calendar. The Join URL is stored in the Espo meeting.

