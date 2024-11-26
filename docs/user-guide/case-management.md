# Case Management

In this article:

* [Overview](#overview)
* [Stream](#stream)
* [Email-to-case](#email-to-case)
* [Knowledge base](#knowledge-base)
* [Customer portal](#customer-portal)
* [Access to child records](#access-to-child-records)
* [Collaborators](#collaborators)
* [See also](#see-also)

## Overview

Cases provide issue-tracking capabilities and a key aspect of customer service in EspoCRM. The term 'ticket' can also be used to refer to Cases.

New Cases are supposed to be created in the following scenarios:

* Manually by CRM users;
* Manually by users of a customer portal;
* Through the API (e.g. through a web form;
* Automatically when a new email comes to a specific mailbox;
* Automatically by a Workflow rule.

When a new Case is created by a Portal User, it's not assigned to any user. By utilizing the [Workflows](../administration/workflows.md) tool, an administrator can create a rule that will notify certain users about every new Case in the system. Workflows also provide the ability to apply an assignment rule to new cases. *Round-Robin* and *Least-Busy* rules are available. For more complex business flows, it's recommended to utilize the [BPM tool](../administration/bpm.md).

To prevent overlooking of new Cases, users can add the Case entity type to the *Global Auto-follow* list in the user's Preferences. Then, the user will automatically follow every new Case created in the system they have access to.

The Case entity type can be associated with one Account and/or multiple Contacts. It also can be associated with a Lead record. Note that by default the Lead field is not available in the Detail layout. An administrator can add it at: Administration > Entity Manager > Case > Layouts > Detail.

!!! note

    If a related Contact is not associated with a Portal User, then the customer won't be receiving email notifications about updates in the Stream of te Case. In this scenario, you need to use emails for communication with the customer.

!!! tip

    Cases are not necessarily limited to customer service purposes. You can also use them to track non-support-related topics.

## Stream

A Case record has a Stream that can be used for communication between the customer and the support team.

CRM users can mark stream posts as *internal*. Such posts are not visible in the customer portal and the customer is notified about them. To make a post internal, click the *lock* icon next to the *Post* button befor posting.

## Email-to-case

An administrator can set up a Group Email Account that will create a new Case on each incoming email. For more information, [see here](../administration/emails.md).

Users can create Cases from Emails manually. On the Email detail view, click the dropdown in the top-right corner, then *Create Case*.

When a user wants to send a reply to a customer, they need to make sure that the Case is selected as a *Parent* of the Email that is being composed. This will force automatical addition of the group email address to the *Reply-To* field of the email. Then, when the customer replies on that email, it will be sent to the group email address rather than to the user’s one.

## Knowledge base

Users can relate Knowledge Base Articles to a Case record. See more info about the Knowledge Base [here](knowledge-base.md).

## Customer portal

An administrator can create a [Portal](../administration/portal.md) where customers will be able to create Cases. Permission to create Cases can be granted in a Portal Role.

Since Portal Users automatically follow Cases they have created, they will receive email notifications about new messages in the case's stream. Notifications are sent from the system email account. So when a customer replies to a notification, it will be sent to the system email address. It's also possible to make email replies to go to a Group Email Account. For this, you need to utilize the Workflow tool (or Formula) to make all new cases be automatically linked with the Group Email Account (use the Update Target Record action, set the *Group Email Account* field).

Cases marked is *Hidden from Portal* are not available in portals. It can be useful when referencing a Contact is needed but the customer should not have access to the Case. As of v9.0.

## Access to child records

User access to child records of a Case, such as Emails, Meetings and Calls, is not determined by access to the Case record. For example, a Case can be assigned to a User but a related Email is not related to that User resulting in the User not being able to view the Email.

By utilizing the Workflow tool, it's possible to write a rule that will automatically add the Assigned User of a Case to all child records. The same is also possible with the Teams fields.

## Collaborators

*As of v9.0.0.*

The collaborators feature can be enabled for Cases at Administration > Entity Manager > Cases > Edit.

Users added as collaborators to a Case will have read and stream access, provided their access level, as defined by Roles, is other than no.

## See also

* [Notifying contacts about new post in Case with Workflows](https://www.espocrm.com/blog/notifying-contacts-about-new-post-in-case-with-workflows/)
