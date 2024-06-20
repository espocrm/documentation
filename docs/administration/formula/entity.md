# Formula > Functions > Entity

Functions of the *Entity* group operate with a target record. There can be only one target record available in formula-script context.
For *Before Update Script*, the target record is the record that is currently updated. For Workflow's *Create Record* action,
the target record is the record is being created. For Workflow's conditions, the target record is the target record of the workflow rule.

* [entity\isNew](#entityisnew)
* [entity\isAttributeChanged](#entityisattributechanged)
* [entity\isAttributeNotChanged](#entityisattributenotchanged)
* [entity\attribute](#entityattribute)
* [entity\setAttribute](#entitysetattribute)
* [entity\clearAttribute](#entityclearattribute)
* [entity\attributeFetched](#entityattributefetched)
* [entity\addLinkMultipleId](#entityaddlinkmultipleid)
* [entity\hasLinkMultipleId](#entityhaslinkmultipleid)
* [entity\removeLinkMultipleId](#entityremovelinkmultipleid)
* [entity\setLinkMultipleColumn](#entitysetlinkmultiplecolumn)
* [entity\isRelated](#entityisrelated)
* [entity\sumRelated](#entitysumrelated)
* [entity\countRelated](#entitycountrelated)
* [entity\getLinkColumn](#entitygetlinkcolumn)


## entity\isNew

`entity\isNew()`

Returns TRUE if the entity is new (being created) and FALSE if not (being updated).

## entity\isAttributeChanged

`entity\isAttributeChanged(ATTRIBUTE)`

Returns TRUE if ATTRIBUTE of the record was changed.

!!! example

    `entity\isAttributeChanged('status')`

## entity\isAttributeNotChanged

`entity\isAttributeNotChanged(ATTRIBUTE)`

Return TRUE if ATTRIBUTE of the record was not changed.

## entity\attribute

`entity\attribute(ATTRIBUTE)`

An ATTRIBUTE value of a target record. It's also possible to fetch an attribute of a related record.

`$test = entity\attribute('name')` is equivalent to `$test = name`.

!!! example

    `entity\attribute('assignedUserId')`

    `entity\attribute('account.name')`

## entity\setAttribute

`entity\setAttribute(ATTRIBUTE, VALUE)`

Set an ATTRIBUTE with a VALUE.

`entity\setAttribute('stage', 'Closed Won')` is equivalent to `stage = 'Closed Won'`.

!!! example

    `entity\setAttribute('stage', 'Closed Won')`

## entity\clearAttribute

`entity\clearAttribute(ATTRIBUTE)`

*As of v8.2.*

Clear an ATTRIBUTE.

!!! example

    `entity\clearAttribute('stage')`

## entity\attributeFetched

`entity\attributeFetched(ATTRIBUTE)`

An ATTRIBUTE value that was set when a target record was fetched from database. Before it was modified.

!!! example

    `entity\attributeFetched('assignedUserId')`

Note: Should not be used in workflow and BPM actions, use `workflow\targetEntity\attributeFetched` instead.

## entity\addLinkMultipleId

`entity\addLinkMultipleId(LINK, ID)`

Adds ID to Link Multiple field.

`entity\addLinkMultipleId(LINK, ID_LIST)`

Adds the list of ids.

!!! example

    `entity\addLinkMultipleId('teams', 'someTeamId')`

Add 'someTeamId' to 'teams' field.

## entity\hasLinkMultipleId

`entity\hasLinkMultipleId(LINK, ID)`

Checks whether Link Multiple field has specific ID.

## entity\removeLinkMultipleId

`entity\removeLinkMultipleId(LINK, ID)`

Removes a specific ID from the Link Multiple field.

## entity\setLinkMultipleColumn

`entity\setLinkMultipleColumn(LINK, ID, COLUMN, VALUE)`

*As of v7.4.*

Sets a column value in a link-multiple field.

## entity\isRelated

`entity\isRelated(LINK, ID)`

Checks whether a target entity is related with another entity represented by LINK and ID.

## entity\sumRelated

`entity\sumRelated(LINK, FIELD, [FILTER])`

Sums related records by a specified FIELD with an optional FILTER. Returns a *float* value.

!!! example

    `entity\sumRelated('opportunities', 'amountConverted', 'won')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../../user-guide/reports.md) as a filter. More [info](../formula.md#filter).

## entity\countRelated

`entity\countRelated(LINK, [FILTER])`

Returns a number of related records with an optional FILTER applied.

!!! example

    `entity\countRelated('opportunities', 'open')`

It's possible to apply a [list report](../../user-guide/reports.md) as a filter. More [info](../formula.md#filter).

## entity\getLinkColumn

`entity\getLinkColumn(LINK, ID, COLUMN)`

Fetches a relationship column value.

!!! example

    `entity\getLinkColumn('targetLists', 'TARGET_LIST_ID', 'optedOut')`
