# Google Integration. Setting-up for Administrator

Note that the integration requires curl, libxml and xml PHP extensions installed. If any is not installed, you will be notified after saving.

* [Integration](#integration)
* [Access control](#access-control)

## Integration

Go to the Administration > Integrations > Google. Check *Enabled* checkbox.

* You will obtain *Client ID* and *Client Secret* in Google Developers Console.
* You will need to copy *Redirect URI*  to Google Developers Console.

![Integration](../../_static/images/extensions/google-integration/setting-up/1.png)

Do the following steps.

**1\.** Go to the [Google Developers Console](https://console.developers.google.com/).

**2\.** Create a new project, or select an existing one.

**3\.** Enable needed APIs.

On the *Dashboard*, click *ENABLE APIS AND SERVICES*.

Use search to find:

* Google Calendar API (for Calendar sync);
* People API (for Contacts pushing);
* Gmail API (for secure connection to Gmail).

Enable those that you need to use in your CRM. Note, that some APIs can be already enabled.

![Enable API](../../_static/images/extensions/google-integration/setting-up/3.png)

**4\.** Create credentials.

On the *Credentials* page, click *CREATE CREDENTIALS*, select *OAuth client ID*.

![Credentials](../../_static/images/extensions/google-integration/setting-up/4.png)

Select 'Web application' in *Application type* field. Add your site URL in *Authorized JavaScript origins*. Add *Redirect URI* (copied from EspoCRM integration panel) to *Authorized redirect URIs*.

![Client ID](../../_static/images/extensions/google-integration/setting-up/5.png)

**5\.** Find *Client ID* and *Client secret*. Copy them to EspoCRM integration panel and save.

**6\.** Configure consent screen.

In Google Developers Console, click *Oauth consent screen* on the sidebar. Follow the instructions on the page.

## Access control

**Important**: By default, regular users don’t have access to Google Calendar and Contacts integrations. Administrator needs to enable access in Roles. The following scopes need to be enabled:

* External Accounts;
* Google Calendar;
* Google Contacts.

![Roles](../../_static/images/extensions/google-integration/setting-up/roles.png)
