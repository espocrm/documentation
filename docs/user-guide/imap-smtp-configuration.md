# IMAP and SMTP configuration

In this article:

* [IMAP configuration](#imap-configuration)
* [SMTP configuration](#smtp-configuration)
* [Google Workspace](#google-workspace)
* [Gmail](#gmail)
* [Outlook](#outlook)
* [Yahoo](#yahoo)

## IMAP configuration

!!! note

    You need to have cron properly configured in your system to have inbound emails working.

IMAP allows to retrieve your emails from a mail server. To set up an IMAP account, do the following steps:

1. Go to Emails Tab > top-right menu > Personal Email Accounts.
2. Click on *Create Personal Email Account*.
3. In the *Main* section, specify your Email Address. The *Name* of the personal email account is generated automatically, but you can change it. *Fetch since* allows to choose a date from which emails will be imported. If you want to archive old emails, set it to some past date.

![Create personal email account](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/1.png)

4. In the *IMAP* section, enter your *Host* name, your *Username* and *Password*. Tick off *SSL* for a secure connection. The IMAP *Port* will be generated automatically.

![IMAP configuration](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/2.png)

5. Specify what folders to monitor in the *Monitored Folders* field. By default, it is set to INBOX. If you use some external email client to send emails, you can add the Sent folder to archive those emails.
6. *Put in Folder* field allows to specify an Espo email folder in which incoming emails will be put.
7. Click on *Test Connection* to check whether everything was set correctly. If the connection is successful, click *Save*.

## SMTP configuration

SMTP is for sending emails. Users can setup SMTP settings their Personal Email Accounts. An administrator can also allow to use the System SMTP (by marking it shared).

Users can have multiple SMTP accounts. However, email addresses a user can use to send emails from are defined by email addresses of the User record (Administration > Users).

To set up an SMTP account, do the following:

1. Navigate to the *Personal Email Accounts* page: Emails Tab > top-right menu > Personal Email Accounts.
2. Tick off the *Use SMTP* box.
3. Enter your *SMTP Host* name, in the SMTP security field select *STARTTLS* or *SSL/TLS* for a secure connection. The proper *SMTP Port* will be set automatically.
4. Tick off the *SMTP Auth* box and enter your *Username* and *Password*.
5. Click on the *Send Test Email* button to send a test email to a specified email address.
6. Save.

![SMTP configuration](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/3.png)

## Google Workspace

1. Sign into your *Google Admin console*.
2. Navigate to *App > G Suite > Gmail > Advanced settings*.
3. Select the organizational unit in the *organizations section*.
4. Under the POP and IMAP Access, uncheck the *Disable POP and IMAP access for all users box* checkbox.
5. Each user has to enable IMAP access as described for [Gmail Account](#gmail).

## Gmail

1. Sign into your *Gmail Account*.
2. Select ![Settings](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/4.png) > Settings.
3. Click the *Forwarding and POP/IMAP* tab.
4. In the *IMAP access*, select *Enable IMAP*.
5. Click on *Save Changes*.

!!! note

    There are two ways in which you can set up IMAP and SMTP for Gmail account:

    * Use the [Google Integration](https://www.espocrm.com/extensions/google-integration/) extension that provides a secure authentication via Oauth2.
    * Use a generated [App Password](https://support.google.com/accounts/answer/185833). Requires enabling 2-step verification for your Google account.

For more information, follow the [link](https://support.google.com/mail/answer/7126229?hl=en).

## Outlook

1. Go to your *Outlook Account*.
2. Open Settings ![Settings](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/4.png).
3. On the navigation panel, select *Mail > Forwarding and IMAP*.
4. *Sign in* if required.
5. Check *Let devices and apps use IMAP*. Here you can also view your IMAP and SMTP settings.
6. Click *Save* button.

!!! important

    The TLS encryption method may not work for IMAP, use the SSL method in this case.

!!! note

    If you have **2FA** enabled for your Microsoft account, you need to create app password and use it in Espo instead of your main password. More info [here](https://support.microsoft.com/en-us/help/12409/microsoft-account-app-passwords-and-two-step-verification).

## Yahoo

Configuration details are available [here](https://help.yahoo.com/kb/SLN4075.html).

## See also

See the articles for specific providers:

* [Gmail](https://support.google.com/accounts/answer/185833)
* [Yahoo](https://in.help.yahoo.com/kb/SLN15241.html)
* [Outlook](https://support.microsoft.com/en-us/account-billing/using-app-passwords-with-apps-that-don-t-support-two-step-verification-5896ed9b-4263-e681-128a-a6f2979a7944)
