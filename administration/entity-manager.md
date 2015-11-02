# Entity Manager

Entity Manager is available in Administration panel. It provides an ability to highly customize your EspoCRM instance. You are able to do following:

* Add new types of entities.
* Customize existing types of entities: change labels, default order in list view, enable or disable stream.
* Configure fields: add new, customize existing ones.
* Configure relationships: add new, change labels of existing ones.

## Creating new entity

Click `Create Entity` button on Entity Manager page. Specify name, labels and type. If you select `Person` type your entity will have Email, Phone, First Name, Last Name and Salutation fields. Check `Stream` if you want your entity to have stream panel and users be able to Follow entities of this type.

## Update existing entity

Click `Edit` link on a certain entity. You will be able to change labels, default order and an availability of Stream.

## Fields

By clicking `Fields` link you will be moved to the separated page. There you will be able to Create new fields or update existing ones. There are following types of fields available in Entity Manager:

* Address - address with street, city, state, postal code and country;
* Array - list of values, with the ability to select multiple values (not good option if you need to search by this field);
* Attachment Multiple - multiple file attachments;
* Auto-increment - read only generated number;
* Boolean - checkbox, true of false;
* Currency - for currency values;
* Date;
* DateTime;
* Enum - selectbox, with the ability to select only one value;
* File - uploading one file;
* Float - number with a decimal part;
* Image - uploading image file with a preview;
* Int - whole number;
* Multi-enum - list of values, with the ability to select multiple values (not good option if you need to search by this field), similar to Array but nicer.
* Text - text area, for long multiline texts;
* Url - for links;
* Varchar - short text;
* Wysiwyg - the similar to Text field, with the ability to format text.

You can set a field as `required` or not required, specify `default value`, set as `audited` (to be able to see updates of the field in Stream) and other options specific to a type of field.

After you have added new field you will need to put this field on layouts (Administration > Layout Manager).

## Relationships

You can create new relationships between both out-of-box and custom entities. There are 3 avaialable relationship types:

* One-to-Many: after you have created this relationship you can put a link field to the detail layout of the right entity and add relationship panel to the left entity;

* Many-to-One: the same as One-to-Many but vice versa;

* Many-to-Many: relationship panels on both sides.


