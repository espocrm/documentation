# Documents

EspoCRM provides the ability to store documents. By default Document entity type has many-to-many relationships with Account, Opportunity, Contact, Lead. Administrator can create relationships with other entity types.

## Folders

Folders allow to group documents. Document Folders are presented as a hierarchical tree structure. Each folder can contain sub-folders.

Document Folder is a separate entity type, hence an access can be controlled by ACL Roles.

## Sending in email

While composing an email, there is the ability to add a certain document as an attachment.

## Creating from email attachment

Available since version 5.9.0.

It's possible to create a document from an email attachment. On the email detail view from the dropdown at top-right corner click *Create Document*. The email should have at least one attachment.
