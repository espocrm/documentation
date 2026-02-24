# BPM Configuration

## Deferring conditional event checking

*As of v2.8.7.*

Within a period defined by the config parameter `bpmnPendingDeferPeriod` (`"6 hours"` by default), pending conditional event nodes are being checked as soon as possible.
After that period, they will be checked with an interval defined by the parameter `bpmnPendingDeferIntervalPeriod` (`"10 minutes"` by default).
This is an optimization measure.

If an entity is updated, it will make nodes related to that entity to be checked one time regardless whether the defer period has been passed.

## Pending event checking limit

The config parameter `bpmnProceedPendingMaxSize` (`20000` by default) limits max number of pending flows that can be processed. Consider increasing it if you usually have a large number of active processes.

## Multi-instance sub-process limit

The max number of sub-process instances (within a multi-instance sub-process) is defined by the config parameter `bpmnSubProcessInstanceMaxCount`. The default value is `20`.

## Running in parallel

*As of v3.10.*

Can be enabled by setting the config parameter `bpmnRunInParallel` to `true`. Running jobs [in parallel](../jobs.md#running-jobs-in-parallel-processes) must be also enabled.

For scheduled processes, to process them in parallel, use a Timer Intermediate Event right after the Start Timer event.
