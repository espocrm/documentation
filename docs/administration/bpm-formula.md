# BPM Formula Functions

The [BPM tool](bpm.md) provides additional formula functions.

Formula script can be utilized in conditions, script tasks, various task actions. Some functions can be used in a workflow (broadcastSignal, startProcess).

* [bpm\targetEntity\attribute](##bpmtargetentityattribute)
* [bpm\createdEntity\attribute](#bpmcreatedentityattribute)
* [bpm\processEntity\attribute](#bpmprocessEntityattribute)
* [bpm\startProcess](#bpmstartprocess)
* [bpm\broadcastSignal](#bpmbroadcastsignal)

### bpm\targetEntity\attribute

`bpm\targetEntity\attribute(ATTRIBUTE)`

Fetches an attribute value of a target record.

### bpm\createdEntity\attribute

`bpm\createdEntity\attribute(ALIAS_ID, ATTRIBUTE)`

Fetches an attribute value of a record created within a process. ALIAS_ID can be obtained from the detail view of Task, that has an action creating a record.

### bpm\processEntity\attribute

`bpm\processEntity\attribute(ATTRIBUTE)`

Fetches an attribute value of a process record.

### bpm\startProcess

`bpm\startProcess(FLOWCHART_ID, TARGET_TYPE, TARGET_ID, [ELEMENT_ID])`

Starts a process. Available since Advanced Pack v2.5.2.

Example:

`bpm\startProcess('flowchart-id', 'Account', 'account-id');`

### bpm\broadcastSignal

* `bpm\broadcastSignal(SIGNAL_NAME)` – broadcast a regular signal (as of v2.7.1)
* `bpm\broadcastSignal(SIGNAL_NAME, ENTITY_TYPE, ENTITY_ID)` – broadcast an object signal (as of v2.8.5)

It can be useful to broadcast a custom signal from a worfklow rule and then catch it inside a running process. A workflow rule will perform some condition checking and only after than will broadcast a signal.

#### Example (regular signal)

```
$signalName = string\concatenate(
    'notePostedInCaseBySupportManager.',
    entity\attribute('id')
);

bpm\broadcastSignal($signalName);
```

Then it will be possible to catch the signal in a BPM process by listening to the signal `notePostedInCaseBySupportManager.{$id}`.

#### Example (object signal)

Workflow on Quote Item broadcasts a signal when amount is changed.

```
bpm\broadcastSignal('@quoteItemIsChanged', 'Quote', entity\attribute('quoteId'));
```

Then it will be possible to catch the signal by a workflow. It can be useful for situations when you need to recalculate something when a related record is changed.
