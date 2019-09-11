# Signals

Two types of signals:

* Regular signals
* Object signals

## Regular signals

Can be used within running processes.

Default signals:

* create.ENTITY_TYPE – record of ENTITY_TYPE created, e.g. `create.Lead`
* update.ENTITY_TYPE.ID – record update, e.g. `update.Lead.007`
* delete.ENTITY_TYPE.ID – record removed
* relate.ENTITY_TYPE.ID.LINK_NAME – record related with another record
* relate.ENTITY_TYPE.ID.LINK_NAME.FOREIGN_ID – record related with another record, id of related recod is specified
* unrelate.ENTITY_TYPE.ID.LINK_NAME
* unrelate.ENTITY_TYPE.ID.LINK_NAME.FOREIGN_ID
* createRelated.ENTITY_TYPE.ID.LINK_NAME – created celated record, one-to-many relationship, e.g. Opportunity created for Account
* createChild.ENTITY_TYPE.ID.CHILD_ENTITY_TYPE - when created a record related through parent, e.g. Meeting created for Account
* streamPost.ENTITY_TYPE.ID – when somebody posted in stream

Contacts/Leads:

* leadCapture.ENTITY_TYPE.ID – when lead (or contact) is processed through Lead Capture (confirmed opt-in if it's enabled)
* leadCapture.ENTITY_TYPE.ID.LEAD_CAPTURE_ID – the same, but id of Lead Capture record is specified

* optOut.ENTITY_TYPE.ID – person opted-out
* optOut.ENTITY_TYPE.ID.TARGET_LIST_ID – person opted-out from specific target list
* cancelOptOut.ENTITY_TYPE.ID – person opted-in again
* cancelOptOut.ENTITY_TYPE.ID.TARGET_LIST_ID

* eventAccepted.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE – person accepted meeting/call invitation
* eventAccepted.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID – person accepted meeting/call invitation, event id is specified

* eventTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE – person set Tentative status in meeting/call invitation
* eventTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID

* eventAcceptedTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE – person set Accepted or Tentative status in meeting/call invitation
* eventAcceptedTentative.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID

* eventDeclined.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE – person declined meeting/call invitation
* eventDeclined.ENTITY_TYPE.ID.EVENT_ENTITY_TYPE.EVENT_ID


## Placeholders

You can use placeholders when you define a signal name that will be broadcasted by the throwing event in the BPM process.

* `{$attribute}` – attribute of target record
* `{$$variable}` – formula variable

E.g. `mySignal.{$status}.{$id}` – type and id are fields of the target record. Placeholders will be replaced with field values producing the signal name like `mySigal.New.someIdValue`.


## Object signals

Broadcasted along with the entity (record). Prefixed with `@` character. Can be used to start processes or workflows.

Default signals:

* @create – record created
* @update – record updated
* @delete – record removed
* @relate.LINK_NAME – record related with another record
* @relate.LINK_NAME.FOREIGN_ID – record related with another record, id of related recod is specified
* @unrelate.LINK_NAME
* @unrelate.LINK_NAME.FOREIGN_ID

Contacts/Leads:

* @leadCapture – when lead (or contact) is processed through Lead Capture (confirmed opt-in if it's enabled)
* @leadCapture.LEAD_CAPTURE_ID
* @optOut – person opted-out
* @optOut.TARGET_LIST_ID – person opted-out from specific target list
* @cancelOptOut  – person opted-in again
* @cancelOptOut.TARGET_LIST_ID
