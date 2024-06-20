# Templates

A template of a [view](../view.md) is used to render an HTML. Before rendering, the view passes data to the template. Templates can be stored in separate .tpl files or defined right in a the view's `templateContent` property. [Handlebars](https://handlebarsjs.com) library is used for templating.

## Expressions

Expressions are enclosed by double curly braces `{{}}`.

```
{{name}}
```
### Path

With dot-separated paths it's possible to look up in objects.

```
{{person.firstName}}
```

### Changing context

Inside `{{#each}}` blocks you can change a context to parent with `../`.

```
{{#each people}}
    {{../prefix}} {{name}}
{{/each}}
```

### HTML escaping

Values returned by the `{{expression}}` are HTML-escaped. You can suppress escaping by using triple braces.

```
{{text}} – escaped
{{{text}}} – unescaped
```

Expressions rendering child views should be unescaped.

### Whitespaces

Template whitespace can be omitted from either side of any mustache statement by adding a `~` character by the braces.

```
{{#each items ~}}
    <button data-name="{{name}}">{{label}}</button>
{{~/each}}
```

### Sub-expressions

```
{{complexText (translate 'myMessage' category='messages' scope='MyScope')}
```

## Helpers

### if

An if block conditional helper.

```
{{#if value}}

{{/if}}
```

```
{{#if value}}

{{else}}

{{/if}}
```

### unless

An inversion of the if block.

### each

An iteration block helper.

```
{{#each array}}
    {{this}} – item
    {{@index}} – index
{{/each}}
```

```
{{#each object}}
    {{this}} – item
    {{@key}} – key
{{/each}}
```

### lookup

Accessing an object property by a key or an array item by an index.

```
{{lookup object 'property'}}
```

### ifEqual

Compares two values for equality.

```
{{#ifEqual value1 value2}}

{{/ifEqual}}
```

```
{{#ifEqual value1 value2}}

{{else}}

{{/ifEqual}}
```

### ifNotEqual

Compares two values for inequality.

### get

Gets an attribute value from a model.

```
{{get model 'name'}}
```

### translate

Translates a label.

```
{{translate label}}
{{translate field category='fields' scope='Account'}}
```

### translateOption

Translates an enum option.

```
{{translateOption 'optionKey' field='myField' scope='MyEntityType'}}
```

### complexText

Prints a parsed Markdown text.

```
{{complexText text}}
```

### hyphen

Converts a camelCase to hyphen.

```
{{hyphen stringValue}}
```

### toDom

Convert a string from camelCase to hyphen and replace dots with hyphens. Useful for DOM attributes.

```
data-{{toDom this}}="{{lookup ../this this}}"
```

### breaklines

Replaces line breaks with `<br>` tags.

```
{{breaklines text}}
```

### basePath

A client base path.
