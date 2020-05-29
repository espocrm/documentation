# Jobs

Jobs are tasks executing in the background. They handle operations like sending notifications, mass mailing, syncing, cleanup, etc.

In this article:

* [Scheduled Jobs](#scheduled-jobs)
* [Setting up (cron & daemon)](#setting-up)
* [Running jobs in parallel processes](#running-jobs-in-parallel-processes)
* [Running specific job manually in CLI](#running-specific-job-manually-in-cli)

## Scheduled Jobs

Scheduled Jobs are intended for recurring job execution. The are available at Administration > Scheduled Jobs. Scheduling for a specific job can be configured using a crontab notation.

```
* * * * *
| | | | |
| | | | |
| | | | +---- Day of the Week   (range: 1-7, 1 standing for Monday)
| | | +------ Month of the Year (range: 1-12)
| | +-------- Day of the Month  (range: 1-31)
| +---------- Hour              (range: 0-23)
```

If you want a job to be run as often as possible you need to set the scheduling to `* * * * *`.

Important: Scheduling works in **UTC timezone**. It doesn't honor the server's timezone. You need to take it into account when you need the scheduling on specific hours.

## Setting up

There are two ways how jobs can be processed: with crontab or daemon.

### Cron

Cron is easy to configure. It's supported by most of hosting providers.

See how to configure cron [here](server-configuration.md#setting-up-crontab).

In Unix systems cron is supposed to be run not more often than once a minute. It's possible to overcome this limitation with the following trick.

Add multiple lines in crontab with delays in seconds:

```
* * * * * /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
* * * * * sleep 15; /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
* * * * * sleep 30; /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
* * * * * sleep 45; /usr/bin/php -f /var/www/html/espocrm/cron.php > /dev/null 2>&1
```

Note that command that runs cron differs depending on server environment.

### Daemon

Requires *pcntl* and *posix* extensions.

It's recommended to turn on processing jobs in parallel processes: Administration > Jobs > Settings (in the top-right corner) > Jobs Run in Parallel. Note: Parallel processing is not supported on Windows environment.

Command to start daemon using nohup:

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

By default jobs are executed one by one that may cause situations when one job blocks the execution of the next job for some time (usually it's not more than one minute). To avoid this, it's possible to run jobs in parallel processes. The parameter is available at Administration > Jobs > Settings (in the top-right corner).

Requires *pcntl* and *posix* extensions. Some server configurations may restrict the ability to run child processes.

Windows is not supported.

## Running specific job manually in CLI


Command:
```
php command.php run-job JobName
```
where JobName is an intrernal name of the job you want to run.

Examples:
```
php command.php run-job Cleanup
php command.php run-job ProcessMassEmail
```

## See also

* [Creating custom job](../development/scheduled-job.md)
