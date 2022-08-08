# Optimistic Concurrency Control

Available as of v7.0.

Prevents overriding data written (by another user) in between record fetching and saving.

If the record has been modified, a modal will be shown prompting to resolve the conflict. For each changed field it's possible to choose the following values:

* Current – the value the user attempted to write;
* Actual – the value currently stored in the database;
* Original – the value retrieved before modification.

The conflict does not occur if different fields of the same record were modified.

The administrator can enable Optimistic concurrency control for an entity type at Administration > Entity Manager > Edit > Optimistic concurrency control.

By default it's enabled for:

* Knowledge Base
* Email Templates
* PDF Templates
