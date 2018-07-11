# Text Search

## List view text search

On the record list view it's possible to perform text search.

The field list, which is used in filtering, can be configured at Administration > Entity Manager > Edit specific entity type > Text Filter Fields.

It's possible to use the wildcard `*` (available since 5.3.0 version, for previous versions use `%`).

![TExt Search](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/text-search/1.png)

## Global Search

Global Search performs a search in multiple entity types simultaneously.

The list of entity types used in Global Search can be configured at Administration > Settings > Global Search Entity List.

The field list which is used in filtering can be configured at Administration > Entity Manager > Edit specific entity type > Text Filter Fields.

![Global Search](https://raw.githubusercontent.com/espocrm/documentation/master/_static/images/user-guide/text-search/2.png)

## Full-text search

Available since 5.3.0 version.

Provides an ability to perform a much faster and comprehensive text search.

Full-text search can be enabled for a specified entity type at Administration > Entity Manager > Edit specific entity type > Full-text search. Running rebuild is required.

Note: Mysql 5.5 doesn't support full-text search for InnoDB tables. 5.6.4 and later versions do support.

Full-text search is always applied in Global Search (for entity types with enabled full-text search).

A text search on the record list view is only utilized for a better performance. Results are the same as they were w/o enabled full-text search. Yet, it's possible to force a full-text usage by prepending `ft:` to a search query.

For InnoDB tables the following operators are available:

* `+` A leading plus sign indicates that this word must be present.
* `-` A leading minus sign indicates that this word must not be present.
* (no operator) The word is optional, but the rows that contain it are rated higher.
* `*` The truncation (or wildcard) operator. Appended to the word to be affected.
* `"` A phrase enclosed within double quotes must be contained literally, as it was typed.
