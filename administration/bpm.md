# Business Process Management

Business Process Management (BPM) tool provides the ability to model and automate business processes in EspoCRM. It's an engine executing business processes described in BPMN 2.0 standard. BPM tool is available in [Advanced Pack](https://www.espocrm.com/extensions/advanced-pack/) extension.

![BPM example](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/bpm-1.png)

### Difference from Workflows tool

Workflows tool is intended for automation of simple business rules, w/o sequential flow items, when there is no need to display the flow graphically.

BPM tool is intended for more complex business flows, where there can be diverging and converging flows, execution delays, user interactions. A flowchart view makes the business process more comprehensible for a human, a log allows to see how the process was held.

## Process Flowcharts

The link to process flowcharts is available from administration panel. It also can be added as a tab on the navigation panel.

Flowcharts are intended for business processes modeling. Administrator can create and edit flowcharts. Regular users can only view flowcharts.

Every flowchart has its specific entity type (Target Type field). The flowchart determines execution of future process instances. It comprises flowchart elements and connections between elements.

If process flowchart has the unchecked 'Is Active' field then it won't initiate process instances.

To show details and parameters of a certain flowchart element you need to click on it. In edit mode you will be able to edit parameters.

## Processes

Processes are available from administration panel. The link also can be added as a tab on the navigation panel.

Process represents business process instance. When it's initiated, it gets the status 'Started'. When process is finished, it gets the status 'Ended'. The process can also be stopped manually by a user who has an access to edit the process. If it's stopped manually, it gets status the 'Stopped'.

The process is executed according to the flowchart. Flowchart of process can't be changed after process is started.

The process obligatorily is related to single target record.

Processes can be started automatically (upon specific conditions or by scheduling) or manually (where there is at least one Start Event in the flowchart). To start process manually the user needs to click 'Start Process' button on the list view of processes.

## Flowchart Elements

* [Events](bpm-events.md)
* [Gateways](bpm-gateways.md)
* [Activities](bpm-activities.md)
* Flows
  * [Sequence](#user-content-sequence-flow)


### Flows

#### Sequence Flow

Represented as a solid arrow. Indicates the order in which process elements will be executed.

## Conditions

Conditional events, exclusive and inclusive diverging gateways have conditions that determine the flow of the process.

Through UI there is an ability to check conditions for the following records:

* Target record;
* Records related to the target through many-to-one and children-to-parent relationships;
* Records created by the process via tasks;
* User task records, which allows checking the resolution.

It's also possible to define conditions in [Espo-formula](formula.md) language.

Conditions in BPM tool are the same as in Workflow feature. See more details about [workflow's conditions](workflows.md#conditions).

## Examples

### Example 1

![Example 1](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-1.png)

### Example 2

![Example 2](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-2.png)

### Example 3

![Example 3](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/administration/bpm/example-3.png)
