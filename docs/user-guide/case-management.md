# Case Management

In this article:

* [Overview](#overview)
* [Stream](#stream)
* [Email-to-Case](#email-to-case)
* [Knowledge Base](#knowledge-base)
* [Customer Portal](#customer-portal)
* [Access to child records](#access-to-child-records)


## Overview

Cases provide the issue tracking ability. It's a principal aspect of customer service in EspoCRM. The term 'ticket' can also be used for cases.

New cases are supposed to be created by the following scenarios:

* Manually by CRM users
* Manually by users of the customer portal
* Through the API (e.g. through the web form)
* Automatically when a new email came to a specific mailbox
* Automatically by a Workflow rule

When the new Case is created by a Portal User, it's not assigned to any user. By utilizing the [Workflows](../administration/workflows.md) tool, an administrator can create a rule that will notify certain users about a new Case in the system. Workflows also provide the ability to apply assignment rule to new cases. *Round-Robin* and *Least-Busy* rules are available. For more complex business flows it's recommended to utilize the [BPM tool](../administration/bpm.md).

To prevent overlooking of new cases, users can add the Case entity type to the *Global Auto-follow* list in the user's Preferences. Then the user will automatically follow every new case.

!!! note

    If there is no portal user associated with a linked contact, then the customer won't receive email notifications about updates in the Stream. You need to use emails for communication with the customer.

The Case entity type can be associated with one Account and/or with multiple Contacts. It also can be associated with a Lead record. Note that by default the Lead field is not available on the Detail layout. An administrator can add it at: Administration > Entity Manager > Case > Layouts > Detail.

## Stream

Case record has a stream that can be utilized for a communication between customer and service.

CRM users can make *internal posts* that won't be visible in a customer portal. For this, you need to click the lock icon next to *Post* button.

## Email-to-Case

An administrator can set up a Group Email Account that will create a new Case on each new incoming email. For more information [see here](../administration/emails.md).

Users can create Cases from Email manually. On the Email detail view, click the dropdown in the top-right corner, then *Create Case*.

When a user wants to send a reply to a customer, they need to make sure that the Case is selected as a *Parent* of the Email that is being composed. It will add the group email address to the *Reply-To* field of the email. So the customer's reply will be sent to the group address rather than to the user’s one.

## Knowledge Base

Users can relate Knowledge Base Articles to a Case record. See more info about knowledge base [here](knowledge-base.md).

## Customer Portal

An administrator can create a [Portal](../administration/portal.md) where customers will be able to create Cases. Permission to create cases can be granted in a Portal Role.

Since Portal Users automatically follow Cases they have created, they will receive email notifications about new messages in the case's stream. Notifications are sent from the system email account. So when a customer replies to a notification, it will be sent to the system email address. It's also possible to make email replies to go to a Group Email Account. For this, you need to utilize the Workflow tool (or Formula) to make all new cases be automatically linked with a Group Email Account (use rgw Update Target Record action, set *Group Email Account* field).

## Access to child records

User access to child records of a Case, such as Emails, Meetings and Calls, is not determined by access to the Case record. For example, a Case can be assigned to a User but a related Email is not related to that User resulting in the User not being able to view the Email.

By utilizing the Workflow tool, it's possible to write a rule that will automatically add the Assigned User of a Case to all child records. The same is also possible with the Teams fields.

## See also

* [Notifying contacts about new post in Case with Workflows](https://www.espocrm.com/blog/notifying-contacts-about-new-post-in-case-with-workflows/)
