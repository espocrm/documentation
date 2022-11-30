# Formula > Functions > Number

#### number\format

`number\format(VALUE, [DECIMALS], [DECIMAL_MARK], [THOUSAND_SEPARATOR])`

Converts numeric VALUE into string formatted according to a specific format or default application settings. If DECIMALS, DECIMAL_MARK OR THOUSAND_SEPARATOR, then system defaults are used.

Examples:

`number\format(2.666667, 2)` - results 2.67;

`number\format(1000, 2)` - results 1,000.00;

`number\format(10.1, 0)` - results 10.


#### number\abs

`number\abs(VALUE)`

Absolute value. Returns null if VALUE is not numeric.

#### number\round

`number\round(VALUE, PRECISION)`

Returns the rounded value of VALUE to specified PRECISION (number of digits after the decimal point). PRECISION can also be negative or zero (default).

#### number\floor

`number\floor(VALUE)`

Returns the next lowest integer value by rounding down value if necessary.

#### number\ceil

`number\ceil(VALUE)`

Returns the next highest integer value by rounding up value if necessary.

#### number\randomInt

`number\randomInt([MIN, MAX])`

Generates a cryptographic random integer between specified MIN and MAX. If MIN is omitted, then `0` is used. (as of v5.9.2)

#### number\parseInt

`number\parseInt(STRING)`

Converts a string to an integer number. (as of v7.1.0)

#### number\parseFloat

`number\parseFloat(STRING)`

Converts a string to a float number. (as of v7.1.0)
