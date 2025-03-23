# Formula > Functions > Record

* [record\exists](#recordexists)
* [record\count](#recordcount)
* [record\findOne](#recordfindone)
* [record\findMany](#recordfindmany)
* [record\findRelatedOne](#recordfindrelatedone)
* [record\findRelatedMany](#recordfindrelatedmany)
* [record\attribute](#recordattribute)
* [record\fetch](#recordfetch)
* [record\relate](#recordrelate)
* [record\unrelate](#recordunrelate)
* [record\create](#recordcreate)
* [record\update](#recordupdate)
* [record\delete](#recorddelete)
* [record\relationColumn](#recordrelationcolumn)
* [record\updateRelationColumn](#recordupdaterelationcolumn)

## record\exists

`record\exists(ENTITY_TYPE, KEY1, VALUE1, [KEY2, VALUE2 ...])`

Check whether a record with specified criteria exists.

!!! examples

    `record\exists('Lead', 'emailAddress=', fromAddress)`

    `record\exists('Lead', 'status=', list('Assigned', 'In Process'))`
    
    `record\exists('Lead', 'body*', '%word%')`
    
Available operators: `=`, `!=`, `>`, `<`, `>=`, `<=`, `*` (LIKE operator), `!*`. Other querying record functions also support these operators.

## record\count

`record\count(ENTITY_TYPE, KEY1, VALUE1, [KEY2, VALUE2 ...])`

Returns a count of records with specified criteria.

`record\count(ENTITY_TYPE, [FILTER])`

Returns a count of records with an optional FILTER applied. More [info](../formula.md#filter).

!!! examples

    `record\count('Opportunity', 'accountId=', id, 'stage=', 'Closed Won')`

    `record\count('Opportunity', 'amountConverted>', 1000)`

    `record\count('Opportunity', 'open')`

    `record\count('Lead', 'status=', list('Assigned', 'In Process'))`

FILTER is a name of a primary filter pre-defined in the system. It's also possible to apply a [list report](../../user-guide/reports.md) as a filter.
More [info](../formula.md#filter).

## record\findOne

`record\findOne(ENTITY_TYPE, ORDER_BY, ORDER, [KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns a first found ID of a record that matches specific criteria.

`record\findOne(ENTITY_TYPE, ORDER_BY, ORDER, [FILTER])` Returns a first found ID of a record with an optional FILTER applied.

!!! examples

    `record\findOne('Opportunity', 'createdAt', 'desc', 'accountId=', id, 'stage=', 'Closed Won')`

    `record\findOne('Opportunity', 'createdAt', 'desc', 'open')`

    `record\findOne('AppSecret', null, null, 'name', 'SECRET_NAME')`

## record\findMany

*As of v8.0*.

`record\findMany(ENTITY_TYPE, LIMIT, ORDER_BY, ORDER, [KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns an array of IDs of records that match specific criteria.

`record\findMany(ENTITY_TYPE, LIMIT, ORDER_BY, ORDER, [FILTER])` With an optional FILTER applied.

!!! examples

    `record\findMany('Opportunity', 10, 'createdAt', 'desc', 'accountId=', id, 'stage=', 'Closed Won')`

    `record\findMany('Opportunity', 5, 'createdAt', 'desc', 'open')`
    
ORDER_BY and ORDER can be null.

FILTER is a name of a primary filter pre-defined in the system. It's also possible to apply a [list report](../../user-guide/reports.md) as a filter.
More [info](../formula.md#filter).

## record\findRelatedOne

`record\findRelatedOne(ENTITY_TYPE, ID, LINK, [ORDER_BY, ORDER, KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns a first found ID of a related record that matches specific criteria.

`record\findRelatedOne(ENTITY_TYPE, ID, LINK, [ORDER_BY, ORDER, FILTER])`

Returns a first found ID of a related record with an optional FILTER applied.

If NULL is passed for ORDER_BY and ORDER then a default order will be applied.

!!! examples

    `record\findRelatedOne('Account', accountId, 'opportunities', 'createdAt', 'desc', 'stage=', 'Closed Won')`

    `record\findRelatedOne('Account', accountId, 'opportunities', 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../../user-guide/reports.md) as a filter.
More [info](../formula.md#filter).

## record\findRelatedMany

`record\findRelatedMany(ENTITY_TYPE, ID, LINK, LIMIT, [ORDER_BY, ORDER, KEY1, VALUE1, KEY2, VALUE2 ...])`

Returns an array of IDs of a related record that matches specific criteria. LIMIT is the max number of record.

`record\findRelatedMany(ENTITY_TYPE, ID, LINK, LIMIT, [ORDER_BY, ORDER, FILTER])`

Returns an array of IDs of a related record with an optional FILTER applied.

If NULL is passed for ORDER_BY and ORDER then a default order will be applied.

!!! examples

    `record\findRelatedMany('Account', accountId, 'opportunities', 10, 'createdAt', 'desc', 'stage=', 'Closed Won')`

    `record\findRelatedMany('Account', accountId, 'opportunities', 3, 'createdAt', 'desc', 'open')`

FILTER is a name of a filter pre-defined in the system. It's also possible to apply a [list report](../../user-guide/reports.md) as a filter. More [info](../formula.md#filter).

This function can be utilized for copying related records from one record to another. Example:

```
// copy teams from account to email
$ids = record\findRelatedMany('Account', $accountId, 'teams', 10);
record\relate('Email', $emailId, 'teams', $ids);
```

## record\attribute

`record\attribute(ENTITY_TYPE, ID, ATTRIBUTE)`

Returns an attribute value of a specific record.

!!! examples

    `record\attribute('Opportunity', $opportunityId, 'amountConverted')`

    `record\attribute('Opportunity', $opportunityId, 'teamsIds')`

By utilizing this function along with *record\findOne*, it's possible to fetch attribute values of any record in the system.

## record\fetch

*As of v7.5.*

`record\fetch(ENTITY_TYPE, ID)`

Fetches record attributes into an object. Returns NULL if a record does not exists.

!!! example

    ```
    $o = record\fetch('Account', $accountId);

    if ($o) {
        $name = object\get($o, 'name');
    }
    ```

## record\relate

`record\relate(ENTITY_TYPE, ID, LINK, FOREIGN_ID)`

Relates two records.

`record\relate(ENTITY_TYPE, ID, LINK, LIST_OF_IDS)`

Links a record with multiple records.

!!! examples

    `record\relate('Account', $accountId, 'opportunities', $opportunityId)`

    `record\relate('Account', $accountId, 'tasks', list('id1', 'id2'))`

!!! note
    It won't work in *Before save script* when applied for the current record. Use an after-save Workflow rule instead.
    
## record\unrelate

`record\unrelate(ENTITY_TYPE, ID, LINK, FOREIGN_ID)`

Unlinks two records.

!!! example

    `record\unrelate('Account', $accountId, 'opportunities', $opportunityId)`
    
!!! note

    It won't work in *Before save script* when applied for the current record. Use an after-save Workflow rule instead.

## record\create

`record\create(ENTITY_TYPE, ATTRIBUTE1, VALUE1, [ATTRIBUTE2, VALUE2 ...])`

or

`record\create(ENTITY_TYPE, OBJECT)` (as of v9.0)

Creates a new record of entity type with attributes specified as key-value pairs or in an object. Returns id of the created record, or NULL if failure.

!!! example

    `$id = record\create('Meeting', 'emailAddress', 'SOME@ADDRESS.com', 'assignedUserId', 'SOME-USER-ID')`

## record\update

`record\update(ENTITY_TYPE, ID, ATTRIBUTE1, VALUE1, [ATTRIBUTE2, VALUE2 ...])`

or

`record\update(ENTITY_TYPE, ID, OBJECT)` (as of v9.0)

Updates an existing record with attributes specified as key-value pairs or an object.

!!! example

    `record\update('Meeting', 'SOME-MEETING-ID', 'emailAddress', 'SOME@ADDRESS.com', 'assignedUserId', 'SOME-USER-ID')`

It will update the meeting with ID `SOME-MEETING-ID`, and will set `emailAddress = 'SOME@ADDRESS.com'`, `assignedUserId = 'SOME-USER-ID'`.

## record\delete

`record\delete(ENTITY_TYPE, ID)`

*As of v7.4.*

Removes a record.

## record\relationColumn

`record\relationColumn(ENTITY_TYPE, ID, LINK, FOREIGN_ID, COLUMN)`

Returns a relation column.

!!! example

    `record\relationColumn('Account', $accountId, 'contacts', $contactId, 'role')`

!!! example "Example: Condition checking position in team"

    `record\relationColumn('User', $someUserId, 'teams', 'some-team-id, 'role') == 'Support Manager'`

## record\updateRelationColumn

`record\updateRelationColumn(ENTITY_TYPE, ID, LINK, FOREIGN_ID, COLUMN, VALUE)`

Updates a relation column.

!!! example

    `record\updateRelationColumn('Account', $accountId, 'contacts', $contactId, 'role', 'CEO')`
