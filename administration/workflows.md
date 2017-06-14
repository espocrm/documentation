# Workflows

Workflows feature is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/).

Workflows automate your business process an easy way. You can find it in the Administration panel. To create a workflow rule you need to define:

* Target Entity - what entity type workflow is applied to;
* Trigger Type - when workflow will be triggered;
* Conditions - conditions need to be met to trigger workflow;
* Actions - what to do if workflow is triggered.


## Trigger Types

* **After record created** - Triggered only when a new record is created. If specified conditions are met then actions will be run.
* **After record saved** - Triggered when a new or existing record is saved. If specified conditions are met then actions will be run.
* **Scheduled** - Triggered according to the defined scheduling. You can setup it to run every day, every week, etc. Actions will be applied for records returned by specified list report. So you need also to create list report.
* **Sequential** - Supposed to be run by another workflow. Provides an ability to make a complex logic.


## Conditions

You can specify conditions that must be met to trigger the workflow.

Some available condition types:

* _Equals_ - whether the field equals to specific value or value of another field.
* _Was equal_ - whether the field was equal to specific value before the workflow was triggered.
* _Changed_ - whether the field was changed before the workflow were triggered.

There are two ways how conditions can be specified: with UI confition builder or with formula. Formula provides an ability to define conditions of any complexity. To read about formula syntax follow [this article](formula.md). Note: There should not be delimiter `;` used in formula if you define condition.


## Actions

### Send Email

System will send an email using a specified email template. A recipient’s email address can be taken from the target record, any related record, the current user, followers, team users or specified. Email can be sent immediately or delayed for a specific interval.

### Create Entity

System will create the new record of any entity type. It's possible to define formula to calculate fields.

### Create Related Entity

System will create the record related to the target record. It's possible to define formula to calculate fields.

### Update Entity

Allows changing of specific fields of the target record. It's possible to define formula to calculate fields.

### Update Related Entity

Allows changing of specific fields of the related record or records. It's possible to define formula to calculate fields.

### Create Notification

Notify specified users or user related to the target entity with some message. It's possible to use placeholders in message template: {entity} - target record, {user} - current user.

### Link with Another Entity

Relates the target entity with another specific entity. E.g. adds specific team to the record.

### Unlink with Another Entity

Unrelates the target entity from another specific entity. E.g. removes a specific team from the record.

### Apply Assignment Rule

Assign the target record to user by distribution rule. There are two available rules: Round-Robin and Least-Busy.

* Round-Robin - users are choosen from the top to the bottom of a list (team) and then starting again.
* Least-Busy - user who has fewer assigned records will be chosen for assignment.

_List Report_ - For Least-Busy distribution determines what records will be taken into account to calculate the number of assigned records. E.g. for Cases we need to take only records with active status.

### Make Followed

Forces specific users to follow the target entity or a specificied related entity.

### Trigger Another Workflow

Allows to make sequential workflows. It's possible to branch workflow by condition: you can setup the workflow to trigger two workflows with different conditions defined in that workflows.

It's possible to delay executing of sequential workflow. In the sequential wokflow you can define the condition that checks whether specifiec fields were changed since the parent workflow were triggered by using _Changed_ and _Was Equal_ condition types.

### Run Service Action

Allows to execute specific php code.

## Using Formula in Actions

It's possible to define formula to calculate fields for Create Entity, Update Entity, Create Related Entity, Update Related Entity. For the last two, to access attributes of target entity you should use function `targetEntity\attribute`. To access attributes of target entity that was set before workflow was triggered use function `targetEntity\attributeFetched`.

Example:
```
name = string\concatenate(targetEntity\attribute('name'), ' ', datetime\today());
```
