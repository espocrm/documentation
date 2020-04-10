# BPM Activities

Activities are displayed as rounded rectangles.

* [Task](#user-content-task)
* [Send Message Task](#user-content-send-message-task)
* [User Task](#user-content-user-task)
* [Script Task](#user-content-script-task)
* [Sub-Process](#user-content-sub-process)
* [Event Sub-Process](#user-content-event-sub-process)
* [Call Activity](#user-content-call-activity)

----

## Task

Task can execute following the actions:

* Create Record – creates new record of any entity type;
* Create Related Record – creates new record related to the target record;
* Update Target Record;
* Update Related Record – updates the record or records related to the target record;
* Update Created Record – updates specific field of any record created in the current process;
* Update Process Record – can be used to assign the process to specific user or team;
* Link to Another Record – links the target record with a specified record;
* Unlink from Another Record – unlinks the target record from the specified record;
* Apply Assignment Rule – assigns the target record, the process record or any record created by the process according to the specific rule;
* Create Notification – creates in-app notification for specific users;
* Make Followed – makes specific users follow the target record, the process record or any record created by the process;
* Trigger Another Workflow Rule - runs a workflow rule of the sequential type, target can be substituted with a related or created record;
* Run Service Action – runs a specific service action; the list of built-in actions is available [here](workflows.md#run-service-action); developers can create custom service actions;
* Send HTTP Request – calls external API (since version 2.4.0).

Actions available for a task are almost the same as in Workflows tool. See more details about [workflow actions](workflows.md#actions).

It's possible to delete records in Update actions with the following formula code: `deleted = 1`.

When using formula in tasks that create another record, you can access target record attributes with the function `targetEntity\attribute(ATTRIBUTE)`. 

Example:

```
name = targetEntity\attribute('name');
```

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

You can specify which email address the email will sent from, and specify a reply-to address. 

It's possible to use process variables to specify email address (recipient or sender) with *Specific email address* option, e.g. `{$$emailAddress}`, where *emailAddress* is a variable defined in the process before. Available since version 2.4.5.

Email Template is used to generate the email. You can use regular placeholders (both in body and subject) to substitue field values of the target record. You can also use process variables (defined in Script Task) in the template with placeholders like `{$$variableName}` (since advanced pack 2.4).

You can catch a reply on the sent email with *Message Intermediate Event* further in the process.

### Opting-out

It's possible to add opt-out link to an email body. Opting out can be caught within a process with Catching Signal Event with the signal name `optOut.ENTITY_TYPE.{$id}`, where *ENTITY_TYPE* should be replaced with entity type (e.g. Lead), *{$id}* is a placeholder standing for the target record ID. Signal name usage example: `optOut.Lead.{$id}`.

### Tracking URLs

See a [separate article](bpm-tracking-urls.md).

----

## User Task

Provides a flexible ability of user interaction. It stops execution until the user (specified explicitly or by assignment rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: Approve, Review, Accomplish.

* Approve type requires the user to choose between 'Approved' and 'Declined'.
* Review type gives only one option: 'Reviewed'.
* Accomplish type has two options: 'Completed' and 'Failed'.

The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications for Process User Tasks at Administration > Notifications > Email Notifications.

It's possible to specify instructions text for a user (markdown is supported).

You can use placeholders in *Name* and *Instructions*:

* `{$attribute}` – attribute of target record
* `{$$variable}` – process variable (defined by Script Task)

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.

### Dispaying on detail view

It's possible to display process task on the target entity detail view.

#### Using Report Panels

You can utilize *Report Panels* feature for this. Create a list report, that shows all user tasks. Then create a report panel (from administration) for needed entity type with this list report selected.

#### Using created relationship

It's possible to create Children-to-Parent relationship between some entity type and User Task, then User Tasks will be available in *Relationships* layout of that entity type. Administration > Entity Manager > BpmnUserTask > Relatinships > edit Children-to-Parent > check your entity type at *Foreign Fields*.

### Resolution

It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification in the process flow. User Task resolution is avaible in conditions of geteways and conditional events.

### Canceling

Created User Task can be canceled by a process. There are two ways:

1. Using 'Update Created Record' action (within Task activity), setting 'Is Canceled' field to 'true'. 
2. Using interrupting boundary event (attached to User Task activity) (since advanced pack 2.4.0).

![User Task](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/task-user.png)


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

You can update the target record with Script Task, but the more proper way is to use Update Target Record action of the regular Task.

----

## Sub-Process

An isolated process that executes within the current process. The sub-process has it's own flowchart. It starts once the flow reaches its activity element.

Sub-process should have one (and only one) regular Start Event.

Sub-process can be interrupted by an interrupting boundary event. When the sub-process is successfully ended (not interrupted, not ended with an error), the flow of the parent process proceeds to the next element.

It possible to **pass a different target** to the sub-process. After you placed a sub-process element on the flowchart, click it to edit, then specify a target. It allows to easily access fields of created records or records related the target records. E.g. to send notification to the assigned user of the opportunity that was created within the process.

When a sub-process is initiated, all formula variables are copied from the parent process to the sub-process. Variables of the sub-process are isolated from its parent process. You can specify which variables will be copied to the parent process upon the completion in *Return Variables* parameter.

When a sub-process is initiated, it receives an information about all records created by the parent process at that moment. The sub-process can access those records. The parent process can access records created by the sub-process only after the sub-process is completed. Once the sub-process is completed, it passes information about created records to the parent process.

![Sub-Process](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/sub-process.png)

----

## Event Sub-Process

Event Sub-Process has neither ingoing, nor outgoing flows. It is triggered by its Start Event. The start event can be of any type: Conditional, Timer, Signal, Message, Error, Escalation.

It possible to **pass a different target** to the event sub-process. The event sub-process can *interrupt* its parent process. Whether the sub-process is interrupting is determined by *Is Interrupting* parameter of its start event.

When an event sub-process is initiated, all formula variables are copied from the parent process to the sub-process.

When an event sub-process is initiated, it receives an information about all records created by the parent process at that moment. The sub-process can access those records. Records created by the event sub-process won't be accessible by the parent process.

Non-interrupting event sub-process can be executed **multiple times**. E.g. a condition occured multiple times.

![Event Sub-Process](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/event-sub-process.png)

----

## Call Activity

Executes a sub-process defined by a flowchart stored separately. Provides the ability to re-use the same flowchart in different processes.

It possible to pass a different target to the sub-process.


