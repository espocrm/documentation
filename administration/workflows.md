# Workflows

Workflows feature is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Workflows automate your business process in an easy way. You can find it in the Administration panel. To create a workflow rule you need to define:

* Target Entity – what entity type workflow is applied to
* Trigger Type – when workflow will be triggered
* Conditions – conditions need to be met to trigger workflow
* Actions – what to do if workflow is triggered


## Trigger Types

### After record created 

Triggered only when a new record is created. If specified conditions are met, then actions will be executed.

### After record updated 

Triggered only when an existing record is updated. If specified conditions are met, then actions will be executed.

### After record saved

Triggered when a new record is created or an existing record is updated. If specified conditions are met, then actions will be executed.

For workflow rules with this type of trigger it's a common practice to have a condition that checks whether some field was 'changed'. E.g. If Case's status is changed then execute some actions.

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

### Sequential

Used rarely. Supposed to be run by another workflow. Provides an ability to make a complex logic. 

Note: For sequential workflows it's recommended to utilize [BPM tool](bpm.md) rather than a Workflows feature.

### Signal

Triggered when a specified signal is escalated in the system. Only object signals can be used. See [more info](bpm-signals.md) about signals.

----

## Conditions

You can specify conditions that must be met to trigger the workflow. There are two ways how conditions can be specified: with the UI condition builder and with formula.

### UI condition builder

Some available condition types:

* _equals_ - the field equals to a specific value or a value of another field;
* _was equal_ - the field was equal to a specific value before the workflow was triggered;
* _not equals_ - the field does not equal to a specific value or a value of another field;
* _was not equal_ - the field was not equal to specific value before the workflow was triggered;
* _empty_ - the field value is empty;
* _not empty_ - the field value is not empty;
* _changed_ - the field was changed;
* _not changed_ - the field was not changed.

### Formula conditions

Formula provides an ability to define conditions of any complexity. To read about formula syntax follow [this article](formula.md). 

Note: There should not be any `;` delimiter used in formula code when it determines a condition.

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

### Send Email

System will send an email using a specified email template. A recipient’s email address can be taken from the target record, any related record, the current user, followers, team users or specified. Email can be sent immediately or delayed for a specific interval.

It's possible to add an opt-out link to an email body.

### Create Record

System will create the new record of any entity type. If there is a relationship between the target record and creating record, it's possible to relate records. 

There is an ability to define formula to calculate fields.

### Create Related Record

System will create the record related to the target record. It's possible to define formula to calculate fields.

### Update Target Record

Allows changing of specific fields of the target record. It's possible to define formula to calculate fields. 

If you need to add new items to the Link-Multiple field w/o loosing existing data (e.g. Teams), you need to utilize formula function entity\addLinkMultipleId. Example: `entity\addLinkMultipleId('teams', 'teamId')`.

There is the ability to delete the record with the following formula code: `deleted = 1`;

### Update Related Record

Allows changing of specific fields of the related record or records. It's possible to define formula to calculate fields.

There is the ability to delete the record with the following formula code: `deleted = 1`;

### Link with another Record

Relates the target entity with another specific entity. E.g. adds specific team to the record.

### Unlink from another Record

Unrelates the target entity from another specific entity. E.g. removes a specific team from the record.

### Apply Assignment Rule

Assign the target record to user by distribution rule. There are two available rules: Round-Robin and Least-Busy.

* Round-Robin - users are chosen from the top to the bottom of a list (team) and then starting again.
* Least-Busy - user who has fewer assigned records will be chosen for assignment.

_List Report_ - For Least-Busy distribution determines what records will be taken into account to calculate the number of assigned records. E.g. for Cases we need to take only records with active status.

### Create Notification

Notify specific users with the message. It's possible to use placeholders in message template: {entity} - target record, {user} - current user.

### Make Followed

Forces specific users to follow the target entity or a specified related entity.

### Trigger another Workflow

Allows to make sequential workflows. It's possible to branch workflow by condition: you can setup the workflow to trigger two workflows with different conditions defined in that workflows.

It's possible to delay executing of sequential workflow. In the sequential workflow you can define the condition that checks whether specific fields were changed since the parent workflow were triggered by using _Changed_ and _Was Equal_ condition types.

Target for a triggered workflow can be substitued with a related record.

Note: For sequential workflows it's usually more reasonable to utilize [BPM tool](bpm.md).

### Run Service Action

Allows to run specific service scripts.

The following actions are available out-of-the-box:

Meetings/Calls:

* *Send Invitations* – sends invitations to event attendees

Quotes/Sales Orders/Invoices:

* *Add Items*
* *Convery Currency* – converts all currency values based on current rates (since version 5.7.0)
* *Send in Email*

Opportunities:

* *Convery Currency* (since version 5.7.0) 

Contacts/Leads/Accounts:

* *Opt-out* – unsubscribes from a specific target list or entirely

Users:

* *Generate Password* – generates a new password for a user and sends it to their email address (since version 5.7.0)

Developers can write their own service actions. See [more detail](../development/workflow-service-actions.md).

### Start BPM Process

Starts BPM process. You can specify which target will be used for a process.

### Send HTTP Request

Provides the ability to call external API. POST and PUT requests are suppored.

Payload should be specified in JSON format (event if *Content type* is not *application/json*). It's possible to use placeholders in payload json.

Additional headers can be specified. Placeholders can be used in headers.

## Using Formula in Actions

It's possible to define formula to calculate fields for Create Record, Update Target Record, Create Related Record, Update Related Record. For the last two, to access attributes of target entity you should use function `targetEntity\attribute`. To access attributes of target entity that was set before workflow was triggered use function `targetEntity\attributeFetched`.

Example:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```

## See also

* [Birthday notifications in EspoCRM](https://www.espocrm.com/blog/birthday-notifications-in-espocrm/)
* [Adding custom service action for Workflows](../development/workflow-service-actions.md)
* [Automated Email-to-Lead with Workflows](https://www.espocrm.com/blog/automated-email-to-lead-with-workflows/)
* [Automatic posting to stream with Workflows](https://www.espocrm.com/blog/automatic-posting-to-stream-with-workflow/)
* [Sending Telegram nessage with Workflows](https://www.espocrm.com/blog/sending-telegram-message-with-workflows/)

