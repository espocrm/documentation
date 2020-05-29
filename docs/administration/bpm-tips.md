# BPM Tips

## Execution in idle

When a process is initiated by a user interaction (e.g. after record created), it starts to execute in the web server
process until the flow reaches a catching event, *send message task* or *user task*, that will switch execution to idle mode (process will continue
to run by cron/daemon). 

If you have script tasks that take some time to run it's reasonable to force to switch execution to idle mode.
To avoid the user waiting until scripts are finished. A trick is to add *Timer Intermidiate Event* with 0 timer value.
You can add it right after a start event.
