# Dashboards

All internal users can manage their dashboards, including adding, removing, and configuring dashlets, as well as adding dashboard tabs. Users can lock their dashboard to prevent accidental changes.

An administrator can edit dashboards of other users. On the user detail view, click the *Preferences* item from the dropdown at the top-right corner. There, you can find *Dashboard Layout*.

Users can reset their dashboard layout to the default. On the Preferences edit view, click *Reset Dashboard to Default* from the dropdown next to the *Edit* button. The administrator can reset dashboards of other users.

On the dashboard:

* Dashlets can be dragged by the header.
* Dashlets can be resized by dragging the lower-right corner.
* Multiple dashboard tabs can be created to group dashlets by their purpose.

## System default dashboard

The default dashboard layout will be applied to all new users. This layout be changed at Administration > User Interface > Dashboard Layout.

## Dashboard Templates

Dashboard templates are available for administrators at Administration > Dashboard Templates. They provide the ability to deploy specific dashboard layouts to multiple users. It's also possible to deploy for all users of a specific team.

## Portal dashboard

On the edit view of the Portal record, you can define its default dashboard layout. It will be applied to all portal users unless a user has a specific *Dashboard Template*.

When editing a *Portal User*, you can specify the Dashboard Template for that user. This template will override the default template of the Portal.

## Dashlet

This section covers several out-of-the-box dashlets.

### Recort List

This dashlet allows users to display records of any entity type.

Parameters:

- Primary Filter – for example, a user can select *Open* filter to display only open Tasks.
- Additional Filters (known as Bool filters) – for example, a user can add *Only My* filter to display only records assignmed to them, or *Shared* filter to display records where they added as a collaborator.
- Order By and Order
- Layout

### My Activities

Displays user's upcoming activities, such as Meetings, Calls, Tasks, and entity types of the Event type.

Parameters:

- Next X Days – number of days into the future for which activities are displayed.
- Include Shared – to include tasks where the user is added as s collaborator.

## See also

* [Creating custom dashlet](../development/how-to-create-a-dashlet.md)
