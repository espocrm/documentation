# Outlook Integration. Email

**Note**: Before proceeding to this article it's recommended to [set up the integration](setting-up.md).

Oauth authentication is available in [Outlook Integration](https://www.espocrm.com/extensions/outlook-integration) extension. It provides a secure authentication for Office 365 accounts. With this extension, you won’t need to store your Outlook password in EspoCRM.

For Office 365 accounts using the integration is the only option to receive and send emails.

Note: Requires EspoCRM v5.9.3 or later.

## Setting-up email account

Assuming, that the administrator has already set up the integration.

Create a personal or group email account. Specify IMAP and SMTP parameters for Office 365 (hosts: `outlook.office365.com` & `smtp.office365.com`). Leave *Password* fields empty. Then, save the record.

After that, *Outlook* panel should appear on the right. You need to click *Connect* button. A popup will show up asking for a user consent.

Note: You need to be logged in to Outlook as a user to which an email address of the current email account record belongs. For example, if you configure email account for *example@outlook.com*, you need to log in to Outlook as a user who has *example@outlook.com* email address.

After that, you can test imap connection and sent test email to make sure everything works fine.
