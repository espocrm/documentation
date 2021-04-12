# Outlook troubleshooting

In this article:

* [Check scheduled jobs](#check-scheduled-jobs)
* [Check logs](#check-logs)
* [Server side error 500: Could not get access token for Outlook](#server-side-error-500-could-not-get-access-token-for-outlook)
* [Application is not configured as a multi-tenant application](#error-application-is-not-configured-as-a-multi-tenant-application)
* [Regular user's issues](#regular-users-issues)
* [Max number of operations](#max-number-of-operations)

## Check Scheduled Jobs

Check whether the scheduled job is running in Administration -> Scheduled Jobs -> Outlook Calendar Sync -> Log

## Check logs

Check EspoCRM log at `<ESPOCRM_DIRECTORY>/data/logs/*.log`. You can also set the [log mode](../../administration/troubleshooting.md#enabling-debug-mode-for-a-logger) to `DEBUG` level to obtain more info from the log.

## Server side error 500: Could not get access token for Outlook

Possible causes:

* Redirect URI doesn't set or it is invalid.
* Client Secret is not propper or it is corrupted (sometimes your clien secret key may be corrupted or deprecated due to Outlook changes. Even if it is expiry date in the far future, create a new one and change it). 

## Error: Application is not configured as a multi-tenant application

In the Azure Active Directory admin center from the app's Overview page, select the Authentication section and change the value selected under Supported account types.

## Regular user's issues

#### A user doesn't have the 'External Accounts' button

Set the next permission in a role:
```
External Accounts -> Access 'enabled'
```
#### No Outlook services are available

Set the next permissions in a role:
```
Outlook Calendar -> Access 'enabled'
Outlook Contacts -> Access 'enabled'
```

## Max number of operations

Outlook max number of operations in a batch request = 20. So if you will set in the config.php file: 
```
'outlookCalendarSyncMaxPortionSize' = 50,
'outlookCalendarPushMaxPortionSize' = 50,
```
many records won't be synced. In EspoCRM log this error description looks like:
```
Espo.ERROR: Outlook Calendar sync: Oauth: Error after requesting POST https://outlook.office.com/api/v2.0/me/$batch; Reason: The maximum number of operations in a batch request is 20.. [][]
```
