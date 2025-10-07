# BPM Tips

## Execution in idle

When a process is initiated by a user interaction (e.g. after record is created), it starts to execute in the web server
process until the flow reaches a catching event, *Send Message Task*, or *User Task*, which will switch execution to the idle mode (process will continue
to run by cron/daemon). 

If you have script tasks that take some time to run, it's reasonable to force to switch execution to the idle mode.
This will prevent a user from waiting until scripts are finished. In worst cases it can even cause a timeout error. The trick is to add *Timer Intermediate Event* with 0 timer value. You can add it right after a start event.

## Unsetting process variables

Variables defined in a *Script Task* and *Execute Formula Script* action will be stored in the Process (unless *Isolate Variables* is checked). If you don't need a specific variable to be used further in the process, it's reasonable to unset it in the end of the script.

```
$tempVariable = null;
```

Also consider to unset sensitive data immediately after usage.

## Cleaning up ended processes

Ended Processes are *not* cleaned up automatically, as they may hold information important for the business. You may utilize a scheduled Workflow rule that will handle removal of ended Processes.

## Self-removal

You can set up a BPM process to remove itself. Add *Task* > *Update Process Record*. Add in Formula: `deleted = true;`.

## Displaying processes on record detail view

You can utilize the [Report Panels](../user-guide/reports.md#report-panels) feature to display all related processes on the record detail view.

1. Create a List report for the Process entity type with the *Target* runtime filter.
2. Create a report panel (Administration > Report Panels) for your entity type, select the report.
