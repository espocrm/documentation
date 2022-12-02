# Formula > Functions > Record

* [record\exists](#recordexists)
* [record\count](#recordcount)
* [record\findOne](#recordfindone)
* [record\findRelatedOne](#recordfindrelatedone)
* [record\findRelatedMany](#recordfindrelatedmany)
* [record\attribute](#recordattribute)
* [record\relate](#recordrelate)
* [record\unrelate](#recordunrelate)
* [record\create](#recordcreate)
* [record\update](#recordupdate)
* [record\relationColumn](#recordrelationcolumn)
* [record\updateRelationColumn](#recordupdaterelationcolumn)

## record\exists

`record\exists(ENTITY_TYPE, KEY1, VALUE1, [KEY2, VALUE2 ...])`

Check whether a record with specified criteria exists.

Examples:

`record\exists('Lead', 'emailAddress=', fromAddress)`

`record\exists('Lead', 'status=', list('Assigned', 'In Process'))`

## record\count

`record\count(ENTITY_TYPE, KEY1, VALUE1, [KEY2, VALUE2 ...])`

Returns a count of records with specified criteria.

`record\count(ENTITY_TYPE, [FILTER])`

Returns a count of records with an optional FILTER applied. More info about filters [below](#filter).

Examples:

`record\count('Opportunity', 'accountId=', id, 'stage=', 'Closed Won')`

`record\count('Opportunity', 'amountConverted>', 1000)`

`record\count('Opportunity', 'open')`

`record\count('Lead', 'status=', list('Assigned', 'In Process'))`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../../user-guide/reports.md) as a filter.
More [info](../formula.md#filter).

## record\findOne

`record\findOne(ENTITY_TYPE, ORDER_BY, ORDER, [KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns a first found ID of a record that matches specific criteria.

`record\findOne(ENTITY_TYPE, ORDER_BY, ORDER, [FILTER])` Returns a first found ID of a record with an optional FILTER applied.

Examples:

`record\findOne('Opportunity', 'createdAt', 'desc', 'accountId=', id, 'stage=', 'Closed Won')`

`record\findOne('Opportunity', 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../../user-guide/reports.md) as a filter.
More info [below](#filter).

## record\findRelatedOne

`record\findRelatedOne(ENTITY_TYPE, ID, LINK, [ORDER_BY, ORDER, KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns a first found ID of a related record that matches specific criteria.

`record\findRelatedOne(ENTITY_TYPE, ID, LINK, [ORDER_BY, ORDER, FILTER])`

Returns a first found ID of a related record with an optional FILTER applied.

If NULL is passed for ORDER_BY and ORDER then a default order will be applied.

Examples:

`record\findRelatedOne('Account', accountId, 'oppotunities', 'createdAt', 'desc', 'stage=', 'Closed Won')`

`record\findRelatedOne('Account', accountId, 'oppotunities', 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../../user-guide/reports.md) as a filter.
More info [below](#filter).

## record\findRelatedMany

`record\findRelatedMany(ENTITY_TYPE, ID, LINK, LIMIT, [ORDER_BY, ORDER, KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns an array of IDs of a related record that matches specific criteria. LIMIT is the max number of record.

`record\findRelatedMany(ENTITY_TYPE, ID, LINK, LIMIT, [ORDER_BY, ORDER, FILTER])`

Returns an array of IDs of a related record with an optional FILTER applied.

If NULL is passed for ORDER_BY and ORDER then a default order will be applied.

Examples:

`record\findRelatedMany('Account', accountId, 'oppotunities', 10, 'createdAt', 'desc', 'stage=', 'Closed Won')`

`record\findRelatedOne('Account', accountId, 'oppotunities', 3, 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../../user-guide/reports.md) as a filter. More info [below](#filter).

This function can be utilized for copying related records from one record to another. Example:

```
// copy teams from account to email
$ids = record\findRelatedMany('Account', $accountId, 'teams', 10);
record\relate('Email', $emailId, 'teams', $ids);
```

## record\attribute

`record\attribute(ENTITY_TYPE, ID, ATTRIBUTE)`

Returns an attribute value of a specific record.

Examples:

`record\attribute('Opportunity', $opportunityId, 'amountConverted')`

`record\attribute('Opportunity', $opportunityId, 'teamsIds')`

By utilizing this function along with *record\findOne*, it's possible to fetch attribute values of any record in the system.

## record\relate

`record\relate(ENTITY_TYPE, ID, LINK, FOREIGN_ID)`

Relates two records.

`record\relate(ENTITY_TYPE, ID, LINK, LIST_OF_IDS)`

Links a record with multiple records. (as of v5.9)

Examples:

`record\relate('Account', $accountId, 'opportunities', $opportunityId)`

`record\relate('Account', $accountId, 'tasks', list('id1', 'id2'))`

Note: It won't work in *Before save script* when creating a new record, because the record doesn't exist yet when formula is processed.

## record\unrelate

`record\unrelate(ENTITY_TYPE, ID, LINK, FOREIGN_ID)`

Unlinks two records.

Example:

`record\unrelate('Account', $accountId, 'opportunities', $opportunityId)`

## record\create

`record\create(ENTITY_TYPE, ATTRIBUTE1, VALUE1, [ATTRIBUTE2, VALUE2 ...])`

Creates a new record of entity type with attributes specified as key-value pairs. Returns id of the created record, or NULL if failure.

Examples:

`$id = record\create('Meeting', 'emailAddress', 'SOME@ADDRESS.com', 'assignedUserId', 'SOME-USER-ID')`

## record\update

`record\update(ENTITY_TYPE, ID, ATTRIBUTE1, VALUE1, [ATTRIBUTE2, VALUE2 ...])`

Updates an existing record with attributes specified as key-value pairs. Returns TRUE if success, FALSE if failure.

Examples:

`record\update('Meeting', 'SOME-MEETING-ID', 'emailAddress', 'SOME@ADDRESS.com', 'assignedUserId', 'SOME-USER-ID')`

It will update the meeting with ID `SOME-MEETING-ID`, and will set `emailAddress = 'SOME@ADDRESS.com'`, `assignedUserId = 'SOME-USER-ID'`.

## record\relationColumn

`record\relationColumn(ENTITY_TYPE, ID, LINK, FOREIGN_ID, COLUMN)`

Returns a relation column.

Example:

`record\relationColumn('Account', $accountId, 'contacts', $contactId, 'role')`

Example (condition checking position in team):

`record\relationColumn('User', $someUserId, 'teams', 'some-team-id, 'role') == 'Support Manager'`


## record\updateRelationColumn

`record\updateRelationColumn(ENTITY_TYPE, ID, LINK, FOREIGN_ID, COLUMN, VALUE)`

Updates a relation column.

Example:

`record\updateRelationColumn('Account', $accountId, 'contacts', $contactId, 'role', 'CEO')`
