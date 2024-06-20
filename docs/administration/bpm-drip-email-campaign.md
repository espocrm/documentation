# Drip Email Campaign with BPM

With the [BPM tool](bpm.md) it's possible to create drip email campaigns.

## Campaign starting

A drip email campaign for an individual target (lead or contact) will be represented as single BPM Process. A process can be started automatically or manually.

You need to create *Process Flowchart* (at Administration > Flowcharts) and choose *Lead* (or *Contact*) target type.

### Starting on lead subscription

A process instance will be started once a lead has submitted a form (and confirmed opt-in if required) and has been entered into CRM through [Lead Capture](web-to-lead.md).

You need to use *Signal Start Event* with a specific signal name. Put it on the flowchart layout and click it to edit. Specify the signal name with the value `@leadCapture.LEAD_CAPTURE_ID`, where *LEAD_CAPTURE_ID* is an ID of the lead capture record (can be obtained from its URL).

### Starting once lead gets related with target list

Can be useful if you don't utilize Lead Capture tool but use some other logic. You need to do the same steps as in the previous section but use the signal name `@relate.targetLists.TARGET_LIST_ID`, where *TARGET_LIST_ID* is an ID of the target list record (can be obtained from its URL).

### Starting manually

Every BPM process can be started manually (a user needs to have a corresponding permission granted with a role). You can use either *Signal Start Event* or regular *Start Event* in the flowchart.

## Email sending

Use multiple *[Send Message Tasks](bpm-activities.md#send-message-task)*. Each item will automatically send a specific email. You need to check *Opt-out link* parameter for these tasks to provide recipients the ability to unsubscribe from the campaign.

You need to put *Timer Intermediate Events* between tasks and specify how much time should pass before each next email sending.

You also can use [Gateways](bpm-gateways.md) to diverge a flow upon certain conditions.

## Handling opting-out

Once a target (recipient of an email) clicked on the unsubscribe link, the system broadcasts a signal `optOut.Lead.some-lead-id`, where *some-lead-id* is an actual ID of the lead record.

We want the whole process to be terminated once lead is opted out.

For this, you need to add *Event Sub-Process*. Put *Signal Start Event* inside the sub-process rectangle and specify the signal name with the value `optOut.Lead.{$id}`. You also need to check the parameter *Is Interrupting* for this event. By setting this parameter, we indicate that the whole parent process should be interrupted once the event is catched.

Here, inside the sub-process, you can also add *Task* that will do some manipulations with the target record (*Lead*).

## Example

You can get a downloadable example [here](bpm-examples.md#downloadable-examples).

![Example](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/administration/bpm/drip-email-campaign.png)
