# Workflows

Workflows feature is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Workflows automate your business process in an easy way. You can access workflows from Administration panel. To create a workflow rule you need to define:

* Target Entity – what entity type the workflow is applied to;
* Trigger Type – how the workflow will be triggered;
* Conditions – conditions need to be met to trigger the workflow;
* Actions – what to do if the workflow is triggered.

In this article:

* [Trigger types](#trigger-types)
* [Conditions](#conditions)
* [Actions](#actions)
* [Using formula in actions](#using-formula-in-actions)

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

For workflow rules with this trigger type, it's a common practice to have a condition that checks whether some field was 'changed'. E.g. If Case's status is changed, then execute some actions.

### Manual

*As of Advanced Pack v2.12; As of EspoCRM v7.0*

Triggered manually by a user by clicking a button (or a dropdown menu item) on the record detail view.

The ability to define:

* an element type (a button or a dropdown item);
* a label text;
* teams allowed to run the workflow;
* dynamic-logic conditions that make a button/menu-item available;
* access to the record required to be able to run the workflow (read, edit, admin).

Limitations:

* portal users are not allowed to run manual workflows.

### Scheduled

Triggered according to the defined scheduling. You can setup it to run every day, every week, etc. Actions will be applied for records returned by a specified list report. So, you need also to create a list report.

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

1. You need to create a list report showing records that met specific criteria. You can specify any columns for the report, it doesn't matter.
2. Then create a workflow rule with *Scheduled* trigger type, select the report. Specify the scheduling.
3. Specify one or multiple actions in the workflow.

Workflow rule will be running (in idle) according to the specified scheduling. On each run, it will execute the report and take all records from the report result. Then, it will apply the action (or multiple actions) for every record.

!!! example "Example, a use case"

    Send a notification email to customers who have their license expiring in 1 week. You will need a report showing contacts who have their license expiring exactly in 7 days. Setup a workflow to run once a day.

### Sequential

Supposed to be run by another workflow. Provides the ability to make a complex logic.

1. Create a workflow with sequential trigger type.
2. Create another workflow with another trigger type. Add action *Trigger another Workflow* and select the workflow from the step 1.

!!! note

    It can be reasonable to utilize [BPM tool](bpm.md) rather than Workflows if you need more complex logic.

### Signal

Triggered when a specified signal is escalated in the system. Only object signals can be used. See [more info](bpm-signals.md) about signals.

----

## Conditions

You can specify conditions that must be met to trigger the workflow. There are two ways how conditions can be specified: with the UI condition builder and with formula.

### UI condition builder

Some available condition types:

* _equals_ – the field equals to a specific value or a value of another field;
* _was equal_ – the field was equal to a specific value before the workflow was triggered;
* _not equals_ – the field does not equal to a specific value or a value of another field;
* _was not equal_ – the field was not equal to specific value before the workflow was triggered;
* _empty_ – the field value is empty;
* _not empty_ – the field value is not empty;
* _changed_ – the field was changed;
* _not changed_ – the field was not changed.

### Formula conditions

Formula provides the ability to define conditions of any complexity. To read about formula syntax, follow [this article](formula.md).

!!! note

    There should not be any `;` delimiter used in formula code when it determines a condition. It should be one expression that returns a value (TRUE of FALSE).

!!! example

    Expression with the logical AND):

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
* [Start BPM Process](#start-BPM-process)
* [Send HTTP Request](#send-http-request)
* [Execute Formula Script](#execute-formula-script)

### Send Email

System will send an email using a specified email template. A recipient’s email address can be taken from the target record, any related record, the current user, followers, team users or specified. The email can be sent immediately or delayed for a specific interval.

If you specify *From* address with the address of an existing Group Email Account, then SMTP parameters of that account will be used for sending.

It's possible to use the **opt-out** link in an email body.

### Create Record

The system will create a new record of any entity type. If there is a relationship between the target record and creating record, it's possible to relate the records.

There is the ability to define **formula** to calculate field values. Note: Variables defined within formula won't be passed back, they are only available within a current script.

### Create Related Record

System will create the record related to the target record.

It's possible to define formula to calculate field values. Note: Variables defined within formula won't be passed back, they are only available within a current script.

### Update Target Record

Allows changing of specific fields of the target record.

It's possible to define **formula** to calculate field values. You can utilize *Update Target Record* action for executing formula script without actually updating any fields.

!!! note

    Variables defined within formula won't be passed back, they are only available within the current script.

!!! warning "Important"

    Formula within this action must be utilized only for field updating. Use the *Execute Formula Script* action for any other need.

If you need to add new items to the Link-Multiple field w/o loosing existing data (e.g. Teams), you need to utilize formula function *entity\addLinkMultipleId*. Example: `entity\addLinkMultipleId('teams', 'teamId')`.

There is the ability to **delete** the record with the following formula code: `deleted = true`;

### Update Related Record

Allows changing of specific fields of the related record or records. 

It's possible to define formula to calculate field values. Note: Variables defined within formula won't be passed back, they are only available within a current script.

There is the ability to delete the record with the following formula code: `deleted = true`;

### Link with another Record

Relates the target record with another specific record. E.g. add specific team to the record.

### Unlink from another Record

Unrelates the target record from another specific record. E.g. remove a specific team from the record.

### Apply Assignment Rule

Assigns the target record to user by distribution rule. There are two available rules: Round-Robin and Least-Busy.

* Round-Robin - users are chosen from the top to the bottom of a list (team) and then starting again.
* Least-Busy - the user who has fewer assigned records will be chosen for assignment.

*List Report* - determines what records will be taken into account to calculate the number of assigned records for Least-Busy distribution. E.g. we need to take only records with active status for Cases.

*Target Team* - Users of the selected team will take part in the assignment process.

*Target User Position* - Allows to restrict the list of users that will take part in the assignment process. Users that have the selected position (in team) will take part. If the field is set to *All*, then all team members will take part.

### Create Notification

Notify specific users with the message.

It's possible to use placeholders in the message template:

* `{entity}` – a target record;
* `{user}` – a current user.

### Make Followed

Forces specific users to follow the target record or a specified related record.

### Trigger another Workflow

Allows to make sequential workflows. It's possible to diverge workflows by condition: you can setup the workflow to trigger two workflows with different conditions defined in those workflows.

It's possible to delay executing of a sequential workflow. In the sequential workflow, you can define the condition that checks whether specific fields were changed since the parent workflow was triggered by using _Changed_ and _Was Equal_ condition types.

Target for a triggered workflow can be substituted with a related record.

!!! note

    For complex logic, it can be more reasonable to utilize [BPM tool](bpm.md) rather than Workflows.

!!! note

    It's possible to trigger only workflow rules of 'Sequential' type.

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

Starts BPM process. You can specify which target will be used for a process.

### Send HTTP Request

Provides the ability to call an external API.

Supported request methods:

* POST
* PUT
* PATCH
* DELETE
* GET

Payload should be specified in JSON format (event if *Content type* is not *application/json*). It's possible to use placeholders in payload json.

Additional headers can be specified.

Placeholders can be used in:

* Headers
* Request URL
* Payload

Available placeholders:

* *{$attribute}* – a value of an attribute (field) of a target record; e.g. `{$description}`, `{$assignedUserId}` (see [info](formula.md#attribute) about attributes);
* *{$$variable}* – a value of a variable (available only in BPM process); e.g. `{$$myVariableName}`.

#### Handling HTTP response

*As of v2.6.*

A response body of a sent HTTP request will be stored in the formula variable `_lastHttpResponseBody`. This variable can be accessed in a following workflow action. JSON attributes can be retrieved with a function `json\retrieve`.

It's also possible to access the last http response body with the function `workflow\lastHttpResponseBody()` (as of v2.8.6).

!!! example

    A POST request returns a JSON body `{"id": "SOME_ID"}`. We need to store that ID. Add *Update Target Record* action in the same workflow rule and specify a formula script:

    ```
    $id = json\retrieve($_lastHttpResponseBody, 'id');
    entity\setAttribute('someIdField', $id);
    ```

!!! note

    Within a BPM process *$_lastHttpResponseBody* variable is available only within the task that contains the Send HTTP Request action. The variable won't be passed further along the process flow.

### Execute Formula Script

*As of v2.6.*

Executes a [formula](formula.md) script. Variables defined within a script will be passed back. They will be available in the next workflow actions or BPM process.

## Using formula in actions

It's possible to define formula to calculate fields in the following actions:

* Execute Formula Script,
* Create Record,
* Update Target Record,
* Create Related Record,
* Update Related Record.

### Functions

#### workflow\targetEntity\attribute

`workflow\targetEntity\attribute(ATTRIBUTE_NAME)`

Returns an attribute value of the target entity. Useful when the scope is switched to a related record.

#### workflow\targetEntity\attributeFetched

`workflow\targetEntity\attributeFetched(ATTRIBUTE_NAME)`

Returns a previous attribute value of the target entity (before the workflow was triggered).

#### workflow\trigger

`workflow\trigger(ENTITY_TYPE, ID, WORKFLOW_ID)`

Triggers another workflow rule.

## See also

* [Birthday notifications in EspoCRM](https://www.espocrm.com/blog/birthday-notifications-in-espocrm/)
* [Adding custom service action for Workflows](../development/workflow-service-actions.md)
* [Automated Email-to-Lead with Workflows](https://www.espocrm.com/blog/automated-email-to-lead-with-workflows/)
* [Automatic posting to stream with Workflows](https://www.espocrm.com/blog/automatic-posting-to-stream-with-workflow/)
* [Sending Telegram message with Workflows](workflows-telegram-message.md)
