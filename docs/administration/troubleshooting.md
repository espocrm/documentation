# Troubleshooting

In this article:

* [Check logs](#check-logs)
  * [Debug mode](#debug-mode)
* [Check system requirements](#check-system-requirements)
* [Scheduled Jobs are not working](#scheduled-jobs-are-not-working)
* [Running rebuild from CLI](#running-rebuild-from-cli)
* [EspoCRM is not loading after upgrade](#espocrm-is-not-loading-after-upgrade)
* [MySQL error: The server requested authentication method unknown to the client](#mysql-error-the-server-requested-authentication-method-unknown-to-the-client)
* [Emails are not being fetched](#emails-are-not-being-fetched)
* [Delay in fetching emails](#delay-in-fetching-emails)
* [Admin password is lost, can't log in](#admin-password-is-lost-cant-log-in)

## Check logs

To find out the problem, check error log files.

#### EspoCRM error logs

Espo logs are located in `{ESPO_ROOT}/data/logs/` directory. Most errors are logger there.

#### Apache error logs

For Ubuntu server, the apache error log is located at `/var/log/apache2/error.log`. The location of log files can be different on other systems.

### Debug mode

In some cases it can be reasonable to enable debug mode for the logger.

To enable debug mode for the loghger, edit the file `data/config.php` and change the value:

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

## Check system requirements

At Admiistration > System Requirements. It's important to have all required extensions installed.



## Scheduled Jobs are not working

#### Problem #1: Your crontab is not configured

1\. Login via SSH to your server.

2\. Configure your crontab by following these [steps](server-configuration.md#setting-up-crontab).

Note: Crontab should be configured under web-server user, e.g. `crontab -e -u www-data`.

3\. Wait for a while and check Scheduled Jobs to see if any jobs were executed (see a Log panel).

#### Problem #2. Crontab is configured, but Scheduled Jobs are not working

To make sure there are no errors when cron is running, try to run the cron command in a terminal:

1\. Login via SSH to your server.

2\. Go to the directory where EspoCRM is installed. E.g. for `/var/www/html/espocrm` directory the command is:

```bash
cd /var/www/html/espocrm
```

3\. Run the crontab command:

```bash
php cron.php
```

Note: It's better to execute under web-server user. If you are logged in as root, the command should be (e.g for Ubuntu):

```bash
sudo -u www-data php cron.php
```

where `www-data` is a web-server user.

4\. If there are no errors, check Scheduled Jobs to see if any job was executed (see a Log panel).

## Running rebuild from CLI

Sometimes you need to run rebuild from the command line interface when the application is not loading.

```bash
php rebuild.php
```

## EspoCRM is not loading after upgrade

Sometimes it can happen on some shared hostings.

Check permissions of the files:
/index.php
/api/v1/index.php

They must be 644. If any of those files have permission 664, you need to change it to 644. Use your hosting's control panel or chmod command.

```
chmod 644 /path/to/file
```
More information about file permissions can be found [here](server-configuration.md#required-permissions-for-unix-based-systems).

## MySQL error: The server requested authentication method unknown to the client

MySQL 8.0.4 has changed default authentication method to `caching_sha2_password` which is not supported by PHP. This issue can be solved by this [solution](server-configuration.md#mysql-8-support).

## Emails are not being fetched

1. Make sure [cron](server-configuration.md#setting-up-crontab) is running. You will see the error notification on the main administration page if cron is not running.
2. Check EspoCRM log (data/logs) and server logs for errors.
3. Check log at Administration > Scheduled Job > Check Personal Email Accounts. Make sure there are no records with failed status.
4. Check log at Administration > Scheduled Job > Check Group Email Accounts. Make sure there are no records with failed status.

## Delay in fetching emails

The following configurations will speed up your emails fetching:
1. Cron should be executed every minute `* * * * *`. More details about the cron, https://docs.espocrm.com/administration/server-configuration/#setting-up-crontab.
2. The `Jobs Run in Parallel` option should be enabled in Administration > Jobs > Settings (in the top-right corner). More details, https://docs.espocrm.com/administration/jobs/#running-jobs-in-parallel-processes.

## Admin password is lost, can't log in

Available since EspoCRM 5.8.3.

Run the following command in CLI:

```
php command.php set-password [username]
```

where `[username]` is a user name, e.g. `admin`.
