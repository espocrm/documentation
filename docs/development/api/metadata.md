# API :: Metadata

## Getting metadata

`GET Metadata`

Returns application metadata. Note that not all metadata is available to read from outside, some data is stripped from the result.

Query params:

* key – a specific path to return; e.g. `entityDefs.Lead.fields.status.options`; as of v8.2.
