# Documents

EspoCRM provides the ability to store documents. By default, Document entity type has many-to-many relationships with Account, Opportunity, Contact and Lead. An administrator can create relationships with other entity types.

## Folders

Folders allow to group documents. Document Folders are presented as a hierarchical tree structure. Each folder can contain sub-folders.

The Document Folder is a separate entity type. Access to it can be controlled by ACL Roles.

## Sending in email

While composing an email, there is the ability to add a certain document as an attachment.

## Creating from email attachment

It's possible to create a document from an email attachment. On the Email detail view from the dropdown at top-right corner, click *Create Document*. The email should have at least one attachment to be able to create a document from it.
