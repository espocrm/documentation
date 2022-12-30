# Optimistic Concurrency Control

*As of v7.0.*

Prevents overriding data written (by another user) in between record fetching and saving. 

If a user tried to save the record has been already modified by another user, a modal dialog will be shown prompting to resolve the conflict. For each changed field it's possible to choose the following values:

* Current – the value the user attempted to write;
* Actual – the value currently stored in the database;
* Original – the value retrieved before modification.

The conflict does not occur if users modified different fields.

The administrator can enable the Optimistic concurrency control for an entity type at Administration > Entity Manager > Edit > Optimistic concurrency control.

By default it's enabled for:

* Knowledge Base
* Email Templates
* PDF Templates
