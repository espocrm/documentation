---
search:
  boost: 2
---

# Collaborators

*As of v9.0.*

The Collaborators feature allow multiple users to work on the same record.
Users added as collaborators to a record can view the record, can read the stream and post to the stream.

The Collaborators feature is available for custom entities created via the Entity Manager and
for the following out-of-the-box entity types: Task, Case, Account, Contact, Lead, Opportunity, Document, Knowledge Base Article and Target List.


## Enabling

The Collaborators feature can be enabled for an entity type in the Entity Manager at:
Administration > Entity Manager > {Entity Type} > Edit > Collaborators.

Once the Collaborators feature is enabled for an entity type:

* Link-multiple field *Collaborators* is automatically created.
* Bool filter *Shared* is added.

The administrator needs to add the created *Collaborators* field to the layout. It's recommended to add to the side panel
under the Teams field: Administration > Entity Manager > {Entity Type} > Layouts > Side Panel Fields.

## Behavior

Assignees are automatically added to collaborators. This ensures that when a record is reassigned to another user,
the previous assignee remains a collaborator unless explicitly removed.

A user who creates a record is automatically pre-filled as a collaborator.
This ensures that a user with 'own' read access will still have access to a record after assigning it to another user.

## Access

Users added as collaborators to a record obtain *read* and *stream* access, provided their access level, as defined by Roles, is other than *no*.

Access prerequisites:

* Assignment Permission is required to be able to add a user to collaborators.
* Edit access to a record is required to be able to add collaborators.

Limitations:

* Portal users cannot be added as collaborators.

