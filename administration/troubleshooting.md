# Troubleshooting

## Check logs

To find out the problem, you have to check error log files.

#### EspoCRM error logs

EspoCRM logs are located at `<ESPOCRM_DIRECTORY>/logs/*.log` and contain some error information.

#### Apache error logs

For Ubuntu server an apache error log is located at `/var/log/apache2/error.log` and contains all error information. The location of log files can be different on other systems. 

## Enable debugging mode

To enable debugging mode, go to installed EspoCRM directory, open the file `data/config.php` and change the value:

```
'logger' => [
    ...
    'level' => 'WARNING',
    ...
]
```
to
```
'logger' => [
    ...
    'level' => 'DEBUG',
    ...
]
```

## Scheduled Jobs are not working

#### Problem #1: Your crontab is not configured

1. Login via SSH to your server.

2. Configure your crontab by following these steps: https://www.espocrm.com/documentation/administration/server-configuration/#user-content-setup-a-crontab.

Note: Crontab should be configured under web-server user, e.g. `crontab -e -u www-data`.

3. Wait for a while and check Scheduled Jobs to see if any jobs were executed (see a Log panel).

#### Problem #2. Crontab is configured, but Scheduled Jobs are not working

To make sure there are no errors when cron is running, try to run the cron command in a terminal:

1. Login via SSH to your server.

2. Go to the directory where EspoCRM is installed. E.g. for `/var/www/html/espocrm` directory the command is:

```bash
cd /var/www/html/espocrm
```

3. Run the crontab command:

```bash
php cron.php
```

Note: It should be executed under web-server user. If you are logged in as root, the command should be (e.g for Ubuntu):

```bash
sudo -u www-data php cron.php
```

where `www-data` is a web-server user.

4. If there are no errors, check Scheduled Jobs to see if any job was executed (see a Log panel).

## EspoCRM is not loading after updgare

This can happen sometimes on some shared hostings.

Check permissions of the files:
/index.php
/api/v1/index.php

They must be 644. If any of those file has permission 664 you need to change it to 644. Use your hosting's control panel or chmod command.

```
chmod 644 /path/to/file
```
More information about file permissions: [here](server-configuration.md#required-permissions-for-unix-based-systems).
