# Formula > Functions > String

* [string\concatenate](#stringconcatenate)
* [string\substring](#stringsubstring)
* [string\contains](#stringcontains)
* [string\pos](#stringpos)
* [string\test](#stringtest)
* [string\length](#stringlength)
* [string\trim](#stringtrim)
* [string\lowerCase](#stringlowercase)
* [string\upperCase](#stringuppercase)
* [string\pad](#stringpad)
* [string\match](#stringmatch)
* [string\matchAll](#stringmatchall)
* [string\replace](#stringreplace)


#### string\concatenate

`string\concatenate(STRING_1, STRING_2)`

Concatenates two or more strings.

Example:

```
$someVariable = string\concatenate('ab', 'cd'); // will return 'abcd'
```

#### string\substring

`string\substring(STRING, START, LENGTH)`

Extracts the characters from a STRING by START position and LENGTH.

If LENGTH is omitted, the substring starting from START until the end of the STRING will be returned.

If LENGTH is negative, then that many characters will be omitted from the end of STRING.

Examples:

```
$someVariable = string\substring('abcde', 1, 2); // will return 'bc'

$someVariable = string\substring('abcde', 1, -1); // will return 'bcd'
```

#### string\contains

`string\contains(STRING, NEEDLE)`

Whether STRING contains NEEDLE.

Example:

```
string\contains('hello world', 'world') // will return true
```

#### string\pos

`string\pos(STRING, NEEDLE)`

Returns possition of NEEDLE in STRING, *false* if not found. (as of v5.7.3)

Example:

```
string\pos('hello world', 'world') // will return `6`
```

#### string\test

`string\test(STRING, REGULAR_EXPRESSION)`

Search a match between REGULAR_EXPRESSION and STRING. Returns TRUE of FALSE.

Example:

```
string\test('hello world', '/hello/i') // will return TRUE
```

#### string\length

`string\length(STRING)`

The length of STRING.

Example:

```
string\length('hello world') // will return `11`
```

#### string\trim

`string\trim(STRING)`

Strips whitespace from the beginning and end of STRING.

Example:

```
string\length(' hello world ') // will return `hello world`
```

#### string\lowerCase

`string\lowerCase(STRING)`

Converts letters to lower case.

Example:

```
string\lowerCase('HELLO world') // will return `hello world`
```

#### string\upperCase

`string\upperCase(STRING)`

Converts letters to upper case.

Example:

```
string\upperCase('HELLO world') // will return `HELLO WORLD`
```

#### string\pad

`string\pad(STRING, LENGTH, [PAD_STRING], [PAD_TYPE])`

Pads STRING to a certain LENGTH with PAD_STRING.

PAD_STRING by default is a whitespace string `' '`.

PAD_TYPE can be *'right'*, *'left'*, *'both'*. By default it is *'right'*.

Example:

```
string\pad('100', 5, '*', 'right') // will return `100**`
```

#### string\match

`string\match(STRING, REGULAR_EXPRESSION, [OFFSET])`

Retrieves the first result of matching a STRING against a REGULAR_EXPRESSION. Returns NULL if no matches are found. (as of v5.8.3)

Example:

`string\match('{token1} foo {token2} bar', '/{[^}]*}/')`

will return `{token1}`.

The slash character `/` defines the start and the end of a REGULAR_EXPRESSION.

#### string\matchAll

`string\matchAll(STRING, REGULAR_EXPRESSION, [OFFSET])`

Retrieves all results of matching a STRING against a REGULAR_EXPRESSION. Returns NULL if no matches are found. (as of v5.8.3)

Example:

`string\matchAll('{token1} foo {token2} bar', '/{[^}]*}/')`

will return an array `['{token1}', '{token2}']`.

#### string\replace

`string\replace(STRING, SEARCH, REPLACE)`

Replaces all occurrences of SEARCH with REPLACE in STRING. (as of v5.9.0)

Example:

`string\replace('Hello {test}', '{test}', 'world')`

will return `'Hello world'`.


#### string\split

`string\split(STRING, SEPARATOR)`

Splits a STRING into array of strings by a string SEPARATOR. (as of v7.1.0)

Example:

```
string\split('hello world', ' ') // will return ['hello', 'world']
```
