# Stream

Stream in EspoCRM is a feed where you can see posts and updates of records you follow. You can also post messages to your own Stream and to the Stream of other Users.

By default, the following entity types have the Stream enabled: Accounts, Contacts, Leads, Opportunities, Cases, Meetings, and Tasks. Administrators can enable or disable  Stream for a certain entity type at Administration > Entity Manager > {Entity Type} > Edit.

## Record Stream

The *Stream* panel is available on the record detail view in the bottom. Posts, updates and new additions related to the current record are displayed here. A single Stream record internally is called *Note*.

An administrator can move the Stream panel down so that it will appear under other panels or put the panel into a tab. This can be done at Administration > Entity Manager > {Entity Type} > Layouts > Bottom Panels.

Stream posts can be pinned. A user needs to have *edit* access to a record to be able to pin or unpin Stream posts.

## User Stream

Users can view their own Stream in the *Stream* dashlet as well on a separate Stream page.

Users can see Stream of another users on the user's detail view if they have access defined by the *User Permission* in Roles.

In the user's Stream, you can see posts and updates of records that the user follows. You can also see posts addressed to that user.

It's possible to view all activity for a specific user. It will display all notes that either created directly by the user or created as a result of that users' actions. Available from the dropdown menu on the Stream panel on the User's detail view. As of v8.2.

## Notifications

A user receives notifications about updates in their Stream that were done by other users.

## Posts

You can create a post related to a certain record. You are also able to attach multiple files and images to a post. Images can be pasted from the clipboard.

### Mentions

If you want to mention somebody in your post, you need to type `@` symbol and start typing the user's name. The user you have mentioned in your post will be notified.

!!! note

    The user who was mentioned in the post needs to have access to the Stream of the record where they were mentioned. Otherwise, the user won't receive a notification about the post.

!!! note

    The user needs to have a proper *Mention Permission* (set in Roles) to be able to mention a specific user. If the assignment permission is set to `no`, then the user won't be able to mention anyone. If set to `team`, then they will be able to mention only users of their teams. If set to `all`, then they will be able to mention anyone. Portal users are not able to mention users.

### Attachments

By default, users can attach files of any types to stream posts.

An administrator can configure the *Attachments* field at Administration > Entity Manager > Note > Fields > attachments (as of v7.2). The following parameters are available:

* Source list – by adding Documents, it allows to attach Documents to stream posts directly;
* Max file size;
* Accept – which file types to accept.

### Quote reply

*As of v8.5.*

By clicking 'Quote Reply' on a stream post, it will paste quoted contents into the text field. If a part of a post is selected, only the selected part will be quoted.

## Posts to users

Users can create posts to certain Users, to certain Teams, to all Users and to self. Access for this feature is controlled by the *Message Permission* in Roles.

You can post to Users:

* from the *Stream* dashlet;
* in the *Stream* panel on the user's detail view.

## Filtering

You can filter what to show in the Stream: *All*, *Posts* or *Updates*. Filters are available in the dropdown in to top-right corner of the panel.

## Global Stream

*As of v8.2.*

The Global Stream is available on a separate page where users can see all Stream notes, not only related to records they follow. Users can perform search: by specific fields or by a text filter. Notes that user don't have access to are not listed.

* Access to the Global Stream is controlled by Roles.
* A separate navbar tab is available.
* Can be also reached from the Stream page.

!!! note

    If a user does not have *all* access level for all entity types, there are possible scenarios leading to an empty or not complete result list being displayed. It's a server load optimization measure when it would take too much of resources to find the first records the user has access to. Consider adding some search filters in such cases.

## See also

* [Activity Stream – Keep up with changes](https://www.espocrm.com/tips/activity-stream/)
* [Following records in EspoCRM](https://www.espocrm.com/tips/follow-records/)
