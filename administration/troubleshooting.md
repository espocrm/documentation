# Troubleshooting

## Find out the problem

To find out the problem, you have to check error log files.

#### EspoCRM error logs

EspoCRM logs located at `<ESPOCRM_DIRECTORY>/logs/*.log` and contain some error information.

#### Apache error logs

For Ubuntu server an apache error log located at `/var/log/apache2/error.log` and contains all error information. The location of log files can be different in other systems. 

## Enable debugging mode

To enable debugging mode, go to installed EspoCRM directory, open a file `data/config.php` and change the value:

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

Note: crontab should be configured under web-server user, e.g. `crontab -e -u www-data`.

3. Wait for a while and check Scheduled Jobs if any jobs were executed (see a Log panel).

#### Problem #2. Crontab is configured, but Scheduled Jobs are not working

To make sure that there are no errors when cron is running, try to run the cron command in a terminal:

1. Login via SSH to your server.

2. Go to the directory where installed EspoCRM. E.g. for `/var/www/html/espocrm` directory the command is:

```bash
cd /var/www/html/espocrm
```

3. Run the crontab command:

```bash
php cron.php
```

Note: it should be executed under web-server user. If you are logged in as root, the command should be (e.g for Ubuntu):

```bash
sudo -u www-data php cron.php
```

where `www-data` is a web-server user.

4. If there are no errors, check Scheduled Job if any job was executed (see a Log panel).

