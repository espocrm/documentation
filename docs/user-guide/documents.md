# Documents

EspoCRM provides the ability to store documents. By default, the Document entity type has many-to-many relationships with Account, Opportunity, Contact, and Lead. An administrator can create relationships with other entity types.

In this article:

* [Folders](#folders)
* [Sending in email](#sending-in-email)
* [Creating from email attachment](#creating-from-email-attachment)
* [Uploading in attachments](#uploading-in-attachments)
* [File types](#file-types)
* [See also](#see-also)

## Folders

Folders allow to group Documents. Document Folders are presented as a hierarchical tree structure. Each folder can contain sub-folders.

The Document Folder is a separate entity type. Access to it can be controlled by Roles.

## Sending in email

While composing an email, there is the ability to add a certain document as an attachment.

## Creating from email attachment

It's possible to create a Document from an Email attachment. On the Email detail view from the dropdown at top-right corner, click *Create Document*. The email should have at least one attachment to be able to create a Document from it.

## Uploading in attachments

It's possible to upload existing Documents directly in Attachment-Multiple fields. This ability can be enabled for a specific field at: Administration > Entity Manager > {Entity Type} > Fields > {your Attachment-Multiple field}. Add *Documents* to the Source List.

## File types

An administrator can configure allowed file types. Under Administration > Entity Manager > Document > Fields > File, specify allowed file types in the "Accept" parameter.

## See also

* [Documents quick tour](https://app.supademo.com/demo/cml9ij9ru1tgyvhwzri4tcrc0)
