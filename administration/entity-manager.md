# Entity Manager

Entity Manager is available in Administration panel. It provides an ability to highly customize your EspoCRM instance. You are able to do the following:

* Add new types of entities.
* Customize existing types of entities: change labels, default order in list view, enable or disable stream.
* Configure fields: add new, customize existing ones.
* Configure relationships: add new, change labels of existing ones.

## Creating new entity

Click `Create Entity` button on Entity Manager page. Specify name, labels and type. If you select `Person` type, your entity will have Email, Phone, First Name, Last Name and Salutation fields. Check `Stream` if you want your entity to have stream panel and users to be able to Follow entities of this type.

Types:

* Base - empty entity only with basic fields like Name, Assigned User, Teams, Description.
* Base Plus - like Base but with Activities, History, Tasks panels (available since 4.3.0).
* Event - Date Start, Date End, Duration, Parent, Status fields. Available in Calendar and Activities panel (since 4.3.0, must be enabled at Administration > Settings).
* Person - Email, Phone, First Name, Last Name, Salutation, Address fields. Activities, History, Tasks panels.
* Company - Email, Phone, Billing Address, Shipping Address fields. Activities, History, Tasks panels.

## Update existing entity

If you click `Edit` link on a certain entity you will be able to change some parameters of that entity.

* Labels - singular and plural name of the entity.
* Default order records are sorted by in list views.
* Stream - whether Stream feature is enabled for this entity.
* Disabled - check if you don't need this entity in your system.
* Text Filter Fields - what fields to search in for the main text filter and global search.


## Fields

By clicking `Fields` link you will be moved to a separate page. There you will be able to create new fields or update existing ones. The following types of fields are available in Entity Manager:

* Address - address with street, city, state, postal code and country;
* Array - list of values, with the ability to select multiple values (not a good option if you need to search by this field); users can add their own values if options are not specified.
* Attachment Multiple - multiple file attachments;
* Auto-increment - read only generated number;
* Boolean - checkbox, true or false;
* Currency - for currency values;
* Date;
* DateTime;
* Enum - selectbox, with the ability to select only one value;
* File - uploading one file;
* Float - number with a decimal part;
* Foreign - a field of related entity;
* Image - uploading image file with a preview;
* Integer - whole number;
* Number - auto-incrementing number of string type with a possible prefix and a specific length;
* Multi-enum - list of values, with the ability to select multiple values (not a good option if you need to search by this field), similar to Array but nicer.
* Text - text area, for long multiline texts;
* Url - for links;
* Varchar - short text;
* Wysiwyg - similar to Text field, with the ability to format text.

Parameters:
* Required - whether filling in of the field is mandatory.
* Default Value - Value of the field set upon creating new record.
* Audited - updates of the field will be logged in Stream.

**Note**: After you have added the new field you need to put this field on [layouts](layout-manager.md) (Administration > Layout Manager).

### Dynamic Logic

Provides an ability to make forms dynamic. It's possible to define conditions making certain fields visible, required or read-only. Conditions will be checked automatically when data in the form is changed.

For Enum, Array and Multi Enum fields it's possible to define different sets of options that will be available for the field depending on which condition is met.


## Relationships

You can create new relationships between both out-of-box and custom entities. There are 3 available relationship types:

* One-to-Many: after you have created this relationship you can put a link field to the detail layout of the right entity and add relationship panel to the left entity;
* Many-to-One: the same as One-to-Many but vice versa;
* Many-to-Many: relationship panels on both sides.

Parameter 'Link Multiple Field' implies that the field of `linkMultiple` type will be created along with relationship. You can put such a field on the layout. It's convenient for quick picking of related records. It's not a good option if your relationship is intended to have a lot of linked records that can slow down loading of detail view screen.

If parameter 'Audited' is checked then updates of the relationship will be logged in Stream.

