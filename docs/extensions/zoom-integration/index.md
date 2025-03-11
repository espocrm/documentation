# Zoom Integration

The Zoom integration allows to create Zoom meetings from Espo.

In this article:

* [How it works](#how-it-works)
* [Connecting Zoom accounts](#connecting-zoom-accounts)
* [Setting up](#setting-up)
* [Usage](#usage)

## How it works

You need to have one general Zoom account (organization account). This account will be connected to Espo. Espo users need to have their Zoom accounts linked to the general Zoom account. The Espo administrator will select which users can use Zoom integration.

When an Espo meeting is pushed to Zoom, it's created in a Zoom account of the user assigned to meeting. If the user does not have a Zoom account, it won't be possible to push the meeting.

## Connecting Zoom accounts

Connect Zoom accounts of your employees to the organization Zoom account.

To connect a user:

1. Log in to Zoom Admin as an admin.
2. Go to User Management > Users.
3. Click Add Users and enter the user's email address.
4. Check Zoom Meetings Basic for the user.
5. Send an invitation, and the user must accept it to join your Zoom account.

## Setting up

As an Espo administrator, go to: Administration > Integrations > Zoom. Then, follow the guidelines displayed on the page.

1. Create a General App on the Zoom App Marketplace. Set it as Admin-managed.
2. Obtain the Client ID and Client Secret.
3. Copy the Redirect URI from here and add it in the created Zoom app.
4. Add the required scopes in the Zoom app.
5. Connect.

Required scopes:

* `meeting:write:meeting:admin`
* `meeting:update:meeting:admin`
* `meeting:delete:meeting:admin`

There are Development and Production modes for Zoom apps. They use different credentials. It's recommended to the the Production mode unless for testing purposes.

If you use the Production mode, you will also need to fill in the required fields:

* App Name
* Developer Contact Information
* Scope Description

Then, the Zoom App will be marked as *Ready for beta test* in the right panel. Otherwise, you won't be able to connect to a production mode app.


!!! note

    There is not need to publish the Zoom App.


After connecting to Zoom in Espo, on the same page, select users who are supposed to receive Espo meetings in their Zoom accounts.

The primary email address of a user is used as their Zoom ID by default. You can also specify the Zoom ID for a particular user.

To allow users to push Espo meetings to Zoom, you need to enable the *Zoom Meetings* scope in roles of those users.


## Usage

To be able to push a meeting to Zoom, a user needs to have:

* access to the *Zoom Meetings* scope;
* edit access the meeting.

To push the meeting, click *Push to Zoom* from the dropdown next to the *Edit* button.

Once a Zoom meeting is created, the Join URL field in the Espo meeting will be set to the Zoom's URL.

If you edit an already pushed meeting in Espo, it will be maked as out-of-sync. You can push it again so that it will become synced with Zoom.

If an Espo meeting has status *Not Held*, you can delete the corresponding Zoom meeting by clicking *Delete from Zoom*.

### Join URL

The *Join URL* field is the default Espo field. You can add to the Meeting's layout under: Administration > Entity Manager > Meeting > Layouts > Detail.

When sending an email invitation from Espo, the Join URL will be included in the email body. You can edit the email template under Administration > Template Manager > Invitation · Meeting.

### Meeting scheduler

The Zoom integration is integrated with the [Meeting Scheduler](../meeting-scheduler/index.md). You can specify Zoom as the online location for a specific scheduler.

### Workflows

It's possible to create and delete zoom meetings using a [Workflow](../../administration/workflows.md) rule. Actions are available under *Run Service Action* for a Meeting target.
