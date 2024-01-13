# Stream

The Stream in EspoCRM is a feed where you can see updates and new additions for records you follow. You are also can post messages to your own stream and to stream of another users.

By default, the following entity types have the stream: Accounts, Contacts, Leads, Opportunities, Cases, Tasks. Administrators can **enable** or **disable** stream for a certain entity type in [Entity Manager](../administration/entity-manager.md).

There are two types of stream in EspoCRM: record stream and user stream.

## Record Stream

The *Stream* panel is available on the record detail view at the bottom. Posts, updates and new additions related to the current record are displayed here.

It's possible to **move the stream panel down** so that it will appear under other panels. Administrator can do it at Administration > Layout Manager > select entity type > Bottom panels.

## User Stream

Users can see their Stream in the **Stream** dashlet as well as under the Stream tab. By default, the Stream tab is not added to the navbar.

Users can see the Stream of another users on the user's detail view if they have access defined by the *User Permission* in Roles.

In the user's Stream you can see posts and updates of records that the user follows. You can also see posts addressed to the user.

## Notifications

You will receive notifications about updates in your Stream that were done by another users.

## Posts

You can create a post related to a certain record. You are also able to attach multiple files and images to the post. Images can be pasted from the clipboard.

### Mentions

If you want to mention somebody in your post, you need to type `@` symbol and start typing the user's name. The user you have mentioned in your post will be notified.

!!! note

    The user who was mentioned in the post needs to have access to the Stream of the record where they were mentioned. Otherwise, the user won't receive the notification about the post.

!!! note

    The user needs to have a proper *Assignment Permission* (set in Roles) to be able to mention a specific user. If the assignment permission is set to `no`, then the user won't be able to mention anyone. If set to `team`, then they will be able to mention only users of their team (or teams). If set to `all`, then they will be able to mention anyone. Portal users are not able to mention users.

### Attachments

By default, users can attach files of any types to stream posts.

An administrator can configure the *Attachments* field at Administration > Entity Manager > Note > Fields > attachments (as of v7.2). The following parameters are available:

* Source list – to be able to attach from documents;
* Max file size;
* Accept – which file types to accept.

## Posts to users

Users can create posts to certain Users, to certain Teams, to all Users and to self. Access for this feature is controlled by the *Message Permission* in Roles.

You can post to Users:

* from the *Stream* dashlet;
* in the *Stream* panel on the user's detail view.

## Filtering

You can filter what to show in the Stream: *All*, *Posts* or *Updates*. Filters are availble in the dropdown in to top-right corner of the panel.

## See also

* [Activity Stream – Keep up with changes](https://www.espocrm.com/tips/activity-stream/)
* [Following records in EspoCRM](https://www.espocrm.com/tips/follow-records/)
