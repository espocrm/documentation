# Pipelines

*As of v10.0.0.*

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

After enabling pipelines, the Status field becomes read-only. It can be changed only by changing the pipeline stage.

Each record is assigned to a specific pipeline (required field).
The assigned pipeline defines the list of stages available for the record. A record can change its pipeline.

The Kanban view displays one pipeline. The pipeline can be switched with a dropdown.
Columns of the Kanban correspond to the stages of the selected pipeline.

A [Lead Capture](../administration/web-to-lead.md#lead-capture) can be configured to assign newly created leads
to a specific pipeline.
