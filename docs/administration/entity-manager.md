# Entity Manager

The Entity Manager tool is available from the Administration panel. It provides the abilities to customize your EspoCRM instance. You are able to do the following.

* Add new entity types.
* Customize existing entity types: change labels, default order and many other parameters.
* Configure fields: add new and customize existing ones.
* Configure relationships: add new, change labels and parameters of existing ones.

All customizations made via the Entity Manager are stored in the `custom` directory. You can make customizations on a separate instance, then [move](#copying-to-another-instance) them to another instance.

!!! note

    When creating a new entity type, a field or relationship in an existing entity type, the system will add a prefix *c* to the name (meaning custom). The purpose of it is to prevent naming conflicts with future versions. This behavior can be disabled with the config parameter `customPrefixDisabled`. Disable it at your own risk.

In this article:

* [Creating new entity type](#creating-new-entity-type)
* [Entity type parameters](#entity-type-parameters)
* [Fields](#fields)
* [Relationships](#relationships)
* [Formula](#formula)
* [Copying to another instance](#copying-to-another-instance)

## Creating new entity type

Click the **Create Entity** button on the Entity Manager main page (Administration > Entity Manager). Specify the name, labels and select the type. If you select the *Person* type, your entity will have Email, Phone, First Name, Last Name and Salutation fields. Check the **Stream** if you want to have the Stream panel (users will be able to follow records).

Types:

* Base – has only basic fields created by default: Name, Assigned User, Teams, Description.
* Base Plus – like the Base type but with the Activities, History, Tasks panels.
* Event – has the Date Start, Date End, Duration, Parent, Status fields; available in the Calendar and in the Activities panel (must be [enabled](../user-guide/activities-and-calendar.md#custom-entities-on-calendar) at Administration > Settings).
* Person – has the Email, Phone, First Name, Last Name, Salutation, Address fields; the Activities, History, Tasks panels.
* Company – has the Email, Phone, Billing Address, Shipping Address fields; the Activities, History, Tasks panels.

## Entity type parameters

If you click **Edit** on the entity view, you will be able to change parameters of that entity.

* Labels – singular and plural names of the entity.
* Default order in which records are sorted by in list views.
* Stream – whether Stream feature is enabled for this entity.
* Stars – the ability to star records; stars can be used by users to bookmark specific records.
* Disabled – check if you don't need this entity in your system.
* Text Filter Fields – what fields to search in for the main text filter and global search.
* Status field – which field (of enum type) will be used for a record status; required for kanban view.
* Kanban view – available only if Status Field is specified. Enables Kanban view mode.
* Full-Text Search – see more [here](../user-guide/text-search.md#full-text-search).
* Disable record count – the total number won't be displayed on the list view; can decrease loading time when the DB table is big.
* Color – a specific color for a quick recognition.
* Icon – the picked icon will be displayed in the side navbar.
* Preserve Audit Log – disables cleanup of the audit log; this parameter is applicable only if Stream is disabled; as if Stream is enabled, audit log records are not being deleted.
* Collaborators – the ability to share records with specific users.
* Multiple Assigned Users – the ability to assign multiple users to a record.

!!! note

    Some parameters are not available for certain entity types.

## Fields

By clicking the **Fields** button, you will be moved to a separate page. There, you will be able to create new fields or update existing ones.

[More detail](fields.md) about fields.

!!! important

    After you created a new field, you may also need to put this field on [layouts](layout-manager.md) (Administration > Layout Manager).

    You also need to add the field to the Search Filters layout to be able to search by the field on the list view.

## Relationships

You can create custom relationships between entity types. Both standard and custom entities can be related to each other.

It's possible to create a relationship between the same entity type. E.g. a Company can have a parent company and child companies.

It's possible to have multiple relationships between the same entity type pairs. E.g. a Person and an Event can be linked by two relationships: attendees and organizers.

Relationship types are listed below.

#### One-to-Many

After you created the relationship, a *Link* field will be automatically created for the right-side entity type. You can add the link field to the Detail layout (at Administration > Entity Manager > {Entity Type} > Layouts > Detail). You can also add the relationship panel to the left entity type (at Administration > Entity Manager > {Entity Type} > Layouts > Bottom Panels).

#### Many-to-One

The same as One-to-Many but vice versa.

#### Many-to-Many

After you created the relationship, relationship panels will be available on both sides (at Administration > Entity Manager > {Entity Type} > Layouts > Bottom Panels).

#### One-to-One Right

The *Link* field will be created in the current entity type (left), the *Link-One* field – in the foreign entity type (right). It does not matter which one-to-one type to choose from the user perspective.

#### One-to-One Left

The same as previous but vice versa. The *Link* field will be created in the foreign entity type.

#### Children-to-Parent

Linking with multiple entity types through the *Link-Parent* field.

*Foreign Links* checkboxes allows to create Has-Children links in specific parent entity types. For example, if we check *Account* foreign link, it will create a link in the Account entity type. It will allow to add relationship panel in Account.

### Parameters

#### Link Multiple field

The parameter **Link Multiple Field** implies that the field of the *Link-Multiple* type will be created along with the relationship. You can put such a field on the layout. It's convenient for quick picking of related records. It's not a good option if your relationship is intended to have a lot of linked records that can slow down loading of the detail view screen.

Examples of link-multiple fields:

* *Teams* field – most entities have this field
* *Contacts* field in *Opportunity*
* *Contacts* field in *Case*

#### Audited

If the parameter **Audited** is checked, then updates of the relationship will be logged in Stream.

## Formula

### Before-save custom script

A [formula](formula.md) script will be executed every time before a record is saved. This provides the ability to automatically set specific fields with values derived from calculation. In addition, some functions can perform actions, for example, email sending and record creation.

To edit the formula script for a specific entity type, follow Administration > Entity Manager > a needed entity type > Formula.

!!! note

    It can be reasonable to set fields that are supposed to be calculated by formula as read-only (Administration > Entity Manager > {Entity Type} > Fields).

An administrator can run **Recalculate Formula** action for specific records from the list view: select records (or all search results) > click *Actions* dropdown > click *Recalculate Formula*.

### API before-save script

*As of v7.5.*

A [formula](formula.md) script called on create and update API requests, before the record is saved. See more [detail](api-before-save-script.md).

## Copying to another instance

All customizations made through Entity Manager are stored in the `custom/Espo/Custom` folder. You need to copy contents of this folder to another instance and then run rebuild (CLI command `php rebuild.php`).

It's also possible to export customization to an installable extension. On the Entity Manager page, from the dropdown next to *Create Entity* button.
