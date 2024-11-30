# Optimistic Concurrency Control

*As of v7.0.*

Optimistic Concurrency Control prevents data from being overwritten by other users between the time it is fetched and saved.

If a user tries to save a record that has already been modified by another user, a modal dialog will appear, prompting to resolve the conflict. For each changed field, it's possible to choose from the following values:

* Current – the value the user attempted to write;
* Actual – the value currently stored in the database;
* Original – the value retrieved before modification.

The conflict won't occur if users modify different fields.

An administrator can enable the Optimistic Concurrency Control for an entity type under Administration > Entity Manager > {Entity Type} > Edit > Optimistic Concurrency Control.

By default, it's enabled for:

* Knowledge Base
* Email Templates
* PDF Templates
