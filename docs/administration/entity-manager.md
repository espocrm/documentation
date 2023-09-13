# Entity Manager

The Entity Manager tool is available from the Administration panel. It provides the ability to highly customize your EspoCRM instance. You are able to do the following:

* Add new entity types.
* Customize existing entity types: change labels, default order in list view, etc.
* Configure fields: add new, customize existing ones.
* Configure relationships: add new, change labels of existing ones.

All customizations made via Entity Manager are stored in the `custom` directory. You can make customizations on a separate instance, then copy *custom* dir to your production instance and run rebuild (from administration panel or CLI).

In this article:

* [Creating new entity type](#creating-new-entity-type)
* [Entity type parameters](#entity-type-parameters)
* [Fields](#fields)
* [Relationships](#relationships)
* [Formula](#formula)
* [Copying to another instance](#copying-to-another-instance)

## Creating new entity type

Click *Create Entity* button on Entity Manager main page (Administration > Entity Manager). Specify name, labels and select type. If you select *Person* type, your entity will have Email, Phone, First Name, Last Name and Salutation fields. Check *Stream* if you want to have a stream panel (users will be able to follow records).

Types:

* Base – empty entity only with basic fields like Name, Assigned User, Teams, Description.
* Base Plus – like Base but with Activities, History, Tasks panels.
* Event – has Date Start, Date End, Duration, Parent, Status fields; available in Calendar and Activities panel (must be [enabled](../user-guide/activities-and-calendar.md#custom-entities-on-calendar) at Administration > Settings).
* Person – has Email, Phone, First Name, Last Name, Salutation, Address fields; Activities, History, Tasks panels.
* Company – has Email, Phone, Billing Address, Shipping Address fields; Activities, History, Tasks panels.

## Entity type parameters

If you click *Edit* on a certain entity, you will be able to change parameters of that entity.

* Labels – singular and plural names of the entity.
* Default order in which records are sorted by in list views.
* Stream – whether Stream feature is enabled for this entity.
* Disabled – check if you don't need this entity in your system.
* Text Filter Fields – what fields to search in for the main text filter and global search.
* Status field – which field (of enum type) will be used for a record status; required for kanban view.
* Kanban view – available only if Status Field is specified. Enables Kanban view mode.
* Full-Text Search – see more [here](../user-guide/text-search.md#full-text-search).
* Disable record count – the total number won't be displayed on the list view; can decrease loading time when the DB table is big.
* Color – a specific color for a quick recognition.
* Icon – the picked icon will be displayed in the side navbar.

## Fields

By clicking *Fields* link, you will be moved to a separate page. There, you will be able to create new fields or update existing ones.

[More detail](fields.md) about fields.

!!!! note

    After you have added a new field, you need to put this field on [layouts](layout-manager.md) (Administration > Layout Manager).

## Relationships

You can create new relationships between both out-of-the-box and custom entities. Relationship types are listed below.

#### One-to-Many

After you have created this relationship, you can put a link field to the detail layout of the right entity and add relationship panel to the left entity.

#### Many-to-One

The same as One-to-Many but vice versa.

#### Many-to-Many

Relationship panels on both sides.

#### One-to-One Right

The *Link* field will be created in the current entity type (left), the *Link-One* field – in the foreign entity type (right).

#### One-to-One Left

The same as previous but vice versa. The *Link* field will be created in the foreign entity type.

#### Children-to-Parent

Linking with multiple entity types through *Link-Parent* field.

### Parameters

#### Link Multiple field

The parameter *Link Multiple Field* implies that the field of *Link-Multiple* type will be created along with the relationship. You can put such a field on the layout. It's convenient for quick picking of related records. It's not a good option if your relationship is intended to have a lot of linked records that can slow down loading of the detail view screen.

Examples of link-multiple fields:

* *Teams* field – most entities have this field
* *Contacts* field in *Opportunity*
* *Contacts* field in *Case*

#### Audited

If the parameter *Audited* is checked, then updates of the relationship will be logged in Stream.

## Formula

### Before-save custom script

A [formula](formula.md) script executed before an entity (record) is saved (created or updated). Useful for setting fields that are supposed to be calculated (usually such fields are read-only).

### API before-save script

*As of v7.5.*

A [formula](formula.md) script called on create and update API requests before an entity is saved. See more [detail](api-before-save-script.md).

## Copying to another instance

All customizations made through Entity Manager are stored in the `custom/Espo/Custom` folder. You need to copy contents of this folder to another instance and then run rebuild (CLI command `php rebuild.php`).
