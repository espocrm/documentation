# Business Process Management

Business Process Management (BPM) tool provides the ability to model and automate business processes in EspoCRM. It's an engine executing business processes described in BPMN 2.0 standard. BPM tool is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) extension.

![BPM example](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/bpm-1.png)

### Difference from Workflows tool

Workflows tool is intended for automation of simple business rules, w/o sequential flow items, when there is no need to display the flow graphically.

BPM tool is intended for more complex business flows, where there can be diverging and converging flows, execution delays, user interactions. A flowchart view makes the business process more comprehensible for a human, a log allows to see how the process was held.

In this article:

* [Process Flowcharts](#process-flowcharts)
* [Processes](#processes)
* [Flowchart Elements](#flowchart-elements)
  * [Events](bpm-events.md)
  * [Gateways](bpm-gateways.md)
  * [Activities](bpm-activities.md)
  * [Flows](#flows)
* [Conditions](#conditions)
* [Additional formula functions](#additional-formula-functions)
* [Examples](#examples)

## See also

* [Signals](bpm-signals.md)
* [Drip Email Campaign with BPM](bpm-drip-email-campaign.md)
* [Tracking URLs with BPM](bpm-tracking-urls.md)
  

## Process Flowcharts

The link to process flowcharts is available from administration panel. It also can be added as a tab on the navigation panel.

Flowcharts are intended for business processes modeling. Administrator can create and edit flowcharts. Regular users can only view flowcharts.

Every flowchart has its specific entity type (Target Type field). The flowchart determines execution of future process instances. It comprises flowchart elements and connections between elements.

If process flowchart has the unchecked 'Is Active' field then it won't initiate process instances.

To show details and parameters of a certain flowchart element you need to click on it. In the edit mode you will be able to edit parameters.

## Processes

Processes are available from administration panel. The link also can be added as a tab on the navigation panel.

Process represents business process instance. When it's initiated, it gets the status 'Started'. When process is finished, it gets the status 'Ended'. 

The process is executed according to the flowchart. The flowchart of process can't be changed after a process is started.

The process is obligatorily related to single target record.

Processes can be **started**:

* Automatically – Upon specific conditions, signal, or scheduling, described in the flowchart; this is the main method.
* Manually – To start process manually the user needs to click *Start Process* button on the list view of processes or from the record detail view from the dropdown in the top-right corner.
* With Workflow rule – *Start BPM Process* action; It allows to pass a related record as a target for the process.

The execution of the process is visualized with colors highlighting flow nodes:

* green – processed
* yellow – pending
* violet – in process
* gray – failed

![Process execution](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/process-execution.png)

### Manipulating

A process can be **stopped manually** by a user who has an 'edit' access to the process. You can do it from the dropdown menu next to the Edit button.

It's possible to **manually reject or interrupt** pending and active flow nodes. You can do it from the Log panel on the process detail view in the dropdown menu of a specific flow node. Note, that after rejecting a flow node it's possible that the process will become suspended and won't ever end by itself. You will need either manually stop it or start a flow from any node to continue executing.

It's possible to **manually start a flow from any element** of an already started process. You need to click on a specific flowchart element on the process detail view and then click the button *Start flow from here*.

### Self-removal

You can setup BPM process to remove itself. Add *Task* > *Update Process Record*. Add in formula: `deleted = 1;`.

## Flowchart Elements

* [Events](bpm-events.md)
* [Gateways](bpm-gateways.md)
* [Activities](bpm-activities.md)
* Flows
  * [Sequence](#user-content-sequence-flow)

### Flows

#### Sequence Flow

Represented as a solid arrow. It indicates the order in which process elements will be executed.

## Conditions

Conditional events, exclusive and inclusive diverging gateways have conditions that determine the flow of the process.

Through UI there is an ability to check conditions for the following records:

* Target record;
* Records related to the target through many-to-one and children-to-parent relationships;
* Records created by the process via tasks;
* User task records, which allows checking the resolution.

It's also possible to define conditions in [Espo-formula](formula.md) language.

Conditions in BPM tool are the same as in Workflow feature. See more details about [workflow's conditions](workflows.md#conditions).

## Additional formula functions

Formula can be utilized in conditions, script tasks, various task actions. 

Available since version 2.4.0.

#### bpm\targetEntity\attribute

`bpm\targetEntity\attribute(ATTRIBUTE)` Fetches an attribute value of a target record.

#### bpm\createdEntity\attribute

`bpm\createdEntity\attribute(ALIAS_ID, ATTRIBUTE)` Fetches an attribute value of a record created within a process. ALIAS_ID can be obtained from the detail view of Task, that has an action creating a record.

#### bpm\processEntity\attribute

`bpm\processEntity\attribute(ATTRIBUTE)` Fetches an attribute value of a process record.

#### bpm\startProcess

`bpm\startProcess(FLOWCHART_ID, TARGET_TYPE, TARGET_ID, [ELEMENT_ID])` Starts a process. Available since Advanced Pack 2.5.2.

Example:

`bpm\startProcess('flowchart-id', 'Account', 'account-id');`


## Examples

### Downloadable examples

You can download CSV file with examples and then import it into your EspoCRM instance.

1. Download [CSV file](https://raw.githubusercontent.com/espocrm/documentation/master/_static/csv/bpm-examples.csv) with examples.
2. In your EspoCRM, go to Administration > Import, select *Process Flowchart* entity type and upload the CSV file. Go throgh import steps.
3. You will be able to find examples at Administration > Flowcharts.

Note: These flowcharts are not active, so they won't run until you set them active.

Included examples: 

* User task
* Drip email campaign
* Tracking URLs
* Sub-process
* Email reply catching

### Screenshot-only examples

#### Example 1

![Example 1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-1.png)

#### Example 2

![Example 2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-2.png)

#### Example 3

![Example 3](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-3.png)

#### Example 4

![Example 4](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-4.png)

