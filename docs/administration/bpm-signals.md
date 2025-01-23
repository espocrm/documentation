# Signals

Signals are events with a specific name. Signals are broadcasted globally, they are not limited by a process scope. It means that a signal triggered in one BPM process can be caught in another process.

The signals feature is a part of the Advanced Pack extension and can be utilized in the BPM and Workflows tools.

How signals are broadcasted:

* There are set of standard signals which are broadcasted upon specific events in the application. These *built-in signals* are listed below in the article.
* It's possible to broadcast [custom signals](bpm-events.md#signal-intermediate-event-throwing) in a BPM process.
* It's possible to broadcast custom signals using the [Formula function](bpm-formula.md#bpmbroadcastsignal) `bpm\broadcastSignal(SIGNAL_NAME)`.
* It's possible to broadcast custom signals via PHP code.

There are two types of signals:

* Regular signals
* Object signals

In this article:

* [Regular signals](#regular-signals)
* [Object signals](#object-signals)
* [Naming clarification](#naming-clarification)

## Regular signals

* Can be broadcasted and caught within a running process.
* Cannot be used to start a process or a workflow rule.

In BPM processes, the *Signal Intermediate Events* can catch and throw only regular signals.

### Built-in signals

Below is the list of available out-of-the-box signals which are broadcasted in the system upon specific conditions.

!!! note

    Signal name parts written in the upper case (e.g. ENTITY_TYPE, ID, LINK_NAME) must be replaced with corresponding values. E.g. when an Account with an ID `abc01` is updated, a signal `update.Account.abc01` is broadcasted. See the naming clarification below.

#### Default

* `create.ENTITY_TYPE` – record of ENTITY_TYPE created, e.g. `create.Lead`;
* `update.ENTITY_TYPE.ID` – record update, e.g. `update.Lead.aabbcc01`;
* `delete.ENTITY_TYPE.ID` – record removed;
* `relate.ENTITY_TYPE.ID.LINK_NAME` – record related with another record (only for *many-to-many*);
* `relate.ENTITY_TYPE.ID.LINK_NAME.FOREIGN_ID` – record related with another record, ID of the related record is specified (only for *many-to-many*);
* `unrelate.ENTITY_TYPE.ID.LINK_NAME` – record unrelated from another record (only for *many-to-many*);
* `unrelate.ENTITY_TYPE.ID.LINK_NAME.FOREIGN_ID` – (only for *many-to-many*);
* `createRelated.ENTITY_TYPE.ID.LINK_NAME` – created a related record, one-to-many relationship, e.g. Opportunity created for Account;
* `createChild.ENTITY_TYPE.ID.CHILD_ENTITY_TYPE` – when created a record related through a parent, e.g. Meeting created for Account;
* `streamPost.ENTITY_TYPE.ID` – when somebody posted in the stream;

#### Contacts/Leads

* `leadCapture.ENTITY_TYPE.ID` – when a Lead (or Contact) is processed through the Lead Capture (confirmed opt-in if the double opt-in is enabled);
* `leadCapture.ENTITY_TYPE.ID.LEAD_CAPTURE_ID` – the same, but the ID of a Lead Capture record is specified;
* `optOut.ENTITY_TYPE.ID` – person opted-out;
* `optOut.ENTITY_TYPE.ID.TARGET_LIST_ID` – person opted-out from a specific target list;
* `cancelOptOut.ENTITY_TYPE.ID` – person opted-in again;
* `cancelOptOut.ENTITY_TYPE.ID.TARGET_LIST_ID`;
* `eventAccepted.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE` – person accepted a meeting/call invitation;
* `eventAccepted.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID` – person accepted a meeting/call invitation, event id is specified;
* `eventTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE` – person set Tentative status in a meeting/call invitation;
* `eventTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID`;
* `eventAcceptedTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE` – person set Accepted or Tentative status in a meeting/call invitation;
* `eventAcceptedTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID`;
* `eventDeclined.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE` – person declined a meeting/call invitation;
* `eventDeclined.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID`

#### Contacts/Leads/Accounts/Users

* `clickUrl.ENTITY_TYPE.ID` – recipient opened a tracking URL , see [here](bpm-tracking-urls.md);
* `clickUrl.ENTITY_TYPE.ID.CAMPAIGN_TRACKING_URL_ID` – recipient opened a specific tracking URL;

#### Other

* `clickUniqueUrl.UNIQUE_ID` – recipient opened a tracking URL with a unique ID, see [here](bpm-tracking-urls.md);

### Placeholders

When defining a signal name in Signal Events in a BPM Flowchart, you can use placeholders:

* `{$attribute}` – attribute of target record
* `{$$variable}` – formula variable

E.g. `mySignal.{$status}.{$id}` – *status* and *id* are attributes of the target record. Placeholders will be replaced with attribute values, so the actual signal name will look like `mySignal.New.someIdValue`.

## Object signals

* Broadcasted along with the entity (record).
* Prefixed with `@` character.
* Can be used only to initiate a new process or workflow rule.
* Can't be caught within a running process.
* Can be broadcasted by a running process. 

!!! note

    Signal Intermediate Event (Catching) can't catch object signals. 

Example: A process triggers signal *@approve*. A target record of the *Lead* entity type is attached to the signal. You have another BPM flowchart for the *Lead* entity type that starts with the *@approve* signal. In this case, a new process will be started, and the Lead record from the first process will be passed as a target record of the second process. 

### Built-in signals

Below is the list of available out-of-the-box signals that are broadcasted in the system.

!!! note

    Signal name parts written in the upper case (e.g LINK_NAME, FOREIGN_ID) must be replaced with corresponding values. See the naming clarification below.

#### Default

* `@create` – record created;
* `@update` – record updated;
* `@delete` – record removed (can't be used in BPM);
* `@relate.LINK_NAME` – record related with another record (only for *many-to-many*); the foreign ID is passed in the `id` parameter;
* `@relate.LINK_NAME.FOREIGN_ID` – record related with another record, an ID of related record is specified (only for *many-to-many*);
* `@unrelate.LINK_NAME` – record unrelated from another record; the foreign ID is passed in the `id` parameter;
* `@unrelate.LINK_NAME.FOREIGN_ID`

#### Contacts/Leads:

* `@leadCapture` – when a Lead (or Contact) is processed through the Lead Capture (confirmed opt-in if it's enabled);
* `@leadCapture.LEAD_CAPTURE_ID`
* `@optOut` – person opted-out;
* `@optOut.TARGET_LIST_ID` – person opted-out from a specific target list;
* `@cancelOptOut` – person opted-in again;
* `@cancelOptOut.TARGET_LIST_ID`

#### Contacts/Leads/Accounts/Users

* `@clickUrl` – recipient opened a tracking URL;
* `@clickUrl.CAMPAIGN_TRACKING_URL_ID` – recipient opened a specific tracking URL;

#### Meetings/Calls/Events

* `@eventAccepted.ENTITY_TYPE` – an attendee accepted the event (ENTITY_TYPE can be *Contact*, *Lead*, *User*; as of v3.0.13); the foreign ID is passed in the `id` parameter;
* `@eventTentative.ENTITY_TYPE` – an attendee set a tentative acceptance status; the foreign ID is passed in the `id` parameter;
* `@eventDeclined.ENTITY_TYPE` – an attendee declined the event; the foreign ID is passed in the `id` parameter;
* `@eventAcceptedTentative.ENTITY_TYPE` – an attendee accepted the event or set as tentative (ENTITY_TYPE can be *Contact*, *Lead*, *User*; as of v3.0.13); the foreign ID is passed in the `id` parameter;

### Signal parameters

*As of v3.2.*

Some object signal are passed with additional parameters. These parameters can be accessed with a formula function `workflow\\signalParam('parameterName')`.

## Naming clarification

* *ID* – an ID of a record that you can obtain from the browser address bar;
* *ENTITY_TYPE* – an entity type of the record (not translated), you can obtain it at Administration > Entity Manager;
* *LINK_NAME* – a relation name, you can obtain it at Administration > Entity Manager;
* *FOREIGN_ID* – an ID of a related record.
