# Stream

Stream in EspoCRM is a feed where you can see updates and new additions for records you follow. You are also can post messages to the own stream and to stream of another users.

By default, the following entity types have the stream: Accounts, Contacts, Leads, Opportunities, Cases, Tasks. Administrators can **enable** or **disable** stream for a certain entity type in [Entity Manager](../administration/entity-manager.md).

There are two types of stream in EspoCRM: record stream and user stream.

## Record Stream

The *Stream* panel is available on the record detail view at the bottom. Posts, updates and new additions related to the current record are displayed here.

It's possible to **move the stream panel down** so that it will appear under other panels. Administrator can do it at Administration > Layout Manager > select entity type > Bottom panels.

## User Stream

Users can see their stream in the Stream dashlet as well as under Stream tab. Users also can see stream of another users in the user's detail view, if they have access that is controlled by *User Permission* field in Roles.

In the user stream you can see posts and updates of records that the user follows. You can also see posts addressed to the user.

## Notifications

You will receive notifications about updates in your stream that were done by another users.

## Posts

You can create post related to a certain record. You are also able to attach multiple files and images to the post. Images can be pasted from the clipboard.

### Mentions

If you want to mention somebody in your post, you need to type `@` symbol and start to type user's name. The user you has mentioned in your post will be notified about it. 

!!! note

    The user who was mentioned in the post, needs to have an access to stream of the record where they were mentioned. Otherwise, the user won't receive the notification about the post.

!!! note

    The user needs to have a proper *Assignment Permission* (set in roles) to be able to mention a specific user. If the assignment permission is set to `no`, then the user won't be able to mention anybody. If set to `team`, then they will be able to mention only users of their team (or teams). If set to `all`, then will be able to mention anybody.

### Attachments

By default, users can attach files of any types to stream posts.

An administrator can configure the *Attachments* field at Administration > Entity Manager > Note > Fields > attachments (as of v7.2). The following parameters are available:

* Source list – to be able to attach from documents;
* Max file size;
* Accept – which file types to accept.

## Posts to users

Users can create post to certain users, to certain teams, to all users and to self. Access for this ability is controlled by *Assignment Permission* field in Roles.

## Filtering

You can filter what to show in a stream: *All*, *Posts* or *Updates*. Filters are availble in the dropdown in to top-right corner of the panel.

## See also

* [Activity Stream – Keep up with changes](https://www.espocrm.com/tips/activity-stream/)
* [Following records in EspoCRM](https://www.espocrm.com/tips/follow-records/)
