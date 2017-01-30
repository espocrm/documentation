# Workflows

Workflows feature is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Workflows automate your business process an easy way. You can find it in the Administration panel. To create workflow rule you need to define:

* Entity Type - what entity type workflow is applied to;
* Trigger Type - when workflow will be triggered;
* Conditions - conditions need to be met to trigger workflow;
* Actions - what to do if workflow is triggered.


## Trigger Types

* **After record created** - Triggered only when a new record is created. If specified conditions are met then actions will be run.
* **After record saved** - Triggered when a new or existing record is saved. If specified conditions are met then actions will be run.
* **Scheduled** - Triggered according defined scheduling. You can setup it to run every day, every week, etc. Actions will be applied for records returned by specified list report. So you need also to create list report.
* **Sequential** - Supposed to be run by another workflow. Provides an ability to make a complex logic.


## Conditions

You can specify conditions that must be met to trigger the workflow.

Some available condition types:

* _Equals_ - whether the field equals to specific value or value of another field.
* _Was equals_ - whether the field was equal to specific value just before the workflow was triggered.
* _Changed_ - whether the field was changed just before the workflow were triggered.


## Actions

### Send Email

System will send email using a specified email template. A recipient’s email address can be taken from the target record, any related record, the current user, followers, team users or specified. Email can be sent immediately or delayed for a specific interval.

### Create Entity

System will create the new record of any entity type.

### Create Related Entity

System will create the record related to the target record. Target entity should be related with related entity by one-to-many or many-to-many link.

### Update Entity

Allows changing of specific fields of the target record.

### Update Related Entity

Allows changing of specific fields of related record or records.

### Create Notification

Notify specified users or user related to the target entity with some message. It's possible to use placeholders in message template: {entity} - target record, {user} - current user.

### Link with Another Entity

Relates the target entity with another specific entity. E.g. adds specific team to the record.

### Unlink with Another Entity

Unrelates the target entity from another specific entity. E.g. removes a specific team from the record.

### Apply Assignment Rule

Assign the target record to user by distribution rule. There are two available rules: Round-Robin and Least-Busy.

* Round-Robin - users are choosen from the top to the bottom of a list (team) and then starting again.
* Least-Busy - user who has fewer assigned records will be selected for assignment.

_List Report_ - For Least-Busy distribution determines what record will be taken into account to calculate the number of assigned records. E.g. for Cases we need to take only records with active status.

### Make Followed

Forces specific users to follow the target entity or a specific related entity.

### Trigger Another Workflow

Allows to make sequential workflows. It's possible to branch workflow by condition: you can setup the workflow to trigger two workflows with different conditions defined in that workflows.

It's possible to delay executing of sequential workflow. In sequential wokflow you can define the condition that checks whether specifiec fields were changed since the parent workflow were triggered.

### Run Service Action

Allows to execute specific php code.
