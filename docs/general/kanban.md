# Kanban view

The Kanban view displays records as cards grouped into columns. Columns correspond to options of the Status field. Moving a card to another column changes the status of the record.

The Kanban view is an alternative to the list view. Users can switch between the list and Kanban views in the top-right corner of the list view.

## Configuration

### Enabling

To enable the Kanban view for an entity type, go to Administration > Entity Manager > {Entity Type} > Edit and check *Kanban View*. Uncheck it to disable the Kanban view. The Status field needs to be specified first.

### Status field

The Kanban view requires the entity type to have the Status field specified. The Status field can be specified at Administration > Entity Manager > {Entity Type} > Edit > *Status Field*. It is selected from the available Enum fields of the entity type.

The order of columns follows the order of the Status field options.

The *Ignored groups in Kanban view* parameter defines which options won't be displayed as columns. For example, for Opportunities you might want to hide the status *Closed Lost*.


### Card layout

Fields displayed on Kanban cards are configured in the Kanban layout at Administration > Entity Manager > {Entity Type} > Layouts > Kanban. See more about [layouts](../administration/layout-manager.md#kanban).

Drag fields to add or remove them from the card and to change their order. Field parameters can be edited by clicking the pencil icon next to the field. It's recommended to have the Name field displayed as a link.

!!! note

    The Kanban layout is available only for entity types with the enabled Kanban view.

## Pipelines

When the [Pipelines](pipelines.md) feature is enabled for an entity type, the Kanban view displays one pipeline at a time. The pipeline can be switched with a dropdown. Columns correspond to the stages of the selected pipeline.

Moving a card to another column changes the pipeline stage of the record. The Status field is updated in accordance with the status the stage is mapped to.
