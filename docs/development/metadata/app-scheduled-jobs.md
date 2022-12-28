# app > scheduledJobs

Path: metadata > app > scheduledJobs.

Scheduled jobs definitions. A name => defs map. Defined scheduled job will be available for the admin when creating a scheduled job.

Example:

```json
{
    "MyJobName": {
        "name": "Record Job Name",
        "isSystem": false,
        "scheduling": "* * * * *",
        "jobClassName": "Espo\\Modules\\MyModule\\MyJob",
        "preparatorClassName": "Espo\\Modules\\MyModule\\MyJobPreparator"
    }
}
```

## name

*string*

A name to be used for job records. Not important.

## isSystem

*boolean*

Whether the job is system internal.

## scheduling

*string*

A default scheduling in crontab notation.

## jobClassName

*class-string<Espo\Core\Job\Job|Espo\Core\Job\JobDataLess\>*

A job implementation. Should implement either `Job` or `JobDataLess` interfaces. Usage of the former requires having the preparator.

## preparatorClassName

*class-string<Espo\Core\Job\Preparator\>*

A preparator. Optional. The preparator is called by the application. It serves for creating job records. E.g. for email checking, the preparator creates jobs for each email account.
