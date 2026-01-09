# Jobs

Jobs are tasks executing in the background. They handle operations like sending notifications, mass mailing, syncing, cleanup, etc.

In this article:

* [Scheduled jobs](#scheduled-jobs)
* [Setting up (cron & daemon)](#setting-up)
* [Running jobs in parallel processes](#running-jobs-in-parallel-processes)
* [Parameters](#parameters)
* [Running jobs in CLI](#running-jobs-in-cli)
* [Tips](#tips)

## Scheduled jobs

Scheduled jobs are intended for recurring job execution. They are available at Administration > Scheduled Jobs. Scheduling for a specific job can be configured using the crontab notation.

```
* * * * *
| | | | |
| | | | |
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
+------------ Minute            (range: 0-59)
```

If you want a job to be run as often as possible, you need to set the scheduling to `* * * * *`.

## Setting up

There are two job processing setup options:

* [Crontab](#cron)
* [Daemon](#daemon)

For both, it's **highly recommended** to turn on processing jobs **in parallel** processes: Administration > Job Settings > Jobs Run in Parallel.

!!! note

    Parallel processing is not supported in a Windows environment.

### Cron

The Cron is easy to configure, it's supported by most hosting providers. See how to configure cron [here](server-configuration.md#setting-up-crontab).

In Unix systems, the cron is supposed to be run not more often than once a minute. It's possible to overcome this limitation by adding multiple crontab actions with different delays:

```
* * * * * /usr/bin/php -f /path/to/espo/cron.php > /dev/null 2>&1
* * * * * sleep 15; /usr/bin/php -f /path/to/espo/cron.php > /dev/null 2>&1
* * * * * sleep 30; /usr/bin/php -f /path/to/espo/cron.php > /dev/null 2>&1
* * * * * sleep 45; /usr/bin/php -f /path/to/espo/cron.php > /dev/null 2>&1
```

The command that runs cron.php may vary depending on your server environment. You need to replace `/path/to/espo/` with the actual path to your instance.

### Daemon

Daemon setup is available only in Unix-like operating systems. Requires *pcntl* and *posix* PHP extensions (usually available by default).

Command to start the daemon using **nohup**:

```
nohup php /path/to/espocrm/daemon.php &
```

#### Using Systemd

Service configuration file: `/etc/systemd/system/espocrm-daemon.service`

Configuration (file content):

```
[Unit]
Description=EspoCRM Daemon Service
Requires=mysql.service
After=mysql.service

[Service]
Type=simple
Restart=always
RestartSec=5
StartLimitInterval=0
User=www-data
ExecStart=/usr/bin/php /path/to/espocrm/daemon.php
StandardError=/path/to/espocrm/data/logs/daemon.log

[Install]
WantedBy=default.target
```

Command to get the service to start on boot:

```
systemctl enable espocrm-daemon.service
```

Command to start the service:

```
systemctl start espocrm-daemon.service
```

## Running jobs in parallel processes

!!! note

    It's **highly recommended** to enable running jobs in parallel processes.

By default, jobs are executed one by one, which may cause situations when one job blocks the execution of the next job for some time (usually, it's not more than one minute). To avoid this, it's possible to configure the system to run jobs in parallel processes. The parameter enabling this behavior is available under: Administration > Job Settings.

Requires *pcntl* and *posix* extensions. Some server configurations may restrict the ability to run child processes. Windows is not supported.

## Parameters

The administrator can configure job parameters under: Administration > Job Settings.

#### Jobs Max Portion

It may be reasonable to increase the **Jobs Max Portion** parameter when the number of users in your CRM is increased. It defines the maximum number of jobs that can be processed in a single cron (or daemon) run. By default, it's set to *15*.

#### Force UTC Time Zone

If not checked, the default time zone (set in Administration > Settings) is used for job scheduling. It's highly recommended to have this parameter unchecked. This parameter was introduced to mitigate a migration burden when time zone support was introduced for jobs.

## Running jobs in CLI

To run a specific job manually in CLI

Command:

```
php command.php run-job JobName
```
where JobName is an internal name of the job you want to run.


!!! example

    ```
    php command.php run-job Cleanup
    php command.php run-job ProcessMassEmail
    ```

Jobs available out of the box:

* CheckEmailAccounts – fetches emails for personal email accounts;
* CheckInboundEmails – fetches emails for group email accounts;
* Cleanup – performs cleanup, completely deletes removed records;
* ProcessMassEmail – sends mass emails;
* ProcessWebhookQueue – sends webhooks;
* SendEmailNotifications
* SendEmailReminders
* SubmitPopupReminders
* ControlKnowledgeBaseArticleStatus

To print all available jobs run:

```
bin/command app-info --jobs
```

Some jobs (CheckEmailAccounts, CheckInboundEmails) require specifying `--target-id` and/or `--target-type` options.

!!! example

    ```
    bin/command run-job CheckEmailAccounts --target-id={email_account_id}
    ```

## Tips

### Jobs stuck in running state

If a process that is running a job was terminated manually before completion, the job will ramain in the *Running* status for some time until the system marks it as *Failed*. When such a situation occurs for a scheduled job, it will prevent next runs from being scheduled until the hanging job is resolved. You can manually remove that problem job to resolve the problem. Under Administraction > Jobs, find the job with the status *Running* and remove it.

Note that this situation is more common during development and testing, and rarely occurs in production.

The period after the hanging running job changes its status to *Failed* is controlled by the [config parameter](https://docs.espocrm.com/administration/config-params/#jobs-daemon) *jobPeriod*.

## See also

* [Custom scheduled job](../development/scheduled-job.md)
