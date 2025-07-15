# Workflows

The Workflows tool is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

The Workflows tool automates your business processes in an easy way. Possible use cases of what can be achieved:

* Automatically modify records when specific conditions are met. 
* Define assignment rules for efficient task distribution.
* Add buttons on the record detail view to trigger business logic actions.
* Integrate Espo with external systems through an API for data exchange.
* And many more.

You can access Workflows from the Administration panel. Only administrators can view or configure workflows.

When creating a Workflow rule, you need to set:

* Target entity type – the entity type the rule is applied to;
* Trigger type – how the rule will be triggered;
* Conditions – conditions need to be met to trigger the rule;
* Actions – what actions to perform when the rule is triggered.

In this article:

* [Trigger types](#trigger-types)
* [Conditions](#conditions)
* [Actions](#actions)
* [Using formula in actions](#using-formula-in-actions)
* [Formula functions](#formula-functions)
* [Config parameters](#config-parameters)
* [See also](#see-also)

## Trigger types

* [After record created](#after-record-created)
* [After record updated](#after-record-updated)
* [After record create or updated](#after-record-created-or-updated)
* [Manual](#manual)
* [Scheduled](#scheduled)
* [Sequential](#sequential)
* [Signal](#signal)

### After record created

Triggered only when a new record is created. If specified conditions are met, then actions will be executed.

### After record updated

Triggered only when an existing record is updated. If specified conditions are met, then actions will be executed.

!!! important

    Be aware of potential loops. A built-in safeguard prevents looping in basic cases. However, loops can still occur – for example, when using a formula to update records.

### After record created or updated

Triggered when a new record is created or an existing record is updated. If specified conditions are met, then actions will be executed.

For Workflow rules with this trigger type, it's a common practice to have a condition that checks whether some field was changed. For example, if a Case's status is changed, then do some actions.

### Manual

*As of v2.12.*

Triggered manually by a user by clicking a button (or a dropdown menu item) on the record detail view.

The ability to define:

* an element type (a button or a dropdown item);
* a label text;
* teams allowed to run the Workflow;
* dynamic-logic conditions that make a button/menu-item available;
* access to the record required to be able to run the Workflow (read, edit, admin).

Limitations:

* Portal Users are not allowed to run *Manual* Workflows.

To show a custom result message use the function [workflow\alert](workflows.md#workflowalert) in an Execute Formula Script action.

### Scheduled

Triggered according to a defined scheduling. You can set up it to run every day, every week, etc. Actions will be applied for records returned by a specified *List* Report. Hence, you need also to create a *List* Report.

Scheduling is specified in a crontab notation.

```
* * * * * *
| | | | | |
| | | | | +-- Year              (range: 1900-3000)
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)
```

How it works:

1. You need to create a *List* Report showing records that met specific criteria. You can specify any columns for the Report, it doesn't matter in this context.
2. Then, create a Workflow rule with the *Scheduled* trigger type, select the Report you created before. Specify the needed scheduling.
3. Specify one or multiple actions in the Workflow rule.

The Workflow rule will be running in idle according to the specified scheduling. On each run, it will run the Report and obtain all records from the Report result. Then, it will apply the action (or multiple actions) for every record.

!!! example "Example, a use case"

    Send a notification email to customers who have their license expiring in 1 week. You will need a report listing contacts who have their license expiring exactly in 7 days. Set up a Workflow to run once a day.

### Sequential

Is supposed to be run by another Workflow. Provides the ability to create complex logic.

1. Create a Workflow rule with the *Sequential* trigger type.
2. Create another Workflow rule with another trigger type. Add an action *Trigger another Workflow* and select the Workflow rule from the step 1.

!!! note

    It can be reasonable to utilize [BPM tool](bpm.md) rather than Workflows if you need more complex logic.

### Signal

Triggered when a specified signal is broadcast in the system. Only object signals can be used here. See [more info](bpm-signals.md) about signals.

----

## Conditions

You can specify conditions that must be met to trigger a Workflow rule. There are two ways how conditions can be specified: with the UI condition builder and with a Formula script.

In formula, it's possible to have multiple expressions separated by a semicolon. The evaluation of the last expression will be returned as the result.

### UI condition builder

Some available condition types:

* _equals_ – the field equals to a specific value or a value of another field;
* _was equal_ – the field was equal to a specific value before the Workflow was triggered;
* _not equals_ – the field does not equal to a specific value or a value of another field;
* _was not equal_ – the field was not equal to specific value before the Workflow was triggered;
* _empty_ – the field value is empty;
* _not empty_ – the field value is not empty;
* _changed_ – the field was changed;
* _not changed_ – the field was not changed.

### Formula conditions

Formula provides the ability to define conditions of any complexity. To read about formula syntax, follow [this article](formula.md).

!!! note

    There should not be any `;` delimiter used in formula code when it determines a condition. It should be one expression that returns a value (TRUE or FALSE).

!!! example

    Expression with the logical AND:

    ```
    status == 'New' && assignedUserId == null
    ```

----

## Actions

* [Send Email](#send-email)
* [Create Record](#create-record)
* [Create Related Record](#create-related-record)
* [Update Target Record](#update-target-record)
* [Update Related Record](#update-related-record)
* [Link with another Record](#link-with-another-record)
* [Unlink from another Record](#unlink-from-another-record)
* [Apply Assignment Rule](#apply-assignment-rule)
* [Create Notification](#create-notification)
* [Make Followed](#make-followed)
* [Trigger another Workflow](#trigger-another-workflow)
* [Run Service Action](#run-service-action)
* [Start BPM Process](#start-bpm-process)
* [Send HTTP Request](#send-http-request)
* [Execute Formula Script](#execute-formula-script)

### Send Email

System will send an email using a specified Email Template. A recipient’s email address can be taken from the target record, any related record, the current user, followers, team users or specified explicitly. The email can be sent immediately or delayed for a specific interval.

If you specify the *From* address with an address of an existing Group Email Account, then SMTP parameters of that account will be used for sending.

It's possible to add an **opt-out** link to an email body.

It's possible to specify multiple email addresses by separating them with a semicolon.

It's possible to use a formula variable when specifying an email address. Example: `{$$variable}`. As of v3.6.

Additional attachments can be added to an email using the *Attachments Variable* parameter. Specify a Formula variable name that contains an attachment ID or an array of attachment IDs. You can generate needed attachments in a Formula script in a previous action. As of v3.6.

### Create Record

The system will create a new record of any entity type. If there is a relationship between the target entity type and the entity type of records being created, it's possible to relate them.

There is the ability to define a Formula script to calculate field values.

!!! note

    Variables defined within the Formula script won't be available in following actions (or the BPM process). They are only available within the current script.

### Create Related Record

The system will create the record related to a target record.

It's possible to define a Formula script to calculate field values. Note: Variables defined within the Formula script will be only available within the current script.

### Update Target Record

Allows to change specific fields of a target record.

It's possible to define a Formula script to calculate field values. Note: Variables defined within the Formula script will be only available within the current script.

!!! note

    It's not recommended to rely on an *Update Target Record* action triggering another after-update Workflow. In some cases it won't work. It's better to define additional actions in the same Workflow or trigger a *Sequential* Workflow.

!!! warning "Important"

    Formula within an *Update Target Record* action must be utilized only for field updating. Use the *Execute Formula Script* action for any other need.

For Link-Multiple, Array, Multi-Enum, and Checklist fields it's possible to add or remove items without loosing set items. For example, adding a specific Team while preserving existing Teams.

There is the ability to **delete** the record with the following formula code: `deleted = true`;

### Update Related Record

Allows to change specific fields of a related record (or records). 

It's possible to define Formula script to calculate field values. Note: Variables defined within formula won't be passed back.

There is the ability to delete the record with the following formula code: `deleted = true`;

!!! tip

    If there can be many related records, it's reasonable to process updating these records in idle. For this, utilize the *Trigger Another Workflow* action with a small or zero delay. Define an *Update Related Record* action in a *Sequential* Workflow rule.

### Link with another Record

Relates the target record with another specific record. For example, add specific team to the record.

### Unlink from another Record

Unrelates the target record from another specific record. For example, remove a specific team from the record.

### Apply Assignment Rule

Assigns the target record to a User using a specific distribution rule. There are two available rules: *Round-Robin* and *Least-Busy*.

* Round-Robin – Users are chosen from the top to the bottom of a list and then starting again.
* Least-Busy – the User who has fewer assigned records will be chosen for assignment.

*List Report* – determines what records will be taken into account to calculate the number of assigned records for *Least-Busy* distribution. For example, we need to take into account only active Cases.

*Target Team* – Users of the selected team will take part in the assignment process.

*Target User Position* – Allows to restrict the list of users that will take part in the assignment process. Users that have the selected position (in team) will take part. If the field is set to *All*, then all team members will take part.

### Create Notification

Notify specific users with a message.

It's possible to use placeholders in the message template:

* `{entity}` – a target record;
* `{user}` – a current user.

### Make Followed

Forces specific users to follow the target record or a specified related record.

### Trigger another Workflow

Allows to make *Sequential* Workflows. It's possible to diverge Workflows by condition: you can set up a Workflow to trigger two Workflows with different conditions defined in those Workflows.

It's possible to delay executing of a *Sequential* Workflow. In a *Sequential* Workflow, you can define the condition that checks whether specific fields were changed since the parent Workflow was triggered by using _Changed_ and _Was Equal_ condition types.

A *Target* for a triggered Workflow can be substituted with a related record.

!!! note

    For complex logic, it can be more reasonable to utilize [BPM tool](bpm.md) rather than Workflows.

!!! note

    It's possible to trigger only Workflow rules of *Sequential* type.

### Run Service Action

Allows to run specific service scripts.

The following actions are available out-of-the-box:

Meetings/Calls:

* *Send Invitations* – sends invitations to event attendees

Quotes/Sales Orders/Invoices:

* *Add Items*
* *Convert Currency* – converts all currency values based on current rates (since version 5.7.0)
* *Send in Email*

Opportunities:

* *Convert Currency*

Contacts/Leads/Accounts:

* *Opt-out* – unsubscribes from a specific target list or entirely

Users:

* *Generate Password* – generates a new password for a user and sends it to their email address

Developers can write their own service actions. See [more detail](../development/workflow-service-actions.md).

### Start BPM Process

Starts a BPM process. You can specify what target record will be used for the process.

### Send HTTP Request

Provides the ability to call an external API. Can be utilized to integrate Espo with other systems.

Supported request methods:

* GET
* POST
* PUT
* PATCH
* DELETE

Additional headers can be specified.

Placeholders can be used in:

* Headers
* Request URL
* Payload JSON

Available placeholders:

* *{$attribute}* – a value of an [attribute](terms-and-naming.md#attribute) of a target record;
* *{$$variable}* – a value of a formula variable;
* *{#secrets.name}* – an App Secret; available only in headers; as of v3.4.7.

#### Payload

A payload can be specified in a JSON format or taken from a formula variable.

When specified in JSON, it's possible to use placeholders.

Example of payload with placeholders:

```
{
    "espoRecordId": "{$id}",
    "name": "{$name}",
    "userId": "{$assignedUserId}",  
    "intValue": {$$myIntegerVariable},
    "boolValue": {$$myBooleanVariable},
    "stringValue": "{$$myStringVariable}"
}
```

Alternatively, you can craft a payload in formula script, store it in a variable and then use this variable as a payload. The variable value can be an object, array, string or a scalar.

#### Handling HTTP response

A response body of an HTTP request will be available in formula with the function `workflow\lastHttpResponseBody()`. It can be accessed in the following workflow actions within the workflow rule. For example, in an Execute Formula Script action.

JSON attributes can be retrieved with the function `json\retrieve`.

!!! example

    A POST request returns a JSON body `{"id": "SOME_ID"}`. We need to store that ID. Add a *Update Target Record* action in the same Workflow rule with the formula script:

    ```
    $id = json\retrieve(workflow\lastHttpResponseBody(), 'id');
    entity\setAttribute('someIdField', $id);
    ```

!!! note

    In the context of a BPM process, the last response body is available only within the Task that contains the Send HTTP Request action. The response won't be passed further along the process flow. But if you assign the response value to a variable, the variable will be passed further.

In the context of a BPM process, it's possible to catch response errors with an Error Boundary Event. The error code can be obtained by using `bpm\caughtErrorCode` function.

### Execute Formula Script

Executes a [formula](formula.md) script.

Variables defined within the script will be passed back. They will be available in the following Workflow actions within the rule. When used in a BPM process, the defined variables will be available further in the flow.

## Using formula in actions

It's possible to define formula to calculate fields in the following actions:

* Execute Formula Script,
* Create Record,
* Update Target Record,
* Create Related Record,
* Update Related Record.

## Formula functions

#### workflow\targetEntity\attribute

`workflow\targetEntity\attribute(ATTRIBUTE_NAME)`

Returns an attribute value of the target entity. Useful when the scope is switched to a related record.

#### workflow\targetEntity\attributeFetched

`workflow\targetEntity\attributeFetched(ATTRIBUTE_NAME)`

Returns a previous attribute value of the target entity (before the Workflow was triggered).

#### workflow\trigger

`workflow\trigger(ENTITY_TYPE, ID, WORKFLOW_ID)`

Triggers another Workflow rule.

#### workflow\signalParam

`workflow\signalParam(PARAM)`

Get a signal param.

#### workflow\lastCreatedEntityId

`workflow\lastCreatedEntityId()`

*As of v3.9.*

Returns the ID of the last record that has been created within the workflow rule by a *Create Record* or *Created Related Record* action. Available only within a workflow rule and within a BPM's Task activity.

#### workflow\alert

`workflow\alert(MESSAGE, [AUTO_CLOSE], [TYPE])`

*As of v3.9.*

Sets an alert message to show for the user after a manual workflow in run. AUTO_CLOSE is boolean. TYPE can be `"warning"`, `"danger"`, `"success"`, `"info"`.

Markdown is supported. It allows to to display a link for the user.

!!! note

    The alert function only works in the context of the manual workflow. It won't work if called from a BPM processes started by the manual workflow. It won't work if called from another workflow initiated by the manual workflow.

## Config parameters

* `workflowSendRequestTimeout` – `7` – a timeout for the Send HTTP Request action;

## See also

* [Birthday notifications in EspoCRM](https://www.espocrm.com/blog/birthday-notifications-in-espocrm/)
* [Adding custom service action for Workflows](../development/workflow-service-actions.md)
* [Automated Email-to-Lead with Workflows](https://www.espocrm.com/blog/automated-email-to-lead-with-workflows/)
* [Automatic posting to stream with Workflows](https://www.espocrm.com/blog/automatic-posting-to-stream-with-workflow/)
* [Sending Telegram message with Workflows](workflows-telegram-message.md)
