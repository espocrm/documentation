# Mail Merge (mass snail mailing)

1\. You need to have a target list populated with recipients. Target lists can be reached by Campaigns tab > Target Lists button in the top-right corner.

2\. Create a PDF template for an entity type you want to send mails to. If the target list contains records of different entity types (e.g. Contacts and Leads) you need to create templates for each one.

Note: Administration can create template at Administration > PDF Templates. Templates tab is hidden by default, but can be added by an Administrator.

3\. Create a campaign of 'Mail' type. Specify the target list for this campaign. Specify the templates you created before.

4\. On the campaign detail view click on the dropdown next to the *Edit* button and then click *Generate Mail Merge PDF*. Select an entity type and click *Proceed* button.

It will generate a single PDF document (or multiple PDFs zipped, depending on a used engine) for multiple records that you can print.

Note: By default, records with empty *Address* field are skiped.
