# Troubleshooting

In this article:

* [Check logs](#check-logs)
  * [Debug mode](#debug-mode)
* [Check system requirements](#check-system-requirements)
* [File permissions](#file-permissions)
* [Scheduled jobs are not working](#scheduled-jobs-are-not-working)
* [Running rebuild from CLI](#running-rebuild-from-cli)
* [EspoCRM is not loading after upgrade](#espocrm-is-not-loading-after-upgrade)
* [MySQL error: The server requested authentication method unknown to the client](#mysql-error-the-server-requested-authentication-method-unknown-to-the-client)
* [Emails are not being fetched](#emails-are-not-being-fetched)
* [Delay in fetching emails](#delay-in-fetching-emails)
* [Admin password is lost, can't log in](#admin-password-is-lost-cant-log-in)
* [MySQL error: MySQL can only use 61 tables in a join](#mysql-error-mysql-can-only-use-61-tables-in-a-join)
* [MySQL error: Row size too large](#mysql-error-row-size-too-large)

## Check logs

This is the most **important step** in diagnosing the problem. There are two main logs you need to check:

* EspoCRM [log](log.md);
* Webserver error log.

#### EspoCRM log

EspoCRM log files are located in `{ESPO_ROOT}/data/logs/` directory. Most errors are logger there.

#### Webserver error log


##### Apache

The Apache error log is usually located at `/var/log/apache2/error.log`. The location of the log file can vary in different systems.

##### Nginx

`/var/log/nginx/error.log`

### Debug mode

In some cases, it can be reasonable to enable debug mode for the Espo logger. It will print more information to the log.

To enable debug mode for the logger, edit the file `data/config-internal.php` and set the value of the *logger.level* parameter to `DEBUG`:

```
'logger' => [
    ...
    'level' => 'DEBUG',
]
```

Don't forget to revert the mode back after the problem is solved (to `WARNING` or `ERROR`).

### Backtrace printing

Enabling trace printing will print a backtrace to the log for every thrown exception. Can be very useful for debugging occurred errors.

In `data/config-internal.php` (or `data/config.php`):

```
'logger' => [
    ...
    'printTrace' => true,
]
```

## Check system requirements

At Administration > System Requirements. It's important that you have all required PHP extensions installed.

## File permissions

It's the most common issue. Because of incorrect file permissions (or ownership), the instance might not be able to write certain files (for example, cache files). You can find how to configure file permissions [here](server-configuration.md#permissions).

## Scheduled jobs are not working

#### Problem #1: Your crontab is not configured

1\. Login via SSH to your server.

2\. Configure your crontab by following these [steps](server-configuration.md#setting-up-crontab).

Note: Crontab should be configured under web-server user, e.g. `crontab -e -u www-data`.

3\. Wait for a while and check Scheduled Jobs to see if any jobs were executed (see a Log panel).

#### Problem #2. Crontab is configured, but Scheduled Jobs are not working

To make sure there are no errors when cron is running, try to run the cron command in the terminal:

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

[Check logs](#check-logs) for errors. Googling an error message may help figure out the cause of the problem.

Often the problem is caused by the webserver PHP version being lower than the minimum required version.

File permissions can be set to not proper values on some shared hostings after upgrade. 

Check permissions of these files:

* `public/index.php`
* `public/api/v1/index.php`

They must be 644. If any of these files have permission 664, you need to change it to 644. Use your hosting's control panel or *chmod* command.

```
chmod 644 /path/to/file
```

More information about file permissions can be found [here](server-configuration.md#required-permissions-for-unix-based-systems).

## MySQL error: The server requested authentication method unknown to the client

MySQL 8.0.4 has changed a default authentication method to `caching_sha2_password` which is not supported by PHP (at the time of writing). For MySQL 8 it should be changed to `mysql_native_password` method. For a user it can be done with the query:

```
CREATE USER username@localhost identified with mysql_native_password by 'password';
```

where username is your MySQL user, password is your MySQL user password.

## Emails are not being fetched

1. Make sure [cron](server-configuration.md#setting-up-crontab) is running. You will see the error notification on the main administration page if cron is not running.
2. Check EspoCRM log (data/logs) and server logs for errors.
3. Check log at Administration > Scheduled Job > Check Personal Email Accounts. Make sure there are no records with failed status.
4. Check log at Administration > Scheduled Job > Check Group Email Accounts. Make sure there are no records with failed status.

## Delay in fetching emails

The following configuration will speed up your email fetching (and other background processes):

1. Cron should be configured to execute once a minute or more often. More details [here](jobs.md#setting-up).
2. The *Jobs Run in Parallel* parameter should be enabled in Administration > Jobs > Settings (in the top-right corner). More details [here](jobs.md#running-jobs-in-parallel-processes).

## Admin password is lost, can't log in

*As of v5.8.3.*

Run the following command in CLI:

```
php command.php set-password [username]
```

where `[username]` is a user name, e.g. `admin`.

## MySQL error: MySQL can only use 61 tables in a join

Full error message: *General error: 1116 Too many tables; MySQL can only use 61 tables in a join*.

Any of the following actions may solve the problem.

1. Remove unused many-to-one and one-to-one relationships (if you have such).
2. Disable link-multiple for some many-to-many relationships of the problem entity type.
3. Set `noJoin` parameter (to `true`) for some *belongsTo* links. [Example](https://github.com/espocrm/espocrm/blob/7.2.7/application/Espo/Modules/Crm/Resources/metadata/entityDefs/Campaign.json#L269).
4. Set *currencyNoJoinMode* (`'currencyNoJoinMode' => true,` in `data/config.php`). With this mode enabled, you will need to clear cache (in Espo) every time you change currency rates. (as of v7.3)

## MySQL error: Row size too large

Full error messages (may be one of the following):

1. *ERROR 1118 (42000): Row size too large. The maximum row size for the used table type, 
not counting BLOBs, is 65535. This includes storage overhead, check the manual. You 
have to change some columns to TEXT or BLOBs.*
2. *ERROR 1118 (42000): Row size too large (> 8126). Changing some columns to 
TEXT or BLOB may help. In current row format, BLOB prefix of 0 bytes is stored inline.*

You can get this error if there are a large number of Varchar fields in an entity type. After this, you cannot create new fields.

To fix this problem, you can try two solutions:

### Solution 1. Decrease max length for some varchar fields

#### Step 1. Change in definitions

Edit the file `custom/Espo/Custom/Resources/metadata/entityDefs/{EntityType}.json`. Decrease *maxLength* parameter for some custom varchar fields. E.g. from 255 to 100.

#### Step 2. Change columns length in database

Then you need to amend the corresponding columns in your database by changing their length. You can do it manually (via a database admin tool) or run a [hard rebuild](commands.md#hard-rebuild).

#### Step 3. Rebuild

*Not needed if you already run a hard rebuild.*

Log in as an administrator in EspoCRM, go to Administration and click *Rebuild*. You can also do it via [CLI](commands.md/#rebuild).

### Solution 2. Change type for some varchar fields from *Varchar* to *Text* 

#### Step 1. Change in definitions

Edit the file `custom/Espo/Custom/Resources/metadata/entityDefs/{EntityType}.json` manually. Change definitions of some custom varchar fields from:

```
"type": "varchar",
"maxLength": 150
```

to:

```
"type": "text"
```

Note that the *maxLength* value can be different for your field. You just need to remove it. Make sure that the resulting JSON is valid.

#### Step 2. Rebuild

Login as administrator in EspoCRM, go to Administration and click the Rebuild link or do it via [CLI](commands.md/#rebuild).
