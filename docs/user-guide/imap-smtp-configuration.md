﻿# IMAP and SMTP configuration

In this article:

* [IMAP configuration](#imap-configuration)
* [SMTP configuration](#smtp-configuration)
* [G Suite account](#setup-for-g-suite-account)
* [Gmail account](#setup-for-gmail-account)
* [Outlook account](#setup-for-outlook-account)
* [Yahoo account](#setup-for-yahoo-account)
* [Troubleshoot problems](#troubleshoot-problems)

## IMAP configuration

Note: You need to have cron properly configured in your system to have inbound emails working.

IMAP allows to retrieve your emails from an email client. To setup the IMAP account, do the following steps:
1. Select **Emails Tab > top-right menu > Personal Email Accounts**.
2. Click on **Create Personal Email Account**.
3. In the **Main** section, specify your **Email Address**. The **Name** of personal email account is generated automatically, but you may change it. **Fetch since** allows to choose the date from which emails should be archived. In case you want to archive old emails, set it to some prior date to the day from which they should be fetched.

![Create personal email account](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/1.png)

4. In the **IMAP** section, enter your **Host** name, your **Email Client Username** and **Email Client Password** in the fields shown. Tick of **SLL** for a secure connection. The IMAP **Port** will be generated automatically.

![IMAP configuration](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/2.png)

5. Specify what folders to monitor in **Monitored Folders** field. By default, it is set to INBOX. If you use some external email client to send emails, you can add Sent folder to archive those emails.
6. **Put in Folder** field allows to specify the folder in which the incoming emails will be put.
7. Click on **Test Connection** to check whether everything was specified correctly.  If a connection is successful, click **Save** on the top of the page.

## SMTP configuration

SMTP allows to send email messages out. Users can setup SMTP settings in Preferences as well as in their Personal Email Accounts. An administrator can also allow to use System SMTP (make it shared).

Users can have multiple SMTP accounts (since version 4.2.0). However, email addresses a user can use to send emails from are defined by email addresses of User record.

To setup SMTP account, do the following:

1. Navigate either to **Personal Email Accounts page (Emails Tab > top-right menu > Personal Email Accounts)** or to **Preferences > SMTP** settings.
2. Tick off **Use SMTP** box.
3. Enter your **SMTP Host** name, in SMTP security field select **TLS** for a secure connection. The **SMTP** Port will be generated automatically.
4. Tick **SMTP Auth** box and enter your **Email Client Username** and **Email Client Password** in the fields shown.
5. Click on **Send Test Email** to check whether everything was specified correctly. If the connection is successful, you will receive test email on the specified email address.

![SMTP configuration](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/3.png)

## Setup for G Suite Account

1. Sign into your **Google Admin console**.
2. Navigate to **App > G Suite > Gmail > Advanced settings**.
3. Select the organizational unit in the **Organizations section**.
4. Under the POP and IMAP Access, uncheck the **Disable POP and IMAP access for all users box** checkbox.
5. Each user has to enable IMAP access as descibed for [Gmail Account](#setup-for-gmail-account).

## Setup for Gmail Account

1. Sign into your **Gmail Account**.
2. Select ![Settings](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/4.png) > Settings.
3. Click the **Forwarding and POP/IMAP** tab.
4. In the **IMAP access**, select **Enable IMAP**.
5. Click on **Save Changes**.

Note: There are two ways in which you can setup IMAP and SMTP for Gmail account:

* Use [Google Integration](https://www.espocrm.com/extensions/google-integration/) that provides a secure authentication via Oauth2.
* Enable [access for less secure application](#for-gmail-accounts) at your Google account settings.

For more information, please follow the link: (https://support.google.com/mail/answer/7126229?hl=en).

## Setup for Outlook Account

1. Go to your **Outlook Account**.
2. Select ![Settings](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/4.png) > **View all Outlook settings**.
3. On the navigation panel, select **Mail > Sync email**.
4. Click **Yes** to enable POP and IMAP access.
5. Press **Save** button on the top of the page.

![Outlook configuration](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/5.png)

## Setup for Yahoo Account

IMAP and SMTP access are enabled by default. All you need is enable the "less secure" access. For more information, please follow these [instructions](#for-yahoo-accounts).

Configuration details are available by the link: (https://help.yahoo.com/kb/SLN4075.html).

## Troubleshoot problems

### Error: Cannot login, user or password wrong

#### Step 1. Check the Email Client Username and Email Client Password.

If you cannot login, make sure you’ve provided the right username and password.

#### Step 2. Allow less secure apps.

Use [Google Integration](https://www.espocrm.com/extensions/google-integration/) that provides a secure authentication via Oauth2, otherwise you have to change your settings to allow less  secure apps to access your account.

#### For Gmail Accounts

1. Go to your **Google Account**.
2. Select **Security** on the navigation panel.
3. In the **Less secure app access section**, click **Turn on access**.

![Less secure app](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/6.png)

#### For Yahoo Accounts

1. Go to your **Yahoo Account**.
2. On the navigation panel, select **Account Security**.
3. At the bottom of the page, click **Allow apps that use less secure sign in**.

![Less secure app](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/imap-smtp-configuration/7.png)
