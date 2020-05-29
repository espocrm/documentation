# BPM Events

Events are displayed on a flowchart as circles.

* Start Events
  * [Start](#start-event)
  * [Conditional](#conditional-start-event)
  * [Timer](#timer-start-event)
  * [Signal](#signal-start-event)
  * [Error](#error-start-event)
  * [Escalation](#escalation-start-event)
* Intermediate Events
  * [Conditional (catching)](#conditional-intermediate-event-catching)
  * [Timer (catching)](#timer-intermediate-event-catching)
  * [Signal (catching)](#signal-intermediate-event-catching)
  * [Signal (throwing)](#signal-intermediate-event-throwing)
  * [Message (catching)](#message-intermediate-event-catching)
  * [Escalation (throwing)](#escalation-intermediate-event-throwing)
* End Events
  * [End](#end-event)
  * [Terminate](#terminate-end-event)
  * [Error](#error-end-event)
  * [Escalation](#escalation-end-event)
  * [Signal](#signal-end-event)
* Boundary Events
  * [Error](#error-intermediate-event-boundary)
  * [Conditional](#conditional-intermediate-event-boundary)
  * [Timer](#timer-intermediate-event-boundary)
  * [Escalation](#escalation-intermediate-event-boundary)
  * [Signal](#signal-intermediate-event-boundary)
  * [Message](#message-intermediate-event-boundary)

----

## Start Events

### Start Event

Doesn't have parameters. It's a starting point of the process. Start Event can be initiated manually by a user who has an access to create processes. The user needs to click 'Start Process' button on the list view of processes.

![Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-1.png)

Can be used as an entry point of a sub-process.

![Start Event in sub-process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-2.png)

### Conditional Start Event

A starting point of the process. It's supposed to be triggered automatically when specified conditions are met. There are two types of triggers: 'After record created', 'After record saved'.

![Conditional Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-conditional-1.png)

Can be used to start an event sub-process.

![Conditional Start Event for event sub-process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-conditional-2.png)

### Timer Start Event

A starting point of the process. It initiates processes by scheduling. You need to specify the list report that returns records for initiating processes and scheduling in crontab notation.

![Timer Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-timer-1.png)

Can be used to start an event sub-process.

![Timer Start Event for event sub-process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-timer-2.png)

### Signal Start Event

Can be used to start processes and event sub-processes.

When it is used to start a process, only object signals can be used.

When it is used to start an event sub-process, it's possible to use placeholders in a signal name. Example: `test.{$id}`, {$id} will be replaced with target's id. 

Note: Signals are not limited by a process scope. Signal triggered in one BPM process can be caught in another process.

Note: Signal name can not be empty.

![Signal Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-signal.png)

See [more info](bpm-signals.md) about signals.

### Error Start Event

Can only be used to start an event sub-process. It's triggered once an error event is thrown within the same process.

If Error Code is specified, it will be triggered only when an error with the same code occurs. If Error Code is empty, it will catch any error.

It can't be non interrupting, because a process gets terminated once an error event is thrown.

![Error Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-error.png)

### Escalation Start Event

Can only be used to start an event sub-process. It's triggered once an escalation event it thrown within the same process.

If Escalation Code is specified, it will be triggered only when an escalation with the same code occurs. If Escalation Code is empty, it will catch any escalation.

![Escalation Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-escalation.png)

----

## Intermediate Events

### Conditional Intermediate Event (Catching)

This event stops the flow until specified criteria is met.

![Conditional Intermediate Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-conditional.png)

### Timer Intermediate Event (Catching)

This event stops the flow and waits as long as it is specified by the event's parameters.

For more complex timer settings you can utilize [formula](formula.md). Formula scripts should return Date-Time value (in UTC timezone). Once this time comes, the flow will be proceeded to the next element.

By utilizing datetime\closest formula function it's possible to set the timer to a specific time in the future, e.g. the beginning of the next working day.

![Timer Intermediate Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-timer.png)

### Signal Intermediate Event (Catching)

Stops the flow until a specific signal catched. Placeholders can be used in a signal name.

Note: Signal name can not be empty.

See [more info](bpm-signals.md) about signals.

### Signal Intermediate Event (Throwing)

Broadcasts a specified signal. Placeholders can be used in a signal name. Example: `test.{$id}`, {$id} will be replaced with target's id.

If the first character of the signal name is `@`, it will broadcast an object signal along with the current target record. This signal type can be used only to initiate a new process or trigger a workflow rule.

![Signal Intermediate Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-signal-throw.png)

Note: Signals are not limited by a process scope. Signal triggered in one BPM process can be caught in another process.

Note: Signal name can not be empty.

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

### Escalation End Event

Ends the flow and triggers an escalation. Escalation Code can be specified. Escalation can be catched by a boundary event (if it's thrown within a sub-process) or by event sub-process.

![Escalation End Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end-escalation.png)

### Signal End Event

Ends the flow and broadcasts a specified signal.

Placeholders can be used in a signal name. Example: `test.{$id}`, {$id} will be replaced with target's id.

If the first character of the signal name is `@`, it will broadcast an object signal along with the current target record. This signal type can be used only to initiate a new process or trigger a workflow rule.

Note: Signals are not limited by a process scope. Signal triggered in one BPM process can be caught in another process.

Note: Signal name can not be empty.

See [more info](bpm-signals.md) about signals.

----

## Boundary Events

Boundary events can be attached to activities (usually sub-processes). Boundary event can interrupt an activity (if param *Is Interrupting* is checked). Non interrupting boundary event can be triggered multiple times.


### Error Intermediate Event (Boundary)

It's triggered once an error event is thrown withing the activity (sub-process) it's attached to.

It can't be non interrupting, because the activity gets terminated once an error event is thrown.

If Error Code is specified, it will be triggered only when an error with the same code occurs. If Error Code is empty, it will catch any error.

![Error Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end-error.png)


### Conditional Intermediate Event (Boundary)

Triggered when specific conditions are met. Note, that non interrupting event can be triggered multiple times, when coditions get met, then get not met, and met again.

![Conditional Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-conditional-boundary.png)


### Timer Intermediate Event (Boundary)

Triggered after a specific period of time. The timer starts once the activity starts.

![Timer Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-timer-boundary.png)


### Escalation Intermediate Event (Boundary)

It's triggered once an escalation event is thrown within the activity (sub-process) it's attached to.

If Escalation Code is specified, it will be triggered only when an escalation with the same code occurs. If Escalation Code is empty, it will catch any escalation.


![Escalation Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-escalation.png)


### Signal Intermediate Event (Boundary)

It's triggered once a specific signal is broadcasted. Note, that a signal can be triggered from anywhere in the system, not necessarily in the same process.

Placeholders can be used in a signal name. E.g. `test.{$id}`, {$id} will be replaced with target's id.

![Signal Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-signal-boundary.png)

### Message Intermediate Event (Boundary)

Triggered once an email is received. It functions the same as *Message Intermediate Event (Catching)*.
