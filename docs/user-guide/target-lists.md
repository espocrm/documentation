# Target Lists

Target Lists are used to subdivide Account, Contact, Lead, and User records into separate groups that can be included in or excluded from marketing campaigns and mass emails. As a rule, a target list is created based on some criteria, such as industry, age group, interests, marital status, or geographical location of the recipients.

Target lists allow businesses to personalize their marketing campaigns by reaching each group of recipients with relevant, segment-specific messages that fit their needs and interests. Aside from marketing, target lists can also be used to organize records. For example, you can group customers by region, or prepare a list of leads to be called.

Access to the Target List scope is controlled by roles.

## Using in list view

It is possible to filter Accounts, Contacts, and Leads records by Target Lists in the list view. To do so, add the *Target Lists* field from the dropdown next to the *Search* button. This is convenient for segmenting records; for example, when a user is working with Leads from a specific Target List.

## Populating

### Manual

Target lists can be populated with records manually. Records can be added one by one or in bulk.

To add multiple records in bulk, click *Select* from the dropdown menu in the bottom panel. Search using the desired criteria, then apply *Select All Results* and click *Select*.

### Sync with report

*Requires the Advanced Pack extension.*

A Target List can be synced with list [reports](reports.md#syncing-with-target-lists) results. This is convenient for mass email campaigns when you want to send emails only to contacts that meet specific criteria at the time of sending. The synchronization can be configured in the *Sync with Reports* panel on the Target List detail view.

It is possible to set up automatic background syncing. Alternatively, the Target List can be synced manually.

### Import

Accounts, Contacts, and Leads can be imported directly into a specific Target List. To do so, at the second step of the Import process, add the *Target List* field in the *Default Values* panel and select the desired Target List.

### Creating from campaign log

A new Target List can be created from the Campaign Log of a Campaign. It will be automatically populated with records based on the action types you selected. For example, you can pick only contacts that clicked on a tracking link.

When creating a Target List, you need to specify the log actions that will be included, and optionally, actions that will be excluded. For example, include all Sent and exclude Bounced and Opted Out.

## Custom entity type support

It is possible to include a custom entity type in Target Lists. To do so, create a many-to-many relationship between the Target List and the custom entity type (of the Person or Company type), and then add the corresponding panel to the Bottom Panels layout of the Target List entity type.