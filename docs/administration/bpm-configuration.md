# BPM Configuration


## Processing conditional pending nodes

Actual as of v2.8.7.

Within a period defined by the config parameter `bpmnPendingDeferPeriod` (`"6 hours"` by default) pending conditional events nodes are be checked as soon as possible.
After that period they will be checked with an interval defined by `bpmnPendingDeferIntervalPeriod` (`"10 minutes"` by default).
This is an optimization measure.

If an entity is updated, it will make nodes related to that entity to be checked one time regardless whether the defer period is passed.

## Pending processing limit

The config parameter `bpmnProceedPendingMaxSize` (`20000` by default) limits max number of pending flows that can be processed. Consider increasing it if you usually have a large number of acrive processes.
