# BPM Activities

Activities are displayed as rounded rectangles.

* [Task](#task)
* [Send Message Task](#send-message-task)
* [User Task](#user-task)
* [Script Task](#script-task)
* [Sub-Process](#sub-process)
* [Event Sub-Process](#event-sub-process)
* [Call Activity](#call-activity)

----

## Task

A task can execute different actions. Available actions are listed bellow.

The BPM task utilizes Workflow tool actions, the list of actions available is almost the same. See more details about [workflow actions](workflows.md#actions).

### Actions

#### Create Record

Creates a new record of any entity type.

#### Create Related Record

Creates a new record related to the target record.

#### Update Target Record

Updates the target record. You can utilize formula here.

It's possible to delete the record with the formula expression: `deleted = 1`.

#### Update Related Record

Updates the record (or multiple records) related to the target record. You can utilize formula here.

#### Update Created Record

Updates a record that was created within the current process.

It's possible to delete the record with the formula expression: `deleted = 1`.

#### Update Process Record

Updates the process record. Can be used to assign the process to a specific user or team.

It's possible to delete the process record with the formula expression: `deleted = 1`.

#### Link to Another Record

Relates the target record with another record.

#### Unlink from Another Record

Unrelates the target record from another specified record.

#### Apply Assignment Rule

Assigns the record to some user by a specific rule. Can be applied to the target record, the process record or any record created by the process. See [more](workflows.md#apply-assignment-rule).

#### Create Notification

Creates in-app notification for specific users. See [more](workflows.md#create-notification).

Process variables can be used in a message with the placeholder `{$$variable}` (as of v2.5.8).

#### Make Followed

Makes specific users to follow the target record, the process record or any record created by the process.

#### Trigger Another Workflow Rule

Runs a workflow rule of the sequential type, target record can be switched a related or a record created by the process.

#### Run Service Action

Runs a specific service action. The list of built-in actions is available [here](workflows.md#run-service-action). Developers can create custom service actions.

#### Send HTTP Request

Calls external API (as of v2.4.0). See [more](workflows.md#send-http-request).

#### Execute Formula Script

Executes a specific formula script.

### Formula usage

When using formula in a task that creates or updates another record, the current entity (for the script) is switched the the record you are creating. To access attributes of the target record you can utilize the function `targetEntity\attribute(ATTRIBUTE)`.

Example:

```
// attribute of the target record
$someVariable1 = targetEntity\attribute('name');

// attribute of the record you are creating or updating
$someVariable2 = name;

// attribute of the record you are creating or updating
$someVariable3 = entity\attribute('name');
```

In the context of *update record* actions it's recommended to use formula only for setting attributes. Use *Script Task* for any other logic.

----

## Send Message Task

Sends an email message to a specific recipient.

An email can be sent to:

* User assigned to process
* Target record (if such has email address)
* Related record
* Specific email address
* Specific users
* Specific teams
* Specific contacts
* Followers of target record

You can specify which email address the email will sent from.

If you specify a *Reply-to* address, a sent email will contain it in a *Reply-to* header. It will facilitate a recipient to reply to that address instead of the address specified in the *From* field.

It's possible to use process variables to specify email address (recipient or sender) with *Specific email address* option, e.g. `{$$emailAddress}`, where *emailAddress* is a variable defined in the process before. Available since version 2.4.5.

Email Template is used to generate the email. You can use regular placeholders (both in body and subject) to substitue field values of the target record. You can also use process variables (defined in Script Task) in the template with placeholders like `{$$variableName}` (since advanced pack 2.4).

You can catch a reply on the sent email with *Message Intermediate Event* further in the process.

### Opting-out

It's possible to add opt-out link to an email body. Opting out can be caught within a process with Catching Signal Event with the signal name `optOut.ENTITY_TYPE.{$id}`, where *ENTITY_TYPE* should be replaced with entity type (e.g. Lead), *{$id}* is a placeholder standing for the target record ID. Signal name usage example: `optOut.Lead.{$id}`.

### Tracking URLs

See a [separate article](bpm-tracking-urls.md).

----

## User Task

It stops the flow until a user (specified explicitly or selected by an assignment rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: Approve, Review, Accomplish.

* Approve – requires the user to choose between 'Approved' and 'Declined'.
* Review – gives only one option: 'Reviewed'.
* Accomplish – has two options: 'Completed' and 'Failed'.

The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications for Process User Tasks at Administration > Notifications > Email Notifications.

It's possible to specify text with instructions for the user (markdown is supported).

You can use placeholders in *Name* and *Instructions* fields:

* `{$attribute}` – attribute of target record
* `{$$variable}` – process variable (defined by Script Task)

Users can also add Process User Tasks **dashlet** on their dashboard to see their actual process user tasks.

### Dispaying on detail view

It's possible to display process task on the target entity detail view.

#### Using Report Panels

You can utilize *Report Panels* feature to display process tasks on the record detail view. Create a list report that shows all user tasks (no filters). Then create a report panel (from administration) for needed entity type with this list report selected.

#### Using created relationship

It's possible to create Children-to-Parent relationship between some entity type and User Task, then User Tasks will be available in *Relationships* layout of that entity type. Go to Administration > Entity Manager > BpmnUserTask > Relatinships > edit Children-to-Parent, check your entity type at *Foreign Fields*.

### Resolution

It's possible to check the resolution of the passed user task in diverging gateways or conditional events, making ramification in the process flow depending on the resolution. User Task resolution is avaible in conditions of geteways and conditional events.

### Canceling

Created User Task can be canceled by a process. There are two ways:

1. Using 'Update Created Record' action (within Task activity), setting 'Is Canceled' field to 'true'.
2. Using interrupting boundary event (attached to User Task activity).

![User Task](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/task-user.png)


----

## Script Task

Executes the script in [espo-formula](formula.md) language.

You can store some variables and use them further within the process. All set variables (`$variableName`) will be automatically stored.

```
$myVar1 = 'test';
$myVar2 = id;
```

Variables can be utilized in:

* Condition checking
* Tasks that create or update record
* Email templates
* Signal names
* User Task names

You can update the target record with Script Task, though the more proper way is to use Update Target Record action of the regular Task.

In Script Task you can define actions that are impossible to do with the regular Task. Examples:

* Create a new user and send generated password ([see](formula-scripts-examples.md#creating-new-user))
* Send email with generated PDF in attachment ([see](formula-scripts-examples.md#sending-email-with-generated-pdf-in-attachment))

Note: It's recommended to **clear temporary variables**, that won't be needed further in the process, in the end of the script.

```
$tmpVariable = null;
```

----

## Sub-Process

An isolated process that executes within the current process. The sub-process has it's own flowchart. It starts once the flow reaches its activity element.

Sub-process should have one (and only one) regular Start Event.

Sub-process can be interrupted by an interrupting boundary event. When the sub-process is successfully ended (not interrupted, not ended with an error), the flow of the parent process proceeds to the next element.

It's possible to **pass a different target** to the sub-process. After you placed a sub-process element on the flowchart, click it to edit, then specify a target. It allows to easily access fields of created records or records related to the target record. E.g. to send notification to the assigned user of the opportunity that was created within the process.

It's possible to define the target record using a formula expression. You need to select the target *Record: {EntityType}* and specify the formula expression in the *Target ID Expression* field. The expression should evaluate to the ID of the record. Available as of v2.10.

When a sub-process is initiated, all formula **variables are copied** from the parent process to the sub-process. Variables of the sub-process are isolated from its parent process. You can specify which variables will be copied to the parent process upon the completion in *Return Variables* parameter. Note: Variable names should be specified without *$* character.

When a sub-process is initiated, it receives an information about all records created by the parent process at that moment. The sub-process can access those records. The parent process can access records created by the sub-process only after the sub-process is completed. Once the sub-process is completed, it passes information about created records to the parent process.

![Sub-Process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/sub-process.png)

### Multi-instance sub-process

*As of v2.10.*

The *Collection Expression* should evaluate to a list of values. Each value will instantiate a separate sub-process. The value will be available in the variable `$inputItem`.

In the case of the **sequential** multi-instance sub-process, sub processes will be executed one by one. Otherwise they execute in parallel.

It's possible to have multiple sub-processes for different targets. By using the formula function *record\findRelatedMany* it's possible to have sub-processes for related records. The result of the function is the list of IDs. You need to set the *Target ID Expression* with the value `$inputItem`.

The result of a multi-instance sub-process can be returned to a specific variable defined by the *Return Collection Variable* field. It will contain an array of objects. Each object will contain return-variables of each sub-process instance.

When a multi-instance sub-process is interrupted by a boundary event, all other instances are cancelled.

The max number of sub-process instances is defined by the config parameter `bpmnSubProcessInstanceMaxCount`. The default value is `20`.

----

## Event Sub-Process

Event Sub-Process has neither ingoing, nor outgoing flows. It is triggered by its Start Event. The start event can be of any type: Conditional, Timer, Signal, Message, Error, Escalation.

It possible to **pass a different target** to the event sub-process. The event sub-process can *interrupt* its parent process. Whether the sub-process is interrupting is determined by *Is Interrupting* parameter of its start event.

When an event sub-process is initiated, all formula **variables are copied** from the parent process to the sub-process.

When an event sub-process is initiated, it receives an information about all records created by the parent process at that moment. The sub-process can access those records. Records created by the event sub-process won't be accessible by the parent process.

Non-interrupting event sub-process can be executed **multiple times**. E.g. a condition occurred multiple times.

![Event Sub-Process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-sub-process.png)

----

## Call Activity

Executes a sub-process defined by a flowchart stored separately. Provides the ability to re-use the same flowchart in different processes. Call Activity sub-process works the same way as a regular sub-process.

It possible to pass a different target to the sub-process.
