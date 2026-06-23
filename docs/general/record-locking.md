---
search:
  boost: 2
---

# Record locking

*As of v10.0.0.*

Record locking can be enabled per entity type. Locked records cannot be edited (except for designated fields) or removed.
Only users with the Lock [permission](../administration/roles-management.md#lock-permission) can lock or unlock records.

The feature is available for custom entity types as well as for the most built-in object entity types.
To enable record locking for an entity type, under Administration > Entity Manager > {Entity Type} > Edit,
check the *Lockable* parameter.

A record can be locked or unlocked from the detail view. Mass lock and unlock actions available in the list view.

Specific fields can be set as not eligible for locking. For example, one can set the Teams field as not lockable.
To disable locking for a specific field, under Administration > Entity Manager > {Entity Type} > Fields > {Field},
check *Not Lockable*.
