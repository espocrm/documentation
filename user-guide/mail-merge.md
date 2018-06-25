# Mail Merge (mass mailing)

This feature is available since 5.3.0 version.

1. You need to have a target with list populated with recipients. Target lists can be reached by Campaigns tab > Target Lists button in the top-right corner.
2. Create a template for entity type you want to send mails to. If target list contains records of different entity types (e.g. Contacts and Leads) you need to create templates for each.  Note, that Templates tab is hidden by default.
3. Create a campaign of Mail type. Specify the target list for this campaign. Specify templates.
4. On the campaign detail view click on the dropdown next to the edit button and then click 'Generate Mail Merge  PDF'. Select an entity type and click Proceed button.

It will generate a single PDF document for multiple records that you can print.

Note that by default records, not having the address field filled, are skiped.
