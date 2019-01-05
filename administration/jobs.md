# Jobs

Jobs are intended for executing of tasks in the background. They handle operations like sending notifications, mass mailing, syncing, cleanup, etc.

## Scheduled Jobs

Scheduled Jobs are intended for recurring job execution. Scheduling for a specific job can be configured by the administrator, using a crontab notation.

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

## Setting up

There are two ways how jobs can be processed: with crontab or daemon.

### Cron

Cron is easy to configure. It's supported by most of hosting providers. 

See how to configure cron [here](server-configuration.md#setup-a-crontab).

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

Command to run using nohup:

```
nohup php /path/to/espocrm/daemon.php &
```

Configuration for using systemd:

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

Requires pcntl and posix extensions, php 7.1 or later. Windows is not supported.

Recommended to turn on processing jobs in parallel processes: Administration > Scheduled Jobs > Jobs (top-right corner) > Settings (top-right corner) > Jobs Run in Parallel.

