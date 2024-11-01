# Workflows

The Workflows tool is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

The Workflows tool automates your business processes in an easy way. You can access Workflows from Administration panel. To create a Workflow rule you need to define:

* Target Entity – what entity type the Workflow is applied to;
* Trigger Type – how the Workflow will be triggered;
* Conditions – conditions need to be met to trigger the Workflow;
* Actions – what to do if the Workflow is triggered.

In this article:

* [Trigger types](#trigger-types)
* [Conditions](#conditions)
* [Actions](#actions)
* [Using formula in actions](#using-formula-in-actions)
* [Formula functions](#formula-functions)
* [See also](#see-also)

## Trigger types

* [After record created](#after-record-created)
* [After record updated](#after-record-updated)
* [After record saved](#after-record-saved)
* [Manual](#manual)
* [Scheduled](#scheduled)
* [Sequential](#sequential)
* [Signal](#signal)

### After record created

Triggered only when a new record is created. If specified conditions are met, then actions will be executed.

### After record updated

Triggered only when an existing record is updated. If specified conditions are met, then actions will be executed.

### After record saved

Triggered when a new record is created or an existing record is updated. If specified conditions are met, then actions will be executed.

For Workflow rules with this trigger type, it's a common practice to have a condition that checks whether some field was 'changed'. E.g. If a Case's status is changed, then do some actions.

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

### Scheduled

Triggered according to the defined scheduling. You can setup it to run every day, every week, etc. Actions will be applied for records returned by a specified *List* Report. Hence you need also to create a *List* Report.

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

1. You need to create a *List* Report showing records that met specific criteria. You can specify any columns for the Report, it doesn't matter.
2. Then create a Workflow rule with the *Scheduled* trigger type, select the Report. Specify the scheduling.
3. Specify one or multiple actions in the Workflow.

The Workflow rule will be running (in idle) according to the specified scheduling. On each run, it will execute the Report and take all records from the Report result. Then, it will apply the action (or multiple actions) for every record.

!!! example "Example, a use case"

    Send a notification email to customers who have their license expiring in 1 week. You will need a report showing contacts who have their license expiring exactly in 7 days. Setup a Workflow to run once a day.

### Sequential

Is supposed to be run by another Workflow. Provides the ability to make a complex logic.

1. Create a Workflow with the *Sequential* trigger type.
2. Create another Workflow with another trigger type. Add an action *Trigger another Workflow* and select the Workflow from the step 1.

!!! note

    It can be reasonable to utilize [BPM tool](bpm.md) rather than Workflows if you need more complex logic.

### Signal

Triggered when a specified signal is escalated in the system. Only object signals can be used. See [more info](bpm-signals.md) about signals.

----

## Conditions

You can specify conditions that must be met to trigger the Workflow. There are two ways how conditions can be specified: with the UI condition builder and with formula.

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

System will send an email using a specified email template. A recipient’s email address can be taken from the target record, any related record, the current user, followers, team users or specified. The email can be sent immediately or delayed for a specific interval.

If you specify *From* address with the address of an existing Group Email Account, then SMTP parameters of that account will be used for sending.

It's possible to add an **opt-out** link to an email body.

### Create Record

The system will create a new record of any entity type. If there is a relationship between the target record and creating record, it's possible to relate the records.

There is the ability to define **formula** to calculate field values.

!!! note

    Variables defined within the formula script won't be passed back, they are only available within a current script.

### Create Related Record

System will create the record related to the target record.

It's possible to define formula to calculate field values. Note: Variables defined within formula won't be passed back, they are only available within a current script.

### Update Target Record

Allows changing of specific fields of the target record.

It's possible to define **formula** to calculate field values. You can utilize *Update Target Record* action for executing formula script without actually updating any fields.

!!! note

    Variables defined within the formula won't be passed back, they are only available within the current script.

!!! note

    It's not recommended to rely on an *Update Target Record* action triggering another after-update Workflow. In some cases it won't work. It's better to define additional actions in the same Workflow or trigger a *Sequential* Workflow.

!!! warning "Important"

    Formula within this an *Update Target Record* action must be utilized only for field updating. Use the *Execute Formula Script* action for any other need.

For Link-Multiple, Array, Multi-Enum and Checklist fields it's possible to add or remove items without loosing set items. For example, adding a specific Team while preserving existing Teams.

There is the ability to **delete** the record with the following formula code: `deleted = true`;

### Update Related Record

Allows changing of specific fields of the related record or records. 

It's possible to define formula to calculate field values. Note: Variables defined within formula won't be passed back, they are only available within a current script.

There is the ability to delete the record with the following formula code: `deleted = true`;

!!! tip

    If there can be many related records, it's reasonable to process updating these records in idle. For this, utilize *Trigger Another Workflow* action with a small or zero delay. Define an *Update Related Record* action in the *Sequential* Workflow rule.

### Link with another Record

Relates the target record with another specific record. E.g. add specific team to the record.

### Unlink from another Record

Unrelates the target record from another specific record. E.g. remove a specific team from the record.

### Apply Assignment Rule

Assigns the target record to a User by a distribution rule. There are two available rules: *Round-Robin* and *Least-Busy*.

* Round-Robin – Users are chosen from the top to the bottom of a list (team) and then starting again.
* Least-Busy – the User who has fewer assigned records will be chosen for assignment.

*List Report* – determines what records will be taken into account to calculate the number of assigned records for *Least-Busy* distribution. E.g. we need to take only records with active status for Cases.

*Target Team* – Users of the selected team will take part in the assignment process.

*Target User Position* – Allows to restrict the list of users that will take part in the assignment process. Users that have the selected position (in team) will take part. If the field is set to *All*, then all team members will take part.

### Create Notification

Notify specific users with the message.

It's possible to use placeholders in the message template:

* `{entity}` – a target record;
* `{user}` – a current user.

### Make Followed

Forces specific users to follow the target record or a specified related record.

### Trigger another Workflow

Allows to make *Sequential* Workflows. It's possible to diverge Workflows by condition: you can setup a Workflow to trigger two Workflows with different conditions defined in those Workflows.

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

Starts a BPM process. You can specify which target record will be used for the process.

### Send HTTP Request

Provides the ability to call an external API.

Supported request methods:

* GET
* POST
* PUT
* PATCH
* DELETE

Payload can be taken from a formula variable (as of v2.15) or specified in a JSON format.

Additional headers can be specified.

Placeholders can be used in:

* Headers
* Request URL
* Payload JSON

Available placeholders:

* *{$attribute}* – a value of an attribute (field) of a target record; e.g. `{$description}`, `{$assignedUserId}` (see [info](formula.md#attribute) about attributes);
* *{$$variable}* – a value of a variable (available only in BPM process); e.g. `{$$myVariableName}`.

Additionally, in headers, App Secrets can be added with a placeholder *{#secrets.name}*  (as of v3.4.7).

A payload example:

```json
    {
        "int": {$$myIntegerVariable},
        "bool": {$$myBooleanVariable},
        "string": "{$$myStringVariable}"
    }
```

#### Handling HTTP response

A response body of a sent HTTP request will be available in formula with a function `workflow\lastHttpResponseBody()`. It can be accessed in a following Workflow action. JSON attributes can be retrieved with a function `json\retrieve`.

!!! example

    A POST request returns a JSON body `{"id": "SOME_ID"}`. We need to store that ID. Add *Update Target Record* action in the same Workflow rule and specify a formula script:

    ```
    $id = json\retrieve(workflow\lastHttpResponseBody(), 'id');
    entity\setAttribute('someIdField', $id);
    ```

!!! note

    Within a BPM process the last response body is available only within the task that contains the Send HTTP Request action. The variable won't be passed further along the process flow.

### Execute Formula Script

Executes a [formula](formula.md) script. Variables defined within a script will be passed back. They will be available in the next Workflow actions or BPM process.

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

## See also

* [Birthday notifications in EspoCRM](https://www.espocrm.com/blog/birthday-notifications-in-espocrm/)
* [Adding custom service action for Workflows](../development/workflow-service-actions.md)
* [Automated Email-to-Lead with Workflows](https://www.espocrm.com/blog/automated-email-to-lead-with-workflows/)
* [Automatic posting to stream with Workflows](https://www.espocrm.com/blog/automatic-posting-to-stream-with-workflow/)
* [Sending Telegram message with Workflows](workflows-telegram-message.md)
