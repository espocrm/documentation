# BPM Events

Events are displayed on a flowchart as circles.

* Start Events:
  * [Start](#user-content-start-event)
  * [Conditional](#user-content-conditional-start-event)
  * [Timer](#user-content-timer-start-event)
* Intermediate Events:
  * [Conditional](#user-content-conditional-intermediate-event)
  * [Timer](#user-content-timer-intermediate-event)
* End Events
  * [End](#user-content-end-event)
  * [Terminate](#user-content-terminate-end-event)
  
----

## Start Events

### Start Event

Doesn't have parameters. It's a starting point of the process. Start Event can be initiated manually by a user who has an access to create processes. The user needs to click  'Start Process' button on the list view of processes.

### Conditional Start Event

A starting point of the process. It's supposed to be triggered automatically when specified conditions are met. There are two types of trigger: 'After record created', 'After record saved'.

### Timer Start Event

A starting point of the process. It initiates processes by scheduling. You need to specify the list report that returns records for initiating processes and scheduling in crontab notation.

----

## Intermediate Events

### Conditional Intermediate Event (Catching)

This event stops the flow until specified criteria is met.

### Timer Intermediate Event (Catching)

This event stops the flow and waits as long as it is specified by event's parameters.

For more complex timer settings you can utilize [formula](formula.md). Formula scripts should return Date-Time value (in UTC timezone). Once this time comes the flow will be proceeded to the next element.

By utilizing datetime\closest formula function it's possible to set the timer to a specific time in the future, e.g. the beginning of the next working day.

----

## End Events

### End Event

Ends the current flow. It doesn't end flows running in parallel. When the flow reaches the end event and there is no anything running in parallel then process ends.

### Terminate End Event

Ends all flows. Process is subsequently ended.
