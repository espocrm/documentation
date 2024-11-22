# Mail Merge (mass snail mailing)

The Main Marge feature provides the ability to mass generate snail mails for printing.

1\. You need to have a Target List populated with recipients. You can access Target Lists by navigating to the Campaigns tab and clicking the Target Lists button in the top-right corner.

2\. Create a PDF Template for an entity type you want to send mails to. If the Target List contains records of different entity types (e.g. both Contacts and Leads) you need to create separate templates for each one.

!!! note

    An Administrator can create a template at Administration > PDF Templates. The Templates tab is hidden by default, but can be added by the administrator at Administration > User Interface.

3\. Create a campaign of the *Mail* type. Specify the Target List for this Campaign. Specify the templates you created before.

4\. On the Campaign detail view, click the dropdown next to the *Edit* button and then click *Generate Mail Merge PDF*. Select an entity type and click *Proceed* button.

It will generate a single PDF document (or multiple PDFs zipped, depending on the used engine) for multiple records that you can print.

!!! note

    By default, records with empty *Address* field are skipped.
