# Case Management

Cases provide an issue tracking ability. It's a principal aspect of customer service in EspoCRM. Ticket term also can be used for Cases.

Case entity can be associated with one Account and/or with multiple Contacts.

New cases are supposed to be created by the following scenarios:

* Manually by CRM users;
* Manually by users of the customer portal;
* Through the API (e.g. through the web form);
* Automatically when a new email came to a specific mailbox.
* Automatically by a Workflow rule.

Case record has a stream that can be utilized for a communication between customer and service. CRM users can also make internal posts that won't be visible in a customer portal. 

When the new case is created by a portal user it's not assigned to any user. By utilizing [Workflows](https://github.com/espocrm/documentation/blob/master/administration/workflows.md) administrator can create rule that will notify certain users about a new case in the system. Workflows also provides an ability to apply assignment rule to new cases, i.e. Round-Robin and Least-Busy rules. For more complex business flows it's recommended to utilize [BPM tool](https://github.com/espocrm/documentation/blob/master/administration/bpm.md).

To prevent overlooking of new cases users can add Case entity type to the Global Auto-follow list at Preferences. Then they will automatically follow every new case.

Note: If there is no portal user associated with a linked contact then the customer won't receive email notifications about updates in the Stream. You need to use emails for communication with the customer.

### Email-to-Case

Administrator can set up Group Email Account that will create a new case on each new inbound email. For more information [see here](https://github.com/espocrm/documentation/blob/master/administration/emails.md).

### Knowledge Base

Users can relate knowledge base articles to the case record.

### Customer Portal

Administrator can create a [portal](https://github.com/espocrm/documentation/blob/master/administration/portal.md) where customers will be able to create cases.

Since portal users automatically follow their cases, they will receive email notifications about new messages in the Stream.
