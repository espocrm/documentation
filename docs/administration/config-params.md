# Config parameters

Config parameters can be changed or added manually in the file `data/config.php`.

This is not a full list of params. Most of params available in admin UI are not listed here.

## List of parameters

* [General](#general)
* [Access control](#access-control)
* [Notifications](#notifications)
* [Emails](#emails)
* [Stream](#stream)
* [Clean-up](#clean-up)
* [Passwords](#passwords)
* [Auth](#auth)
* [Jobs & Daemon](#jobs-daemon)
* [Mass Email](#mass-email)
* [Kanban](#kanban)
* [Text search](#text-search)
* [PDF](#pdf)

### General

* siteUrl – URL of EspoCRM instance;
* useCache – `true`;
* isDeveloperMode – false – toggle developer mode;
* useCacheInDeveloperMode – `false` – to use front-end cache in developer mode; front-end is not cached by default in developer mode;
* maintenanceMode – `false` – only administrators will have access to the system;
* disableCron – `false`;
* useWebSocket – `false`;
* ajaxTimeout – `60000` – timeout for ajax requests (in milliseconds);
* language – system language;
* timeZone – system timezone;
* exportDelimiter – `','` – default export delimiter;
* inlineAttachmentUploadMaxSize – `20` – max size of inline attachments (e.g. inline images for emails); in Mb;
* recordListMaxSizeLimit – `200` – max number of records can be fetched in a single GET API request;
* displayListViewRecordCount – `true` – to display a number of records on the list view;
* addressCountryList – array of countries available in autocomplete;
* addressCityList – array of cities available in autocomplete;
* addressStateList – array of states available in autocomplete;
* defaultCurrency – currency applied by default;
* baseCurrency – which currency to use as base when defining rates;
* currencyList – array of available currencies;

### Access control

* aclStrictMode – `true` – see [here](roles-management.md#permissions-by-default);
* aclAllowDeleteCreated – `true` – whether to allow regular users to delete record they created, even they don't have *delete* access;
* aclAllowDeleteCreatedThresholdPeriod – `24 hours` – time window available for deletion of created records;

### Notifications

* adminNotifications – `true` – notifications in admin panel;
* adminNotificationsNewVersion – `true` – notifications about new versions in admin panel;
* adminNotificationsNewExtensionVersion – `true` – notifications about new extension versions in admin panel;

### Emails

* emailKeepParentTeamsEntityList – `['Case']` – when a related email is fetched, teams of the parent record will be copied to the email; by default, it's available only for cases;
* emailForceUseExternalClient – `false` – when composing an email, all users will be forced to use external client;

### Stream

* noteEditThresholdPeriod – `'7 days'` – how much time is available for editing steam posts;
* noteDeleteThresholdPeriod – `'1 month'` – how much time is available for deleting steam posts;
* streamEmailWithContentEntityTypeList – `['Case']` – to display the content of the email in stream; by default, it's available only for cases;

### Clean-up

* cleanupJobPeriod – `'10 days'` – job records;
* cleanupActionHistoryPeriod – `'15 days'` – action history records;
* cleanupAuthTokenPeriod – `'1 month'` – auth tokens;
* cleanupAuthLogPeriod – `'2 months'` – auth log;
* cleanupNotificationsPeriod – `'2 months'` – notifications;
* cleanupAttachmentsPeriod – `'15 days'` – attachments with roles 'Export File', 'Mail Merge', 'Mass Pdf';
* cleanupOrphanAttachments – `false` – cleaning up attachments that were uploaded but not linked with any record; *cleanupAttachmentsPeriod* is used; an experimental parameter;
* cleanupAttachmentsFromPeriod – `'3 months'` – attachments related to records that were marked as deleted (*deleted = 1*);
* cleanupBackupPeriod – `'2 months'` – backup of files created during upgrades;
* cleanupDeletedRecordsPeriod – `'3 months'` – complete deletion of records that were marked as deleted (*deleted = 1*);

### Passwords

* passwordStrengthLength – min password length;
* passwordStrengthLetterCount – how many letters are required for passwords;
* passwordStrengthNumberCount – how many numbers are required for passwords;
* passwordStrengthBothCases – `false` – password must contain letters of both upper and lower case;
* passwordRecoveryRequestLifetime – `3 hours` – how long a password recovery link is valid;

### Auth

* authMaxFailedAttemptNumber – `10` – if number of failed login attempts (within *authFailedAttemptsPeriod*) exceeds the set number, then the system won't allow to login; 
* authFailedAttemptsPeriod – `'60 seconds'` – period taken into account for *authMaxFailedAttemptNumber*;

### Jobs & Daemon

* jobMaxPortion – `15` – max number of jobs per one execution; a portion of jobs that is run in a queue is counted as one job;
* jobPeriod – `7800` – max execution time (in seconds) allocated for a single job; if exceeded then set to *Failed*;
* jobPeriodForActiveProcess – `36000` – max execution time (in seconds) allocated for a single job with active process; if exceeded then set to *Failed*;
* jobRerunAttemptNumber – `1` – number of attempts to re-run failed jobs;
* jobRunInParallel – `false` – jobs will be executed in parallel processes;
* jobPoolConcurrencyNumber – `8` – max number of processes run simultaneously;
* cronMinInterval – `2` – min interval (in seconds) between two cron runs;
* daemonMaxProcessNumber – `5` – max number of processes run simultaneously;
* daemonInterval – `10` – interval between process runs (in seconds);
* daemonProcessTimeout – `36000` – max lifetime of a process run (in seconds);
* jobE0MaxPortion – `100` – max portion of jobs executed in a single process for *e0* queue; this queue is intended for email sending; is run as often as possible;
* jobQ0MaxPortion – `200` – *q0* is a queue for a general usage; is run as often as possible;
* jobQ1MaxPortion – `500` – *q1* is a queue for a general usage; is run every minute;

### Mass Email

* massEmailMaxAttemptCount – `3` – how many attempts to send an email will be made (can be helpful when SMTP server is gone away);
* massEmailSiteUrl – to override the default site url (can be helpful if there's no access to your CRM from the internet, but you need to handle opting out & tracking urls; you will need to configure your server to handle requests to the specified URL);

### Kanban

* kanbanMaxOrderNumber – `50` – a number of records that can be ordered within a group; since v6.1.0;

### Text search

* textFilterContainsMinLength  – `4` – actual if *Use 'contains' operator when filtering varchar fields* parameter is enabled;


### PDF

* pdfEngine – `Tcpdf` – what PDF engine to use; since v6.1.0.
