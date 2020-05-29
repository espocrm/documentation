# Entity Manager

Entity Manager is available in Administration panel. It provides the ability to highly customize your EspoCRM instance. You are able to do the following:

* Add new entity types.
* Customize existing entity types: change labels, default order in list view, etc.
* Configure fields: add new, customize existing ones.
* Configure relationships: add new, change labels of existing ones.

All customizations made via Entity Manager are stored in `custom/` directory. You can make customizations on a separate instance, then copy *custom* dir to your production instance and run rebuild (from administration panel or CLI).

In this article:

* [Creating new entity type](#creating-new-entity-type)
* [Entity type parameters](#entity-type-parameters)
* [Fields](#fields)
* [Relationships](#relationships)

## Creating new entity type

Click *Create Entity* button on Entity Manager main page (Administration > Entity Manager). Specify name, labels and select type. If you select *Person* type, your entity will have Email, Phone, First Name, Last Name and Salutation fields. Check *Stream* if you want to have a stream panel (users be able to follow records).

Types:

* Base - empty entity only with basic fields like Name, Assigned User, Teams, Description.
* Base Plus - like Base but with Activities, History, Tasks panels.
* Event - has Date Start, Date End, Duration, Parent, Status fields; available in Calendar and Activities panel (must be [enabled](../user-guide/activities-and-calendar.md#custom-entities-on-calendar) at Administration > Settings).
* Person - has Email, Phone, First Name, Last Name, Salutation, Address fields; Activities, History, Tasks panels.
* Company - has Email, Phone, Billing Address, Shipping Address fields; Activities, History, Tasks panels.

## Entity type parameters

If you click *Edit* on a certain entity you will be able to change parameters of that entity.

* Labels - singular and plural names of the entity.
* Default order records are sorted by in list views.
* Stream - whether Stream feature is enabled for this entity.
* Disabled - check if you don't need this entity in your system.
* Text Filter Fields - what fields to search in for the main text filter and global search.
* Status field - which field (of enum type) will be used for a record status; required for kanban view.
* Kanban view - available only if Status Field is specified. Enables Kanban view mode.
* Full-Text Search - see more [here](../user-guide/text-search.md#full-text-search).
* Disable record count - total number won't be displayed on the list view; can decrease loading time when the DB table is big.
* Color - a specific color for a quick recognition.
* Icon - the picked icon will be displayed in the side navbar.

## Fields

By clicking *Fields* link you will be moved to a separate page. There you will be able to create new fields or update existing ones.

[More detail](fields.md) abour fields.

**Note**: After you have added a new field you need to put this field on [layouts](layout-manager.md) (Administration > Layout Manager).


## Relationships

You can create new relationships between both out-of-box and custom entities. Relationship types are listed below.

#### One-to-Many

After you have created this relationship you can put a link field to the detail layout of the right entity and add relationship panel to the left entity.

#### Many-to-One

The same as One-to-Many but vice versa.

#### Many-to-Many

Relationship panels on both sides.

#### One-to-One Right

*Link* field on one side, *Link-One* on another (since 5.8.0).

#### One-to-One Left

The same as previous but vice versa.

#### Children-to-Parent

Linking with multiple entity types through *Link-Parent* field (since 5.8.0).

### Parameters

#### Link Multiple Field

The parameter *Link Multiple Field* implies that the field of *Link-Multiple* type will be created along with relationship. You can put such a field on the layout. It's convenient for quick picking of related records. It's not a good option if your relationship is intended to have a lot of linked records that can slow down loading of detail view screen.

Examples of link-multiple fields:

* *Teams* field - most entities have this field
* *Contacts* field in *Opportunity*
* *Contacts* field in *Case*

#### Audited

If the parameter *Audited* is checked then updates of the relationship will be logged in Stream.
