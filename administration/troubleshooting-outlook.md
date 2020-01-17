# Outlook troubleshooting

In this article:

* [Check logs](#check-logs)
* [Enabling debug mode for a logger](#enabling-debug-mode-for-a-logger)
* [Server side error 500: Could not get access token for Outlook](#server-side-error-500-could-not-get-access-token-for-outlook)
* [Application is not configured as a multi-tenant application](#error-application-is-not-configured-as-a-multi-tenant-application)
* [Non-admin user's issues](#non-admin-users-issues)
* [Max number of operations](#max-number-of-operations)
    
## Check logs

To find out the problem, you have to check error log files located at `<ESPOCRM_DIRECTORY>/data/logs/*.log` and contain some error information.

## Enabling debug mode for a logger

To enable debug mode for log, edit the file `data/config.php` and change the value:
```
'level' => 'WARNING',
```
to
```
'level' => 'DEBUG',
```
## Server side error 500: Could not get access token for Outlook

Possible causes:

* Redirect URI doesn't set or it is invalid.
* Client Secret is not propper or it is corrupted. 
Sometimes your clien secret key may be corrupted or deprecated due to Outlook changes. Even if it is expiry date in the far future, create a new one and change it. 

## Error: Application is not configured as a multi-tenant application

In the Azure Active Directory admin center from the app's Overview page, select the Authentication section and change the value selected under Supported account types.

## Non-admin user's issues

#### A user doesn't have the 'External Accounts' button

Set the next permission in a role:
```
External Accounts -> Access 'enabled'
```
#### No Outlook services available

Set the next permissions in a role:
```
Outlook Calendar -> Access 'enabled'
Outlook Contacts -> Access 'enabled'
```

## Max number of operations

Outlook supports the maximum number of operations in a batch request is 20. So if you will set in the config.php file this value, e.g.: 
```
'outlookCalendarSyncMaxPortionSize' = 50,
'outlookCalendarPushMaxPortionSize' = 50,
```
The consequence would be not all record will be synced. In the log file this error looks like:
```
Espo.ERROR: Outlook Calendar sync: Oauth: Error after requesting POST https://outlook.office.com/api/v2.0/me/$batch; Reason: The maximum number of operations in a batch request is 20.. [][]
```
