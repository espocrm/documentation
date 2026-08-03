# AI Formula Functions

The Intelligence extension provides the following AI formula functions:

- [intelligence\classify](#intelligenceclassify)
- [intelligence\extract](#intelligenceextract)
- [intelligence\summarize](#intelligencesummarize)
- [intelligence\createSummaryNote](#intelligencecreatesummarynote)

These formula functions can be utilized in the [BPM](../../administration/bpm.md) tool.
It is recommended that the process flow utilizing these functions is run in [idle](../../administration/bpm-tips.md#execution-in-idle).

Functions throw exceptions when an error occurs. They can be caught
with the boundary [Error](../../administration/bpm-events.md#error-intermediate-event-boundary) event.

#### intelligence\classify

`intelligence\classify(STRING, CATEGORIES, [CONFIDENCE_THRESHOLD])`

Classifies an input. Returns a category string value or null if the CONFIDENCE_THRESHOLD is provided and the estimated
confidence is less then the threshold value.

CATEGORIES parameter type: *array{0: string, 1?: ?string}[]*. The first value is a category name, the second (optional) is a description.

Examples:

```
$categories = list(
    list('Incident'),
    list('Problem'),
    list('Question'),
);

// Returns 'Incident', 'Problem', or 'Question'. If the confidence is lower
// than 10, it will fallback to 'Other'.
$category = intelligence\classify(description, $categories, 10) ?? 'Other';
```

```
$categories = list(
    list('Product', "Costomer ran into a problem with the product."),
    list('Payment', "Customer faced a problem with payment."),
    list('Other', "Any other issue."),
);

// Returns 'Product', 'Payment', or 'Other'.
$category = intelligence\classify(description, $categories);
```

#### intelligence\extract

`intelligence\classify(STRING, SCHEMA)`


Extract data from text according the provided schema.

SCHEMA parameter type: *array{0: string, 1?: ?string, 3?: string}[]*. The first value is a name, the second is a description,
the third (optional) is a type.

Use case. Extract data from an incoming email.

Examples:

```
$schema = list(
    list('customerName', 'A customer name.'),
    list('emailAddress', 'An email address.'),
    list('productName', 'A product name where the problem occurred.', 'string|null'),
);

$result = intelligence\extract(description, $schema);

$customerName = $result['customerName'] ?? null;
$emailAddress = $result['emailAddress'] ?? null;
$productName = $result['productName'] ?? null;
```

#### intelligence\summarize

`intelligence\summarize(STRING)`

Summarizes a string input.

Use case. Summarize the description field of a case. Then, the result can be sent in a notification or written
to a field.

Example:

```
$summaryText = intelligence\summarize(description);
```

#### intelligence\createSummaryNote

`intelligence\createSummaryNote(ENTITY_TYPE, ID)`

Creates a summary note in the record's stream. The note is internal (not visible in portals).

Use case. Automatically create a summary note for every incoming case.

Example:

```
intelligence\createSummaryNote('Case', id);
```
