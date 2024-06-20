# Text Search

In this article:

* [List view text search](#list-view-text-search)
* [Global search](#global-search)
* [Full-text search](#full-text-search)

See also:

* [Search types in EspoCRM: What you should know](https://www.espocrm.com/tips/search-types/)

## List view text search

On the record list view it's possible to perform text search.

The field list, which is used in filtering, can be configured at Administration > Entity Manager > Edit specific entity type > Text Filter Fields.

It's possible to use the wildcard `*`.

![Text Search](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/text-search/1.png)

There is an option to use 'contains' operator for varchar fields by default. Parameter is available at Administration > Settings. Note that it can affect performance.

To disable previous search suggestions, uncheck the checkbox at Preferences > Misc > Disable text filter storing.

## Global search

Global Search performs a search in multiple entity types simultaneously.

The list of entity types used in Global Search can be configured at Administration > Settings > Global Search Entity List.

The field list which is used in filtering can be configured at Administration > Entity Manager > Edit specific entity type > Text Filter Fields.

![Global Search](https://raw.githubusercontent.com/espocrm/documentation/master/docs/_static/images/user-guide/text-search/2.png)

## Full-text search

Provides the ability to perform much faster and comprehensive text search.

Full-text search can be enabled for a specific entity type at Administration > Entity Manager > Edit specific entity type > Full-text search.

After enabling full-text-search, running rebuild is required. If you have many records, it's recommended to run rebuild from CLI: `php rebuild.php`.

Full-text search is always applied in the **Global Search** (for entity types with enabled full-text search).

Full-text search is also applied when you search in the list view. Though it can be skipped for some search queries. Yet, it's possible to force a full-text usage by prepending `ft:` to the search query.

The following operators are available:

* `+` A leading plus sign indicates that this word must be present.
* `-` A leading minus sign indicates that this word must not be present.
* (no operator) The word is optional, but the rows that contain it are rated higher.
* `*` The truncation (or wildcard) operator. Appended to the word to be affected.
* `"` A phrase enclosed within double quotes must be contained literally, as it was typed.

### Minimum word length

The MySQL option `ft_min_word_len` defines a minimum word length available for full-text search. By default, it's set to `4`. You might want to set it to `3` to be able to search shorter words.

If you change this parameter in MySQL, you also need to run rebuild in Espo.

### Stopwords

MySQL has a list of [stopwords](https://dev.mysql.com/doc/refman/8.0/en/fulltext-stopwords.html) that are ignored by full-text search. E.g. *hello*.
