# Troubleshooting

<<<<<<< HEAD:administration/troubleshooting.md
* [Check logs](#check-logs)
* [Enabling debug mode for a logger](#enabling-debug-mode-for-a-logger)
* [Check system requirements](#check-system-requirements)
* [Scheduled Jobs are not working](#scheduled-jobs-are-not-working)
* [Running rebuild or clear cache from CLI](#running-rebuild-or-clear-cache-from-cli)
* [EspoCRM is not loading after upgrade](#espocrm-is-not-loading-after-upgrade)
* [MySQL error: The server requested authentication method unknown to the client](#mysql-error-the-server-requested-authentication-method-unknown-to-the-client)
* [Emails are not being fetched](#emails-are-not-being-fetched)
* [Web browser cache stucking](#web-browser-cache-stucking)
* [Page elements are corrupted or JavaScript scenario doesn't work](#page-elements-are-corrupted-or-javascript-scenario-doesnt-work)
* [Blank page with Bad server responce error](#blank-page-with-bad-server-responce-error)
=======
In this article:

* [Check logs](#check-logs)
* [Check system requirements](#check-system-requirements)
* [Scheduled Jobs are not working](#scheduled-jobs-are-not-working)
* [Running rebuild from CLI](#running-rebuild-from-cli)
* [EspoCRM is not loading after upgrade](#espocrm-is-not-loading-after-upgrade)
* [MySQL error: The server requested authentication method unknown to the client](#mysql-error-the-server-requested-authentication-method-unknown-to-the-client)
* [Emails are not being fetched](#emails-are-not-being-fetched)
* [Enabling debug mode for a logger](#enabling-debug-mode-for-a-logger)
* [Admin password is lost, can't log in](#admin-password-is-lost-cant-log-in)
>>>>>>> a4bda15158f03ca8257dd94c80ff80ebdbe1292d:docs/administration/troubleshooting.md

## Check logs

To find out the problem, you have to check error log files.

#### EspoCRM error logs

EspoCRM logs are located at `<ESPOCRM_DIRECTORY>/data/logs/*.log` and contain some error information.

#### Apache error logs

For Ubuntu server an apache error log is located at `/var/log/apache2/error.log` and contains all error information. The location of log files can be different on other systems.

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

## Check system requirements

At Admiistration > System Requirements. It's important to have all required extensions installed.

## Scheduled Jobs are not working

#### Problem #1: Cron is disabled

Check in Administration -> Settings -> Disable Cron parameter.

#### Problem #2: Your crontab is not configured

1\. Login via SSH to your server.

<<<<<<< HEAD:administration/troubleshooting.md
2. Configure your crontab by following these [steps](server-configuration.md#setup-crontab).
=======
2\. Configure your crontab by following these [steps](server-configuration.md#setting-up-crontab).
>>>>>>> a4bda15158f03ca8257dd94c80ff80ebdbe1292d:docs/administration/troubleshooting.md

Note: Crontab should be configured under web-server user, e.g. `crontab -e -u www-data`.

3\. Wait for a while and check Scheduled Jobs to see if any jobs were executed (see a Log panel).

#### Problem #3. Crontab is configured, but Scheduled Jobs are not working

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

## Running rebuild or clear cache from CLI

Sometimes you need to run rebuild or clear cache from the command line interface when the application is not loading.

<<<<<<< HEAD:administration/troubleshooting.md
* To rebuild: `sudo -u www-data php rebuild.php`
* To clear cache: `sudo -u www-data php clear_cache.php`

www-data is a web server user.

=======
```bash
php rebuild.php
```
>>>>>>> a4bda15158f03ca8257dd94c80ff80ebdbe1292d:docs/administration/troubleshooting.md

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

MySQL 8.0.4 has changed default authentication method to `caching_sha2_password` which is not supported by PHP. This issue can be solved by this [solution](server-configuration.md#mysql-8-support).

## Emails are not being fetched

<<<<<<< HEAD:administration/troubleshooting.md
1. Make sure [cron](server-configuration.md#setup-crontab) is running. You will see the error notification on the main administration page if cron is not running.
=======
1. Make sure [cron](server-configuration.md#setting-up-crontab) is running. You will see the error notification on the main administration page if cron is not running.
>>>>>>> a4bda15158f03ca8257dd94c80ff80ebdbe1292d:docs/administration/troubleshooting.md
2. Check EspoCRM log (data/logs) and server logs for errors.
3. Check log at Administration > Scheduled Job > Check Personal Email Accounts. Make sure there are no records with failed status.
4. Check log at Administration > Scheduled Job > Check Group Email Accounts. Make sure there are no records with failed status.

## Web browser cache stucking

Sometimes you can start getting the errors something like Error 500 or error page loading upon new record creation. 

#### Possible causes and fixes

#### Problem #1: Old request cached

Errors 500, 400, etc. could appear if a browser cached your previous request's parameters (fields, data, role, etc.) and use them for the current request with deprecated or non valid values. 
Open your instance in the web browser incognito mode window and try to reproduce the error. If it won't be reproduced, then clear the browser cache with its advanced settings. Note that Ctrl + F5 will not help.

#### Problem #2: Error page loading upon new record creation

Open a Developer tools panel in your web browser (F12 button in Chrome) and press F5. Open the console tab and try to create a record again. In the console tab you might be faced with such statement as:
```
Error: Could not load file 'client/src/views/user/fields/contact.js?r=1578581862'
```
To make sure that this issue applies to the cache stucking problem do:
1. Open a web browser incognito mode window and try to reproduce the error. If it won't be reproduced then ...
2. Open the `client/src/views/user/fields` directory and make sure that the `contact.js` file exists. If so then... 
3. Clear cache with a web browser advanced settings.

Sometimes such an issue could be even reproduced in the incognito mode window and doesn't disappeared after the cache clearing. In this case there is one more way to fix it. Please try to open this file in your web browser directly. For example:
```
www.my-site.com/crm/client/src/views/user/fields/contact.js
``` 
or
```
localhost/crm/client/src/views/user/fields/contact.js
``` 
After this reload a web page and try reproduce the error again. 

## Page elements are corrupted or JavaScript scenario doesn't work

1. Open a Developer tools panel in your web browser (F12 button in Chrome) and press F5. Check the console and network tabs for any errors.
2. Check whether you don't have enabled any browser plugins (e.g. Ad-Block) or installed any other software that can restrict executing the javascript code.

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
    'user' => 'espocrm',
    'password' => '123GhjOe33h'
],
```
<<<<<<< HEAD:administration/troubleshooting.md
2. If the params are correct, then check whether the mysql service runs. You can do it:
* By any database manager like phpMyAdmin etc.
* By terminal using this command `service mysql status`.

After fix, you should press F5 to reload a web page. 
=======

## Admin password is lost, can't log in

Available since EspoCRM 5.8.3.

Run the following command in CLI:

```
php command.php set-password [username]
```

where `[username]` is a user name, e.g. `admin`.
>>>>>>> a4bda15158f03ca8257dd94c80ff80ebdbe1292d:docs/administration/troubleshooting.md
