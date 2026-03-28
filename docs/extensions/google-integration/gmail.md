# Google Integration. Gmail

!!! note

    Before proceeding to this article it's recommended to [set up the integration](setting-up.md).

Gmail Secure Authentication is available in [Google Integration](https://www.espocrm.com/extensions/google-integration) extension. It provides a secure authentication for Gmail accounts via OAuth2. With this extension, you won’t need to store your Gmail password in EspoCRM and enable access for less secure applications in your Google Account settings.

## Setting-up email account

Assuming that the administrator has already set up the integration.

Create a personal or group email account. Specify IMAP and SMTP parameters for Gmail (hosts: `imap.gmail.com` & `smtp.gmail.com`). Leave *Password* fields empty. Then, save the record.

After that, *Gmail* panel should appear on the right. You need to click *Connect* button. A popup will show up asking for a user consent.

!!! note

    You need to be logged in to Google as a user to which an email address of the current email account record belongs. For example, if you configure email account for *example@gmail.com*, you need to log in to Google as a user who has *example@gmail.com* email address.

![Panel](../../_static/images/extensions/google-integration/gmail.png)

After that, you can test imap connection and sent test email to make sure everything works fine.

### Using only IMAP or only SMTP

Once you connect the email account to Google, it will use authentication to Google for both IMAP and SMTP. If you want to use the Google authentication only for IMAP or only for SMTP, while using a different host for another protocol, you need to create a separate email account (for the same user and the same email address).
