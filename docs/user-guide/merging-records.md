# Merging records

Record merging allows you to combine duplicate records of the same entity type into a single record. One record is kept, its field values are set from the values you choose, and related data from the other records is moved to it. The other records are removed.

Merging is useful when the same record has been entered more than once, e.g. by different users or through an import.

## Access requirements

Since merging modifies one record and deletes the others, a user needs both **Edit** and **Delete** access to the entity type. If either of them is set to *no* in the user's roles, the *Merge* action is not shown.

Access is also checked for each selected record:

- the record being kept requires *edit* access;
- each record being merged into it requires *read*, *edit* and *delete* access.

If the chosen field values change the assigned user or teams of the kept record, the user's assignment permission is checked as well.

Access levels are configured by an administrator in Roles. Administrators can merge any records.

## How to merge

1. Open the list view of the entity type, e.g. Contacts.
2. Select 2 to 4 duplicate records with checkboxes.
3. Click the *Actions* dropdown and select *Merge*.
4. On the merge form, the selected records are shown side by side. In the header row, select the record that will be kept. This also selects all of its field values.
5. For each field where you want a different value, select the radio button next to the value of another record.
6. Click *Merge*.

After merging, you will be redirected to the detail view of the kept record.

## What happens to related data

When records are merged:

- related records (one-to-many, many-to-many and children relationships, e.g. activities, opportunities, cases) are relinked to the kept record;
- email addresses and phone numbers of all merged records are added to the kept record;
- stream posts and emails from the streams of the merged records are moved to the stream of the kept record;
- the merged records are deleted.

## Limitations

- Only records of the same entity type can be merged.
- Not more than 4 records can be merged at once. To merge more duplicates, merge them in several passes into the same record.
- Merging is not available for some entity types, e.g. Users.
- Merging cannot be fully reverted. Even if an administrator restores a deleted record, its relationships and stream remain with the kept record.