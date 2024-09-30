# Outlook Integration. Email

!!! note

    Before proceeding to this article it's recommended to [set up the integration](setting-up.md).

OAuth IMAP and SMTP authentication is available in the [Outlook Integration](https://www.espocrm.com/extensions/outlook-integration) extension. It provides a secure authentication for Office 365 and Outlook.com accounts. With this extension, you won’t need to store your Outlook password in EspoCRM.

In this article, both Office 365 and Outlook.com will be referred to as *Outlook*.

## Setting-up email account

Assuming that the administrator has already set up the integration.

Create a Personal or Group Email Account. Specify IMAP and SMTP parameters for Office 365 or Outlook.com (IMAP host: `outlook.office365.com` or `imap-mail.outlook.com`; SMTP host: `smtp.office365.com`). Leave the *Password* fields empty for both IMAP and SMTP. Then, save the record.

After that, the *Outlook* panel should appear on the right. You need to click *Connect* button. A popup will show up asking for a user consent.

!!! note

    You need to be logged in to Outlook as a user to which an email address of the current email account record belongs. For example, if you configure an email account for *example@outlook.com*, you need to log in to Outlook as a user who has *example@outlook.com* email address.

After that, you can test IMAP connection and sent a test email to make sure everything works fine.

!!! note

    If during IMAP testing TLS doesn't work, try the SSL option.

## Recommendations

When connecting to Outlook using the Outlook Integration extension and pressing *Connect* button, you must be asked to enter your credentials fully. This must be done if you did not enter the email address and password in the pop-up window earlier, because if you did, then in the pop-up window you will have the option to select email accounts. If the system just connects you without asking anything, then it's most likely the browser is using the stored values in cookies which allow connection, but may not allow access to the required scope.

There are some recommendations for setting up an email account if you encounter errors when connecting to SMTP.

1. Ensure you are not signed into `office.com`.
2. Clear cookies and other site data.
3. Go to email account and connect to Outlook.
4. Click Test Connection button, check if successful.
6. Click Send Test Email button, check if successful.
