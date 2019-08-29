# BPM Activities

Activities are displayed as rounded rectangles.

* [Task](#user-content-task)
* [Send Message Task](#user-content-send-message-task)
* [User Task](#user-content-user-task)
* [Script Task](#user-content-script-task)

----

## Task

Task can execute following the actions:

* Create Record - creates new record of any entity type;
* Create Related Record - creates new record related to the target record;
* Update Target Record;
* Update Related Record - updates the record or records related to the target record;
* Update Created Record - updates specific field of any record created in the current process;
* Update Process Record - can be used to assign the process to specific user or team;
* Link to Another Record - links the target record with a specified record;
* Unlink from Another Record - unlinks the target record from the specified record;
* Apply Assignment Rule - assigns the target record, the process record or any record created by the process according to the specific rule;
* Create Notification - creates in-app notification for specific users;
* Make Followed - makes specific users follow the target record, the process record or any record created by the process;
* Trigger Another Workflow Rule - runs a workflow rule of the sequential type, target can be substituted with a related or created record (since version 2.3.14);
* Run Service Action - runs custom service actions implemented by developers.

Actions available for task are almost the same as in Workflow feature. See more details about [workflow's actions](workflows.md#actions).

----

## Send Message Task

Sends email message to specific recipient.

----

## User Task

Provides a flexible ability of user interaction. It stops execution until the user (specified explicitly or by assignment rule) resolves the task. Process User Task record will be created in the system. By default there are three action types: Approve, Review, Accomplish.

* Approve type requires the user to chose between 'Approved' and 'Declined'.
* Review type gives only one option: 'Reviewed'.
* Accomplish type has two options: 'Completed' and 'Failed'.

The user assigned to the created Process User Task record will receive in-app notification. Administrator can also enable email notifications for Process User Tasks at Administration > Notifications > Email Notifications.

Users can also add Process User Tasks dashlet on their dashboard to see their actual process user tasks.

### Resolution

It's possible to read the resolution of the passed user task within diverging gateways or conditional events, making ramification in the process flow.

### Canceling

Created User Task can be canceled by a process. There are two ways:

1. Using 'Update Created Record' action (within Task activity), setting 'Is Canceled' field to 'true'. 
2. Using interrupting boundary event (attached to User Task activity) (since advanced pack 2.4.0).

----

## Script Task

Executes the script in [espo-formula](formula.md) language. All set variables (`$variableName`) will be stored and available within the process.
