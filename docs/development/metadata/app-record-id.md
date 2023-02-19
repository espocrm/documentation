# app > recordId

Path: metadata > app > recordId.

*As of v7.4.*

## type

*string*

A type of generated IDs.

Available types:

* *id* – 17-character hex, set by default;
* *uuid4* – UUID v4.

## length

*int*

ID column length. By default, set to *17*.

## dbType

*string*

ID column data type. By default, set to *string* (equivalent to *varchar* in MySQL). Changing this parameter will change types of all ID columns once you run rebuild.

In MariaDB (as of v10.7) and PostgreSQL it's possible to use *uuid* data type, which positively effect on performance.

Beware of setting the *uuid* data type for instances with data. You will need to migrate all stored IDs to an UUID compatible format (e.g. by applying an MD5 function), attachment files and all other referrences. This may be not a trivial task.

Consider setting the *uuid* type for new instances. If you do it before installation, no any migration work will be needed.
