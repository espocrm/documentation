# Troubleshooting

In this article:

* [Check logs](#check-logs)
* [Check system requirements](#check-system-requirements)
* [Scheduled Jobs are not working](#scheduled-jobs-are-not-working)
* [Running rebuild or clear cache from CLI](#running-rebuild-or-clear-cache-from-CLI)
* [EspoCRM is not loading after upgrade](#espocRM-is-not-loading-after-upgrade)
* [MySQL error: The server requested authentication method unknown to the client](#mysql-error-:-the-server-requested-authentication-method-unknown-to-the-client)
* [Emails are not being fetched](#Emails-are-not-being-fetched)
* [Enabling debug mode for a logger](#enabling-debug-mode-for-a-logger)
* [Web browser cache stucking](#web-browser-cache-stucking)
* [Page elements are corrupted or JavaScript scenario doesn't work](#page-elements-are-corrupted-or-javascript-scenario-doesn't-work)
* [Blank page with Bad server responce error](#blank-page-with-bad-server-responce-error)

## Check logs

To find out the problem, you have to check error log files.

#### EspoCRM error logs

EspoCRM logs are located at `<ESPOCRM_DIRECTORY>/data/logs/*.log` and contain some error information.

#### Apache error logs

For Ubuntu server an apache error log is located at `/var/log/apache2/error.log` and contains all error information. The location of log files can be different on other systems.

## Check system requirements

At Admiistration > System Requirements. It's important to have all required extensions installed.

## Scheduled Jobs are not working

#### Problem #1: Cron is disabled

Check in Administration -> Settings -> Disable Cron parameter.

#### Problem #2: Your crontab is not configured

1. Login via SSH to your server.

2. Configure your crontab by following these [steps](server-configuration.md#user-content-setup-a-crontab).

Note: Crontab should be configured under web-server user, e.g. `crontab -e -u www-data`.

3. Wait for a while and check Scheduled Jobs to see if any jobs were executed (see a Log panel).

#### Problem #3. Crontab is configured, but Scheduled Jobs are not working

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

## Running rebuild or clear cache from CLI

Sometimes you need to run rebuild or clear cache from the command line interface when the application is not loading.

* To rebuild: `sudo -u www-data php rebuild.php`
* To clear chache: `sudo -u www-data php clear_cache.php`

www-data is a web server user.


## EspoCRM is not loading after upgrade

This can happen sometimes on some shared hostings.

Check permissions of the files:
/index.php
/api/v1/index.php

They must be 644. If any of those file has permission 664 you need to change it to 644. Use your hosting's control panel or chmod command.

```
chmod 644 /path/to/file
```
More information about file permissions: [here](server-configuration.md#required-permissions-for-unix-based-systems).

## MySQL error: The server requested authentication method unknown to the client

MySQL 8.0.4 has changed default authentication method to caching_sha2_password which is not supported by PHP. This issue can be solved by this [solution](server-configuration.md#user-content-mysql-8-support).

## Emails are not being fetched

1. Make sure [cron](server-configuration.md#user-content-setup-a-crontab) is running. You will see the error notification on the main administration page if cron is not running.
2. Check EspoCRM log (data/logs) and server logs for errors.
3. Check log at Administration > Scheduled Job > Check Personal Email Accounts. Make sure there are no records with failed status.
4. Check log at Administration > Scheduled Job > Check Group Email Accounts. Make sure there are no records with failed status.

## Enabling debug mode for a logger

To enable debug mode for log, edit the file `data/config.php` and change the value:

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

## Web browser cache stucking

Sometimes you can start getting the errors something like Error 500 or endless loading process upon new record creation. 
#### Possible causes and fixes

#### Problem #1: Old request cached

Errors 500, 400, etc. could appear if a browser cached your previous request's parameters (fields, data, role, etc.) and use them for the current request with depricated or non valid values. 
Open your instance in the web browser incognito mode window and try to reproduce the error. If it won't be reproduced, then clear the browser cache with its advanced settings. Note that Ctrl + F5 will not help.

#### Problem #2: Endless loading process upon new record creation

Open a Developer tools panel in your web browser (F12 button) and press F5. Open the console tab and try to create a record again. In the console tab you might be faced with such statement as:
```
Error: Could not load file 'client/src/views/user/fields/contact.js?r=1578581862'
```
To make sure that this issue applies to the cache stucking problem do:
1. Open the client/src/views/user/fields directory and make sure that the contact.js file exists. If so then... 
2. Open a web browser incognito mode window and try to reproduce the error. If it won't be reproduced then ...
3. Clearing cache with a web browser advanced settings.

Sometimes such an issue could be even reproduced in the incognito mode window and doesn't disappeared after the cache clearing. In this case there is one more way to fix it. Please try to open this file in your web browser. For example:
```
www.my-site.com/crm/client/src/views/user/fields/contact.js
``` 
or
```
localhost/crm/client/src/views/user/fields/contact.js
``` 
After this reload a web page and try reproduce the error again. 

## Page elements are corrupted or JavaScript scenario doesn't work

1. Open a Developer tools panel in your web browser (F12 button) and press F5. Check the console and network tabs for the file open errors.
2. Check whether you don't have enabled browser plugin (e.g. Ad-Block) or anyone other software that can restrict executing the javascript files.

## Blank page with Bad server responce error

The possible problem is the connection to database is lost or corrupted.
1. Open the ./data/config.php file and check the database connection params:
```
'database' => [
    'driver' => 'pdo_mysql',
    'host' => 'localhost',
    'port' => '',
    'charset' => 'utf8mb4',
    'dbname' => 'espocrm',
    'user' => 'root',
    'password' => '123GhjOe33h'
],
```
2. If the params are correct, then check whether the mysql service runs. You can do it by:
* Opening via database manager as phpMyAdmin etc.
* Run this command in the terminal `service mysql status`.

After fix, you should press F5 to reload a web page. 