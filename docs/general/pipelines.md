# Pipelines

*As of v10.0.*

The Pipelines feature allows you to configure multiple pipelines for the same entity type.
While the status field can serve as a pipeline stage by default, with the Pipelines feature enabled,
each record is assigned to a specific pipeline. The assigned pipeline determines the stages available for the record.

The Pipelines feature can be enabled for:

- Leads
- Opportunities
- Custom entity types of Base, Base Plus, Company, and Person types

To enable Pipelines for a custom entity type, the entity type must have a Status field specified.
The status field is selected from the available Enum fields.
The status field can be specified under Administration > Entity Manager > {Entity Type} > Edit.

After enabling Pipelines for an entity type, pipelines can be created under Administration > Pipelines.
Each pipeline has its unique stages. Each stage is mapped to the Status field value. Each stage is stored as an entity.

A pipeline can be set as available for all users or only for specific teams.

After enabling pipelines, the following Link fields are automatically created:

- Pipeline
- Pipeline Stage

The Status field becomes read-only. It can be changed only by changing the pipeline stage.

Each record is assigned to a specific pipeline (the Pipeline field is required).
The assigned pipeline defines the list of stages available for the record. A record can change its pipeline.

The Kanban view displays one pipeline. The pipeline can be switched with a dropdown.
Columns of the Kanban correspond to the stages of the selected pipeline.

Pipeline stages can be reordered using the actions (Move Up, Move Down) in the dropdown menu in the Stages list panel of the Pipeline detail view.

The reordering is limited by the order of the Mapped Status field options. For example, if there are two statuses, Open and Closed,
each with multiple stages, you cannot move stages belonging to the Closed status before stages belonging to the Open status.

A [Lead Capture](../administration/web-to-lead.md#lead-capture) can be configured to assign newly created leads
to a specific pipeline.

To be able to update pipeline stages with Mass Update, you need to add both Pipeline and Pipeline Stage fields
to the Mass Update [layout](../administration/layout-manager.md#mass-update).


## Retro-assigned existing records to Pipeline

If you enabled the Pipelines feature for an entity type after records had already been created, you may want to assign all existing records to a specific pipeline. For this, you need to do the following steps:

1. Add the Pipeline field to the Search Filters layout and add the Pipeline and Pipeline Stage fields to the Mass Update layout.
2. In the list view, filter records where the Pipeline field is empty and mass update them assigning the needed Pipeline and Pipeline Stage. Do it for each possible status field option.

