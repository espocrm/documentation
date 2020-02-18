# Signals

Signal event are events with a defined name. Signals are broadcasted globally, they are not limited by a process scope. It means that signal triggered in one process can be catched in another process.

There are set of signals which are broadcasted upon specific events in application. These *built-in signals* are listed below.

It's possible to broadcast custom signals in BPM process. 

There are two types of signals:

* Regular signals
* Object signals

In this article:

* [Regular signals](#regular-signals)
* [Object signals](#object-signals)
* [Naming clarification](#naming-clarification)

## Regular signals

Can be used within running processes. Can NOT be used to start processes or workflows.

### Built-in signals

Note: Parts in upper case (ENTITY_TYPE, ID, LINK_NAME, etc.) will/should be replaced by corresponding values.

#### Default

* *create.ENTITY_TYPE* – record of ENTITY_TYPE created, e.g. `create.Lead`
* *update.ENTITY_TYPE.ID* – record update, e.g. `update.Lead.007`
* *delete.ENTITY_TYPE.ID* – record removed
* *relate.ENTITY_TYPE.ID.LINK_NAME* – record related with another record (only for *many-to-many*)
* *relate.ENTITY_TYPE.ID.LINK_NAME.FOREIGN_ID* – record related with another record, id of related recod is specified (only for *many-to-many*)
* *unrelate.ENTITY_TYPE.ID.LINK_NAME* – record unrelated from another record (only for *many-to-many*)
* *unrelate.ENTITY_TYPE.ID.LINK_NAME.FOREIGN_ID* – (only for *many-to-many*)
* *createRelated.ENTITY_TYPE.ID.LINK_NAME* – created celated record, one-to-many relationship, e.g. Opportunity created for Account
* *createChild.ENTITY_TYPE.ID.CHILD_ENTITY_TYPE* – when created a record related through parent, e.g. Meeting created for Account
* *streamPost.ENTITY_TYPE.ID* – when somebody posted in stream

#### Contacts/Leads

* *leadCapture.ENTITY_TYPE.ID* – when lead (or contact) is processed through Lead Capture (confirmed opt-in if it's enabled)
* *leadCapture.ENTITY_TYPE.ID.LEAD_CAPTURE_ID* – the same, but id of Lead Capture record is specified

* *optOut.ENTITY_TYPE.ID* – person opted-out
* *optOut.ENTITY_TYPE.ID.TARGET_LIST_ID* – person opted-out from specific target list
* *cancelOptOut.ENTITY_TYPE.ID* – person opted-in again
* *cancelOptOut.ENTITY_TYPE.ID.TARGET_LIST_ID*

* *eventAccepted.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE* – person accepted meeting/call invitation
* *eventAccepted.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID* – person accepted meeting/call invitation, event id is specified

* *eventTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE* – person set Tentative status in meeting/call invitation
* *eventTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID*

* *eventAcceptedTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE* – person set Accepted or Tentative status in meeting/call invitation
* *eventAcceptedTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID*

* *eventDeclined.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE* – person declined meeting/call invitation
* *eventDeclined.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID*

#### Contacts/Leads/Accounts/Users

* *clickUrl.ENTITY_TYPE.ID* – recipient opened a tracking url
* *clickUrl.ENTITY_TYPE.ID.CAMPAIGN_TRACKING_URL_ID* – recipient opened a specfic tracking url

### Placeholders

You can use placeholders when you define a signal name that will be broadcasted by the throwing event in the BPM process.

* `{$attribute}` – attribute of target record
* `{$$variable}` – formula variable

E.g. `mySignal.{$status}.{$id}` – type and id are fields of the target record. Placeholders will be replaced with field values producing the signal name like `mySigal.New.someIdValue`.


## Object signals

Broadcasted along with the entity (record). Prefixed with `@` character.

This signal type can be used only to initiate a new process or trigger a workflow rule. Signal Intermediate Event (Catching) doesn't catch object signals. 

Example: A process triggers signal *@approve*. A target record of *Lead* entity type is attached to the signal. You have another BPM flowchar for *Lead* entity type that starts with *@approve* signal. In this case, a new process will be started, and lead record from the first process will be passed as a target record of the second process. 

### Built-in signals

Note: Parts in upper case (LINK_NAME, FOREIGN_ID, etc.) will/should be replaced by corresponding values.

#### Default

* *@create* – record created
* *@update* – record updated
* *@delete* – record removed
* *@relate.LINK_NAME* – record related with another record (only for *many-to-many*)
* *@relate.LINK_NAME.FOREIGN_ID* – record related with another record, id of related recod is specified (only for *many-to-many*)
* *@unrelate.LINK_NAME* – record unrelated with another record (only for *many-to-many*)
* *@unrelate.LINK_NAME.FOREIGN_ID*

#### Contacts/Leads:

* *@leadCapture* – when lead (or contact) is processed through Lead Capture (confirmed opt-in if it's enabled)
* *@leadCapture.LEAD_CAPTURE_ID*
* *@optOut* – person opted-out
* *@optOut.TARGET_LIST_ID* – person opted-out from specific target list
* *@cancelOptOut* – person opted-in again
* *@cancelOptOut.TARGET_LIST_ID*

#### Contacts/Leads/Accounts/Users

* *@clickUrl* – recipient opened a tracking url
* *@clickUrl.CAMPAIGN_TRACKING_URL_ID* – recipient opened a specfic tracking url


## Naming clarification

* *ID* – id of a record that you can obtain from the browser address bar
* *ENTITY_TYPE* – entity type of the record (not translated), you can obtain it at Administration > Entity Manager
* *LINK_NAME* – relation name, you obtain it at Administration > Entity Manager
* *FOREIGN_ID* – id of a related record

