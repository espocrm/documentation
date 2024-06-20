# Case Management

In this article:

* [Overview](#overview)
* [Stream](#stream)
* [Email-to-Case](#email-to-case)
* [Knowledge Base](#knowledge-base)
* [Customer Portal](#customer-portal)


## Overview

Cases provide the issue tracking ability. It's a principal aspect of customer service in EspoCRM. 'Ticket' term also can be used for cases.

The Case entity can be associated with one Account and/or with multiple Contacts.

New cases are supposed to be created by the following scenarios:

* Manually by CRM users
* Manually by users of the customer portal
* Through the API (e.g. through the web form)
* Automatically when a new email came to a specific mailbox
* Automatically by a Workflow rule

When the new case is created by a portal user it's not assigned to any user. By utilizing [Workflows](../administration/workflows.md) administrator can create rule that will notify certain users about a new case in the system. Workflows also provide an ability to apply assignment rule to new cases, i.e. *Round-Robin* and *Least-Busy* rules. For more complex business flows it's recommended to utilize [BPM tool](../administration/bpm.md).

To prevent overlooking of new cases, users can add Case entity type to the *Global Auto-follow* list at Preferences. Then they will automatically follow every new case.

!!! note

    If there is no portal user associated with a linked contact, then the customer won't receive email notifications about updates in the Stream. You need to use emails for communication with the customer.

## Stream

Case record has a stream that can be utilized for a communication between customer and service.

CRM users can make *internal posts* that won't be visible in a customer portal. For this, you need to click the lock icon next to *Post* button.

## Email-to-Case

Administrator can set up Group Email Account that will create a new case on each new inbound email. For more information [see here](../administration/emails.md).

Users can create a case from an email manually. On the email detail view click the dropdown in the top-right corner, then *Create Case*.

When a user want to send a reply to the customer, they need to make sure that the case is selected as a *Parent* of the email that is being sent. It will add the group email address to *Reply-To* field of the email. So the customer's reply will be sent to the group address rather than to the user’s one.

## Knowledge Base

Users can relate knowledge base articles to the case record. See more info about knowledge base [here](knowledge-base.md).

## Customer Portal

Administrator can create a [portal](../administration/portal.md) where customers will be able to create cases. Permission to create cases can be granted in a portal role.

Since portal users automatically follow cases they created, they will receive email notifications about new messages in the case's stream. Notifications are sent from the system email account. So when a customer replies to a notification, it will be sent to the system email address. It's possible to make replies to go to Group Email Account. For this you need to utilize the Workflow tool (or Formula) to make all new cases be automatically linked with a Group Email Account (use Update Target Record action, set *Group Email Account* field). 

## See also

* [Notifying contacts about new post in Case with Workflows](https://www.espocrm.com/blog/notifying-contacts-about-new-post-in-case-with-workflows/)
