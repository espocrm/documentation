# BPM Events

Events represent something that happens during a business process. They also start, end and interrupt a process flow. Depicted as a circle.

Events can be divided into the following groups:

* Start – green circle. They are entry points of processes and sub-processes.
* Intermediate – blue circle. Occur between start and end events in a process. Can throw or catch.
* End – red circle. Define final points of process flows.
* Boundary – blue circle attached to an activity. They allow to interact with running activities. Technically, they are intermediate catching events.

All available events:

* Start Events
  * [Start](#start-event)
  * [Conditional](#conditional-start-event)
  * [Timer](#timer-start-event)
  * [Signal](#signal-start-event)
  * [Error](#error-start-event)
  * [Escalation](#escalation-start-event)
  * [Compensation](#compensation-start-event)
* Intermediate Events
  * [Conditional (catching)](#conditional-intermediate-event-catching)
  * [Timer (catching)](#timer-intermediate-event-catching)
  * [Signal (catching)](#signal-intermediate-event-catching)
  * [Signal (throwing)](#signal-intermediate-event-throwing)
  * [Message (catching)](#message-intermediate-event-catching)
  * [Escalation (throwing)](#escalation-intermediate-event-throwing)
  * [Compensation (throwing)](#compensation-intermediate-event-throwing)
* End Events
  * [End](#end-event)
  * [Terminate](#terminate-end-event)
  * [Error](#error-end-event)
  * [Escalation](#escalation-end-event)
  * [Signal](#signal-end-event)
  * [Compensation](#compensation-end-event)
* Boundary Events
  * [Error](#error-intermediate-event-boundary)
  * [Conditional](#conditional-intermediate-event-boundary)
  * [Timer](#timer-intermediate-event-boundary)
  * [Escalation](#escalation-intermediate-event-boundary)
  * [Signal](#signal-intermediate-event-boundary)
  * [Message](#message-intermediate-event-boundary)
  * [Compensation](#compensation-intermediate-event-boundary)

----

## Start Events

### Start Event

Doesn't have parameters. It's a starting point of the process. A Start Event can be initiated manually by a user who has access to create processes. This can be done either from the processes list view or from the detail view of a target record.

![Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-1.png)

Can be also used as an entry point of a sub-process.

![Start Event in sub-process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-2.png)

### Conditional Start Event

A starting point of a process. It's supposed to be triggered automatically when specified conditions are met. There are three types of triggers: 'After record created', 'After record updated', and 'After record saved'. Event conditions are defined in the same way as conditions in the Workflows tool. See [here](workflows.md#conditions).

![Conditional Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-conditional-1.png)

Can be also used to start an event sub-process.

![Conditional Start Event for event sub-process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-conditional-2.png)

### Timer Start Event

A starting point of a process. It initiates processes by scheduling. You need to select a list report (which returns records, each one will initiate a separate process) and specify execution scheduling (in the crontab notation).

![Timer Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-timer-1.png)

Can be also used to start an event sub-process. In this case, it is scheduled to be triggered at time defined by event parameters.

![Timer Start Event for event sub-process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-timer-2.png)

### Signal Start Event

Can be used to start processes and event sub-processes.

When it's used to start a process, only *object signals* can be used.

When it's used to start an event sub-process, it's possible to use placeholders in a signal name. Example: `test.{$id}`, {$id} will be replaced with the ID of the target record. 

!!! note

    Signals are not limited by a process scope. Signal triggered in one BPM process can be caught in another process.

!!! note

    Signal name cannot be empty.

![Signal Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-signal.png)

See [more info](bpm-signals.md) about signals.

### Error Start Event

Can only be used to start an event sub-process. It's triggered once an error event is thrown within the same process.

If the *Error Code* is specified, the event will be triggered only when an error with the same code occurs. If the *Error Code* is empty, it will catch any error.

It cannot be non-interrupting, because the process gets terminated once an error event is thrown.

![Error Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-error.png)

It's possible to view an error code and message in the flow log.

The error code and the exception message can be obtained further in the flow with Formula functions `bpm\caughtErrorCode` and `bpm\caughtErrorMessage`.

!!! note

    When an error event sub-process is defined inside a regular sub-process, it can be reasonable to re-throw the error in the end
    of the event sub-process with the Error End Event. It will propagate the error to the top level.

### Escalation Start Event

Can be used only to start an event sub-process. It's triggered once an escalation event it thrown within the same process.

If the Escalation Code is specified, it will be triggered only when an escalation with the same code occurs. If the Escalation Code is empty, it will catch any escalation.

![Escalation Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-escalation.png)

### Compensation Start Event

*As of v2.14.*

Starts a sub-process compensation handler. Can be used only in an event sub-process.

When the parent process initiates compensation for the sub-process activity, if there's no boundary compensation event attached to that activity, it will check whether the sub-process contains an event sub-process with a compensation start event (called Compensation Handler). Then, it executes the compensation handler. The compensation handler usually is supposed to explicitly throw compensation events to compensate activities of the sub-process.

![Compensation Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-compensation.png)

!!! note

    Actual only when the event sub-process is inside a regular sub-process.
    
In case of a multi-instance sub-process, the compensation handler is processed for each completed instance of the sub-process.

----

## Intermediate Events

### Conditional Intermediate Event (Catching)

This event stops the flow until specified criteria is met. Event conditions are defined in the same way as conditions in the Workflow tool. See [here](workflows.md#conditions). Note that BPM tool introduces [additional functions](bpm.md#additional-formula-functions) that can be used in a Formula script.

![Conditional Intermediate Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-conditional.png)

### Timer Intermediate Event (Catching)

This event stops the flow and waits as long as it is specified by the event's parameters.

For more complex timer settings you can utilize a [Formula](formula.md) script. Formula scripts should return a Date-Time value (date-time string in the UTC timezone). Once this time arrives, the flow is proceeded to the next element.

By utilizing datetime\closest Formula function, it's possible to set the timer to a specific time in the future, e.g. the beginning of the next working day.

![Timer Intermediate Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-timer.png)

### Signal Intermediate Event (Catching)

Stops the flow until a specific signal catched. Placeholders can be used in a signal name.

!!! note

    Signal name can not be empty.

See [more info](bpm-signals.md) about signals.

### Signal Intermediate Event (Throwing)

Broadcasts a specified signal. Placeholders can be used in a signal name. Example: `test.{$id}`, {$id} will be replaced with the ID of the target record.

If the first character of the signal name is `@`, it will broadcast an object signal along with the current target record. This signal type can be used only to initiate a new process or trigger a workflow rule.

![Signal Intermediate Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-signal-throw.png)

!!! note

    Signals are not limited by a process scope. Signal triggered in one BPM process can be caught in another process.

!!! note

    Signal name can not be empty.

See [more info](bpm-signals.md) about signals.

### Message Intermediate Event (Catching)

Stops the flow until an email is received.

Only emails sent not by internal users can trigger the event.

It's possible to utilize the event in pair with *Send Message* task. The event will wait until the sent email is replied. Specify that email in *Replied To* parameter.

*Related To* parameter requires that email was related (via Parent field) to a specific record.

There is the ability to specify formula conditions that the email should satisfy to trigger the event. You can utilize it to skip auto-response emails or to catch emails containing a specific ID. Formula example: `string\contains(body, $id)`.

![Message Intermediate Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-message.png)

### Escalation Intermediate Event (Throwing)

Throws an escalation. Escalation Code can be specified. Escalation can be catched by a boundary event (if it's thrown within a sub-process) or by event sub-process.

![Escalation Intermediate Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-escalation.png)


### Compensation Intermediate Event (Throwing)

*As of v2.14.*

Behaves the same as the [compensation end event](#compensation-end-event) with the only difference that it continues flow execution to the next element.

Can be useful to process compensations in a specific order.

![Compensation Intermediate Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-compensation.png)

----

## End Events

### End Event

Ends the current flow. It doesn't end flows running in parallel. When the flow reaches the end event and there isn't anything running in parallel, then process ends.

![End Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end.png)

### Terminate End Event

Ends all flows. Process is subsequently ended.

![Terminate End Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end-terminate.png)


### Error End Event

Terminates the process and triggers an error. Error Code can be specified. Error can be catched by a boundary event (if it's thrown within a sub-process) or by event sub-process.

![Error End Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end-error.png)

!!! note

    Uncaught errors are propagated to the parent process. As of v2.14.

### Escalation End Event

Ends the flow and triggers an escalation. Escalation Code can be specified. Escalation can be catched by a boundary event (if it's thrown within a sub-process) or by event sub-process.

![Escalation End Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end-escalation.png)

### Signal End Event

Ends the flow and broadcasts a specified signal.

Placeholders can be used in a signal name. Example: `test.{$id}`, {$id} will be replaced with the ID of the target record.

If the first character of the signal name is `@`, it will broadcast an object signal along with the current target record. This signal type can be used only to initiate a new process or trigger a workflow rule.

!!! note

    Signals are not limited by a process scope. Signal triggered in one BPM process can be caught in another process.

!!! note

    Signal name can not be empty.

See [more info](bpm-signals.md) about signals.

### Compensation End Event

*As of v2.14.*

Initiates compensation and ends the flow once compensation is completed.

Can compensate a specific activity (by specifying an activity's ID, the activity ID can be obtained on the detail view of the activity) or all activities (that are visible from the event). Only completed activities (not failed or interrupted) are compensated.

An activity is considered visible from the throwing Event when:

* It is contained in normal flow at the same level of the process/sub-process.
* It is contained in the parent process/sub-process of an event sub-process in which the Event is contained.

In the same level:

![Compensation End Event, same level](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end-compensation-2.png)

From the event sub-process:

![Compensation End Event, event sub-process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end-compensation-1.png)

When the activity ID is omitted, all visible completed activities are compensated in the order reverse to their instantiation.

Compensation is supposed to perform undo actions when something went wrong. Usually, compensation is triggered from error handlers.

----

## Boundary Events

Boundary events can be attached to activities (usually sub-processes). Boundary event can interrupt an activity (if param *Is Interrupting* is checked). Non interrupting boundary event can be triggered multiple times.


### Error Intermediate Event (Boundary)

It's triggered once an error event is thrown withing the activity (sub-process) it's attached to.

It can't be non interrupting, because the activity gets terminated once an error event is thrown.

If Error Code is specified, it will be triggered only when an error with the same code occurs. If Error Code is empty, it will catch any error.

![Error Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end-error.png)

It's possible to view an error code and message in the flow log (as of v2.14).

The error code and the exception message can be obtained further in the flow with formula functions `bpm\caughtErrorCode` and `bpm\caughtErrorMessage` (as of v2.14).

!!! note

    If the error event is attached to a task with the *Send HTTP Request* action, it's possible to catch a specific response error code (e.g. 404, 403). As of v2.8.6.


### Conditional Intermediate Event (Boundary)

Triggered when specific conditions are met. Note that non interrupting event can be triggered multiple times, when conditions get met, then get not met, and met again.

![Conditional Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-conditional-boundary.png)


### Timer Intermediate Event (Boundary)

Triggered after a specific period of time. The timer starts once the activity starts.

![Timer Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-timer-boundary.png)


### Escalation Intermediate Event (Boundary)

It's triggered once an escalation event is thrown within the activity (sub-process) it's attached to.

If Escalation Code is specified, it will be triggered only when an escalation with the same code occurs. If Escalation Code is empty, it will catch any escalation.


![Escalation Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-escalation.png)


### Signal Intermediate Event (Boundary)

It's triggered once a specific signal is broadcasted. Note that a signal can be triggered from anywhere in the system, not necessarily in the same process.

Placeholders can be used in a signal name. E.g. `test.{$id}`, {$id} will be replaced with the target's ID.

![Signal Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-signal-boundary.png)

### Message Intermediate Event (Boundary)

Triggered once an email is received. It functions the same as *Message Intermediate Event (Catching)*.

### Compensation Intermediate Event (Boundary)

*As of v2.14.*

Triggered once compensation is initiated for an activity it is attached to. Must be connected with a compensation activity (task or sub-process).

![Compensation Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-compensation-boundary.png)

!!! note

    Compensation can be applied only for activities that were successfully completed.

When it's a sub-process being compensated, the compensation activity does not have access to the sub-process internal state (called Black-Box compensation). To be able to access the internal state, use the compensation event sub-process inside the sub-process instead.

In case of a multi-instance sub-process, the compensation activity is processed for each completed instance of the sub-process.

