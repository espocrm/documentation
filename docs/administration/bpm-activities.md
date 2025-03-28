# BPM Activities

Activities encompass automated tasks, manual tasks, and sub-processes. On a flowchart, they are depicted as gray rectangles.

* [Task](#task)
* [Send Message Task](#send-message-task)
* [User Task](#user-task)
* [Script Task](#script-task)
* [Sub-Process](#sub-process)
* [Event Sub-Process](#event-sub-process)
* [Call Activity](#call-activity)

----

## Task

A task can execute different actions. Available actions are listed below.

The BPM task utilizes actions from the Workflow tool. The list of available actions is almost the same as in Workflows. See more details about [Workflow actions](workflows.md#actions).

### Actions

#### Create Record

Creates a new record of a specific entity type.

#### Create Related Record

Creates a new record related to the target record.

#### Update Target Record

Updates the target record. You can also utilize Formula script to set fields with calculated values.

It's possible to delete the record with the Formula expression: `deleted = 1`.

#### Update Related Record

Updates a record (or multiple records) related to the target record. You can also utilize Formula script to set fields with calculated values.

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

Assigns the record to a user based on a specific assignment rule. Can be applied to the target record, the process record, or any record created by the process. See [more](workflows.md#apply-assignment-rule).

#### Create Notification

Creates an in-app notification for specific users. See [more](workflows.md#create-notification).

Process variables can be included in a message with such placeholders: `{$$variable}`, where *$variable* is a variable defined in the process.

#### Make Followed

Makes specific users to follow the target record, the process record, or any record created by the process.

#### Trigger Another Workflow Rule

Runs a workflow rule of the sequential type. The target record of the called rule can be the same or be switched to a related record or a record created by the process.

#### Run Service Action

Runs a specific service action. The list of built-in actions is available [here](workflows.md#run-service-action). Developers can create custom service actions.

#### Send HTTP Request

Calls an external API endpoint. See [more](workflows.md#send-http-request).

#### Execute Formula Script

Executes a specific Formula script.

### Formula usage

When using Formula in a task that creates or updates another record, the current entity (for the script) is switched the the record you are creating. To access attributes of the target record you can utilize the function `targetEntity\attribute(ATTRIBUTE)`.

!!! example

    ```
    // attribute of the target record
    $someVariable1 = targetEntity\attribute('name');

    // attribute of the record you are creating or updating
    $someVariable2 = name;

    // attribute of the record you are creating or updating
    $someVariable3 = entity\attribute('name');
    ```

!!! warning

    In the context of create and update record actions, it's recommended to use Formula only for setting attributes. Use the *Script Task* or *Execute Formula Script* action for any other logic.

If the parameter *Isolate Variables* is checked, Formula variables defined within the task won't be exposed outside of the task. The *Return Variables* parameter allows to specify variables that will be exposed.

!!! note

    If you didn't check the *Isolate Variables* parameter, be aware that all variables defined in Execute Formula Script actions will remain available throughout the process and even after it finishes. Since some variables may contain sensitive data or consume disk space, it might be reasonable to unset them at the end of the script. Checking the Isolate Variables parameter is recommended.   

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

You can specify which email address the email will be sent from.

If you specify a *Reply-To* address, a sent email will contain it in the *Reply-To* header. It will facilitate a recipient to reply to that address instead of the address specified in the *From* field.

When you use *Specific email address* option, it's possible to use process variables. E.g. `{$$emailAddress}`, where *$emailAddress* is a variable defined in the process before.

An Email Template is used to generate the email. You can use regular placeholders (both in body and subject) to substitute field values of the target record. You can also insert process variables (defined in a Script Task) in an email template with placeholders like `{$$variable}`.

You can catch a reply to a sent email with Message Intermediate Event further in the process.

Additional attachments can be added to an email using the *Attachments Variable* parameter. Specify a Formula variable name that contains an attachment ID or an array of attachment IDs. You can generate needed attachments in a Formula script in a previous action. As of v3.6.

### Opting-out

It's possible to add opt-out link to an email body. Opting out can be caught within the process with Catching Signal Event with the signal name `optOut.ENTITY_TYPE.{$id}`, where *ENTITY_TYPE* should be replaced with an entity type (e.g. Lead), *{$id}* is a placeholder standing for the target record ID. Signal name usage example: `optOut.Lead.{$id}`.

### Tracking URLs

See a [separate article](bpm-tracking-urls.md).

----

## User Task

It stops the flow until a user (specified explicitly or selected by an assignment rule) resolves the task. A Process User Task record will be created in the system. By default, there are 3 action types: Approve, Review, and Accomplish.

* Approve – requires the user to choose between 'Approved' and 'Declined'.
* Review – gives only one option: 'Reviewed'.
* Accomplish – has two options: 'Completed' and 'Failed'.

The user assigned to the created Process User Task record will receive an in-app notification. An administrator can also enable email notifications for Process User Tasks under Administration > Notifications > Email Notifications.

It's possible to specify text with instructions for the user (markdown is supported).

You can use placeholders in *Name* and *Instructions* fields:

* `{$attribute}` – attribute of target record
* `{$$variable}` – process variable (defined by Script Task)

Users can also add the Process User Tasks **dashlet** on their dashboard to see their active process user tasks.

### Displaying on detail view

It's possible to display Process User Tasks on the detail view of the target entity.

#### Using Report Panels

You can utilize the *Report Panels* feature to display process tasks on the record detail view. Create a Report of the List type that shows all Process User Tasks (no filters). Then, create a Report Panel (Administration > Report Panels) for the needed entity type with this list Report selected.

#### Using created relationship

It's possible to create a Children-to-Parent relationship between some entity type and the Process User Task, then Process User Tasks will be available in the *Bottom* layout of that entity type. Go to Administration > Entity Manager > BpmnUserTask > Relationships > edit Children-to-Parent, check your entity type in *Foreign Fields*.

### Resolution

It's possible to check a resolution of a passed Process User Task with diverging gateways or conditional events. This allows for making ramifications in the process flow depending on a resolution. The User Task resolution is available in conditions of gateways and conditional events.

The resolution (as well as any User Task field) can be also accessed further in the flow with Formula:

```
$resolution = bpm\createdEntity\attribute('USER_TASK_ELEMENT_ID', 'resolution');
$resolutionNote = bpm\createdEntity\attribute('USER_TASK_ELEMENT_ID', 'resolutionNote');
```

The element ID can be obtained from the User Task's detail view.

### Canceling

A created User Task can be canceled by a process. There are two ways:

1. Using 'Update Created Record' action (within a Task activity), setting 'Is Canceled' field to 'true'.
2. Using interrupting boundary event (attached to the User Task activity).

![User Task](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/task-user.png)


----

## Script Task

Executes a [Formula](formula.md) script.

You can store some variables and use them further in the process. All variables you defined in the script will be automatically stored.

```
$myVar1 = 'test';
$myVar2 = id;

// ...

$myVar2 = null;
```

Variables can be utilized in:

* Condition checking
* Tasks that create or update record
* Email templates
* Signal names
* User Task names
* Email addresses in a Send Message task

You can update the target record with a Script Task, though the more proper way is to use the Update Target Record action of a regular Task.

With the Script Task, you can define actions that are impossible to do with the regular Task. Examples:

* Create a new user and send generated password ([see](formula-scripts-examples.md#creating-new-user))
* Send email with generated PDF in attachment ([see](formula-scripts-examples.md#sending-email-with-generated-pdf-in-attachment))

If the parameter *Isolate Variables* is checked, Formula variables defined within the task won't be exposed outside of the task. The *Return Variables* parameter allows to specify variables that will be exposed.

!!! note

    If you didn't check the *Isolate Variables* parameter, be aware that all defined variables will remain available throughout the process and even after it finishes. Since some variables may contain sensitive data or consume disk space, it might be reasonable to unset them at the end of the script.

    ```
    $tmpVariable = null;
    ```

    Though, checking the Isolate Variables parameter is recommended.

----

## Sub-Process

A sub-process is an isolated process that executes within the parent process. A sub-process has it's own flowchart. It starts once the flow reaches its activity element in the parent process.

A sub-process should have one (and only one) regular Start Event.

A sub-process can be interrupted by an interrupting boundary event. When a sub-process is successfully ended (not interrupted and not ended with an error), the flow of the parent process proceeds to the next element.

It's possible to **pass a different target record** to a sub-process (to switch the target record to another). After you placed the Sub-Process element on a flowchart, click it to edit, then specify the target. It allows to easily access fields of created records or records related to the target record. For example, to send a notification to the assigned user of the opportunity that was created within the process.

It's possible to define a target record using a Formula expression. You need to select the target *Record: {EntityType}* and specify a formula expression in the *Target ID Expression* field. The expression should evaluate to the ID of the record.

When a sub-process is initiated, all formula **variables are copied** from the parent process to the sub-process. Variables of the sub-process are isolated from its parent process. You can specify which variables will be copied to the parent process upon the completion in the *Return Variables* parameter. Note: Specify variable names without a leading *$* character.

When a sub-process is initiated, it receives an information about all records that have been created by the parent process by that moment. The sub-process can access those records. The parent process can access records created by the sub-process only after the sub-process is completed. Once the sub-process is completed, it passes the information about created records to the parent process.

![Sub-Process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/sub-process.png)

### Multi-instance sub-process

*As of v2.10.*

The *Collection Expression* should evaluate to a list of values. Each value will instantiate a separate sub-process. The value will be available in the variable `$inputItem`.

In case of a **sequential** multi-instance sub-process, sub processes will be executed one by one. Otherwise, they execute in parallel.

It's possible to have multiple sub-processes for different targets. By using the Formula function *record\findRelatedMany*, it's possible to have sub-processes for related records. The result of the function is the list of IDs. You need to set the *Target ID Expression* to `$inputItem`.

The result of a multi-instance sub-process can be returned to a specific variable defined by the *Return Collection Variable* field. It will contain an array of objects. Each object will contain return-variables of each sub-process instance.

When a multi-instance sub-process is interrupted by a boundary event, all other instances are cancelled.

The max number of sub-process instances is defined by the config parameter `bpmnSubProcessInstanceMaxCount`. The default value is `20`.

----

## Event Sub-Process

An Event Sub-Process has neither ingoing nor outgoing flows. It is triggered by its Start Event. The start event can be of any type: Conditional, Timer, Signal, Message, Error, Escalation.

It is possible to **pass a different target record** to an event sub-process. An event sub-process can *interrupt* its parent process. Whether the sub-process is interrupting is determined by the *Is Interrupting* parameter of its start event.

When an event sub-process is initiated, all formula **variables are copied** from the parent process to the sub-process.

When an event sub-process is initiated, it receives an information about all records that have been created by the parent process by that moment. The sub-process can access those records. Records created by the event sub-process won't be accessible by the parent process.

Non-interrupting event sub-process can be executed **multiple times**. For example, when a condition occurred multiple times.

![Event Sub-Process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-sub-process.png)

----

## Call Activity

Executes a sub-process defined by a flowchart stored separately. Provides the ability to re-use the same flowchart in different processes. The Call Activity sub-process works the same way as a regular Sub-Process.

It is possible to pass a different target record to a sub-process.
