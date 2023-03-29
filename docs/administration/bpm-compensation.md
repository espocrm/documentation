# Compensation

*As of v7.4.*

Compensation mechanism is supposed to perform undo actions when something went wrong. Only successfuly completed activities can be compensated. Both tasks and sub-processes can be compensated.

Compensation is initiated by triggering a Compensation Event (usually from an error handler). The throwing compensation event can specify an activity's ID that needs to be compensated. If the ID is omitted, all *visible* *compensable* activities will be compensated in the order reverse to their instantiation.

!!! note

    Compensation can be applied only for activities that were successfuly completed. A sub-process that is not yet finished cannot be compensated from outside.

An activity is **compensable** if one of the two following conditions is met:

* Activity has a Boundary Compensation Event attached.
* Activity is a sub-process that contains a Compensation Event Sub-Process.

Boundary compensation:

![Compensation Intermediate Event (Boundary)](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-intermediate-compensation-boundary.png)

When a sub-process is compensated with the boundary event, the compensation activity does not have access to the sub-process internal state (called Black-Box compensation). To be able to access the internal state, use the Compensation Event Sub-Process inside the sub-process.

Compensation event sub-process:

![Compensation Start Event](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-start-compensation.png)

When the parent process initiates compensation for the sub-process activity, if there's no boundary compensation event attached to that actvity, it will check whether the sub-process contains an event sub-process with a compensation start event (called Compensation Handler). Then it executes the compensation handler. The compensation handler usually is supposed to explicitly throw compensation events to compensate activities of the sub-process.

An activity is considered **visible** from the throwing Event when:

* It is contained in normal flow at the same level of the process/sub-process.
* It is contained in the parent process/sub-process of an event sub-process in which the Event is contained.

In the same level:

![Compensation End Event, same level](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end-compensation-2.png)

From the event sub-process:

![Compensation End Event, event sub-process](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/event-end-compensation-1.png)
