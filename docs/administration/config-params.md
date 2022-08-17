# Config parameters

Config parameters can be changed or added manually in the file `data/config.php`.

As of v7.0 parameters can be added to the file `data/config-internal.php`. Use the **internal config** to store sensitive parameters.

This is not a full list of params. Most of params available in admin UI are not listed here.

## List of parameters

The list of parameters along with their default values.

* [General](#general)
* [UI](#ui)
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
* [Events](#events)
* [Attachments](#attachments)

### General

* siteUrl – URL of EspoCRM instance;
* useCache – `true`;
* isDeveloperMode – `false` – toggle developer mode;
* useCacheInDeveloperMode – `false` – to use front-end cache in developer mode; front-end is not cached by default in developer mode;
* maintenanceMode – `false` – only administrators will have access to the system;
* disableCron – `false`;
* useWebSocket – `false`;
* ajaxTimeout – `60000` – timeout for ajax requests (in milliseconds);
* language – system language;
* timeZone – system timezone;
* exportDelimiter – `','` – default export delimiter;
* recordListMaxSizeLimit – `200` – max number of records can be fetched in a single GET API request;
* maxSelectTextAttributeLengthForList – `10000` – text fields are cut when records accessed with a list request;
* displayListViewRecordCount – `true` – to display a number of records on the list view;
* addressCountryList – array of countries available in autocomplete;
* addressCityList – array of cities available in autocomplete;
* addressStateList – array of states available in autocomplete;
* defaultCurrency – currency applied by default;
* baseCurrency – which currency to use as base when defining rates;
* currencyList – array of available currencies;
* thumbImageCacheDisabled – `false` – to disable thumb image files being created in `data/upload/thumbs` directory (as of v7.0);
* globalSearchMaxSize – `10` – how much records is shown in the global search;
* massActionIdleCountThreshold – `100` – record number threshold after which mass-action is processed in idle (as of v7.1);
* exportIdleCountThreshold  – `1000` – record number threshold after which export is processed in idle (as of v7.1);
* leadCaptureAllowOrigin –  `*` – *Access-Control-Allow-Origin* response header value for the lead capture endpoint;
* clientSecurityHeadersDisabled – disable security headers (as of v7.2);
* clientCspDisabled –  `false` – disable Content-Secirity-Policy header for the client page (as of v7.2);
* clientCspScriptSourceList – a script source white-list for the Content-Secirity-Policy header (as of v7.2);

### UI

* applicationDescription – the text in the meta tag; by default `EspoCRM - Open Source CRM application` text is used (as of v7.0);
* adminPanelIframeDisabled – `false` – disables the right iframe-panel on the administration page (as of v7.0);
* activitiesCreateButtonMaxCount – `3` – a max number of create buttons to display on the Activities pagel (as of v7.2);

### Access control

* aclStrictMode – `true` – see [here](roles-management.md#permissions-by-default) (removed in v7.0, the system is always in strict mode);
* aclAllowDeleteCreated – `true` – whether to allow regular users to delete record they created, even they don't have *delete* access;
* aclAllowDeleteCreatedThresholdPeriod – `24 hours` – time window available for deletion of created records;

### Notifications

* adminNotifications – `true` – notifications in admin panel;
* adminNotificationsNewVersion – `true` – notifications about new versions in admin panel;
* adminNotificationsNewExtensionVersion – `true` – notifications about new extension versions in admin panel;
* emailReminderPortionSize – `10` – how much email reminders can be sent at once (as of v7.0);
* notificationsMaxSize – `5` – how much in-app notifications is shown when the notification panel is shown up;
* notificationsCheckInterval – `10` – an interval between checks for new notifications (actual only if web socket is not enabled); 

### Emails

* emailKeepParentTeamsEntityList – `['Case']` – when a related email is fetched, teams of the parent record will be copied to the email; by default, it's available only for cases;
* emailForceUseExternalClient – `false` – when composing an email, all users will be forced to use external client;
* emailAutoReplySuppressPeriod – `'2 hours'` – an auto-reply email (for group email account) won't be sent to the same recipient if one was already sent in a period of time defined by the parameter; to prevent looping (as of v6.1.8);
* emailAutoReplyLimit – `5` – a max number of auto-reply emails that can be sent to one recipient within a period defined by the *emailAutoReplySuppressPeriod* parameter (as of v7.0);
* emailFoldersDisabled – `false` – disables email folders;

### Stream

* noteEditThresholdPeriod – `'7 days'` – how much time is available for editing stream posts;
* noteDeleteThresholdPeriod – `'1 month'` – how much time is available for deleting stream posts;
* streamEmailWithContentEntityTypeList – `['Case']` – to display the content of the email in stream; by default, it's available only for cases;
* recordFollowersLoadLimit – `6` – how much records loaded in the *Followers* field;

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
* passwordChangeRequestNewUserLifetime – `2 days` – how long a password change link for new users is valid (as of v7.1);
* passwordChangeRequestExistingUserLifetime – `2 days` – how long a password change link (initiated by admin) for existing users is valid (as of v7.1);

### Auth

* authMaxFailedAttemptNumber – `10` – if number of failed login attempts (within *authFailedAttemptsPeriod*) exceeds the set number, then the system won't allow to login; 
* authFailedAttemptsPeriod – `'60 seconds'` – period taken into account for *authMaxFailedAttemptNumber*;

### Jobs & Daemon

* jobMaxPortion – `15` – max number of jobs per one execution; a portion of jobs that is run in a queue is counted as one job;
* jobPeriod – `7800` – max execution time (in seconds) allocated for a single job; if exceeded then set to *Failed*;
* jobPeriodForActiveProcess – `36000` – max execution time (in seconds) allocated for a single job with active process; if exceeded then set to *Failed*;
* jobRerunAttemptNumber – `1` – number of attempts to re-run failed jobs;
* jobRunInParallel – `false` – jobs will be executed in parallel processes (see [here](jobs.md#running-jobs-in-parallel-processes));
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

* kanbanMaxOrderNumber – `50` – a number of records that can be ordered within a group; as of v6.1;
* kanbanMinColumnWidth – `220` – a min width of column; the horizontal scrolling will appear to prevent columnt being shrinked less than the specified value; as of v7.1;

### Text search

* textFilterContainsMinLength  – `4` – actual if *Use 'contains' operator when filtering varchar fields* parameter is enabled;


### PDF

* pdfEngine – `Tcpdf` – what PDF engine to use; since v6.1;

### Events

* eventAssignedUserIsAttendeeDisabled – `false` – If set *true*, then assigned user won't be automatically added to an attendee list (for meetings and calls);

### Attachments

* attachmentUploadMaxSize – `256` – max size of attachments in Mb; as of v7.2;
* attachmentUploadChunkSize – `4` – chunk size in Mb; attachments uploaded by chunk; `0` disables uploading by chunk; as of v7.2;
* inlineAttachmentUploadMaxSize – `20` – max size of inline attachments in Mb (e.g. inline images for emails);
