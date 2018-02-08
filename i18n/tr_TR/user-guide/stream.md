# Stream

Stream in EspoCRM is a feed where you can see updates and new additions for records you follow. You are also can post to own stream and to stream of another users (since version 3.8.0). There are two kinds of stream in EspoCRM: record stream and user stream.

By default the following entities have a stream: Accounts, Contacts, Leads, Opportunities, Cases. Administrators can enable or disable stream for a certain entity in [Entity Manager](../administration/entity-manager.md).

## Record Stream

Record Stream is shown in a Stream panel of a certain record on the detail view. Posts, updates and new additions related to the current record are displaed here.

## User Stream

Users can see their stream in Stream dashlet as well as under Stream tab. Users also can see stream of another users in the user's detail view, if they have an access that is controlled by `User Pemission` field of Roles.

In user stream you can see posts, updates and new additions related to records the user follows. You also can see posts addressed to the user. Those posts are not related to any record.

## Notifications

You will recieve notifications about new additions to your stream that were caused by another users.

## Posts

You can create post related to a certain record. You also able to attach multiple files and images to your post. If you want to mention somebody in your post you need just type `@` symbol and start to type user's name. The user you has mentioned in your post will be notified about it.

## Posts to users

_This feature is available since version 3.8.0._

Users can create post to certain users, to certain teams, to all users and to self. An access for this ability is controlled by `Assignment Permission` field of Roles.

## Filtering

You can filter what to show in a stream: `All`, `Posts` or `Updates`.  

