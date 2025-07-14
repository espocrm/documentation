# Formula > Functions > Datetime

Date and date-time values are represented as strings. E.g. `'2021-01-01'`, `'2021-01-01 10:00'`.

* [datetime\today](#datetimetoday)
* [datetime\now](#datetimenow)
* [datetime\format](#datetimeformat)
* [datetime\date](#datetimedate)
* [datetime\month](#datetimemonth)
* [datetime\year](#datetimeyear)
* [datetime\hour](#datetimehour)
* [datetime\minute](#datetimeminute)
* [datetime\dayOfWeek](#datetimedayofweek)
* [datetime\diff](#datetimediff)
* [datetime\addSeconds](#datetimeaddseconds)
* [datetime\addMinutes](#datetimeaddminutes)
* [datetime\addHours](#datetimeaddhours)
* [datetime\addDays](#datetimeadddays)
* [datetime\addWeeks](#datetimeaddweeks)
* [datetime\addMonths](#datetimeaddmonths)
* [datetime\addYears](#datetimeaddyears)
* [datetime\closest](#datetimeclosest)


## datetime\today

`datetime\today()`

Returns a today's date (w/o time).

## datetime\now

`datetime\now()`

Returns a current datetime.

## datetime\format

`datetime\format(VALUE, [TIMEZONE], [FORMAT])`

Converts a date or datetime VALUE to a string formatted according to the application settings or a given timezone and ISO format. TIMEZONE and FORMAT can be omitted. If TIMEZONE is omitted, then the default timezone will be used. If FORMAT is omitted, then the default format will be used.

!!! example

    `datetime\format(closeDate, 'America/New_York', 'MM/DD/YYYY')`

    `datetime\format(dateStart, 'America/New_York', 'MM/DD/YYYY hh:mma')`

    `datetime\format(dateStart, 'Europe/Amsterdam', 'DD/MM/YYYY HH:mm')`

## datetime\date

`datetime\date(VALUE, [TIMEZONE])`

Returns date of the month (1-31). `0` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

## datetime\month

`datetime\month(VALUE, [TIMEZONE])`

Returns month (1-12). `0` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

## datetime\year

`datetime\year(VALUE, [TIMEZONE])`

Returns year. `0` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

## datetime\hour

`datetime\hour(VALUE, [TIMEZONE])`

Returns hour (0-23). `-1` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

## datetime\minute

`datetime\minute(VALUE, [TIMEZONE])`

Returns minute (0-59). `-1` if VALUE is empty. If TIMEZONE is omitted, then system timezone is used.

## datetime\dayOfWeek

`datetime\dayOfWeek(VALUE, [TIMEZONE])`

Returns day of the week (0-6). `-1` if VALUE is empty. `0` - for Sunday. If TIMEZONE is omitted, then system timezone is used.

## datetime\diff

`datetime\diff(VALUE_1, VALUE_2, INTERVAL_TYPE)`

Returns the difference between two dates or datetimes. INTERVAL_TYPE can be 'years', 'months', 'days', 'hours', 'minutes', 'seconds'. Returns `null` if failure. The result will be negative if VALUE_1 < VALUE_2.

## datetime\addSeconds

*As of v9.2.0.*

`datetime\addMinutes(VALUE, SECONDS)`

Adds SECONDS to a datetime VALUE. SECONDS can be negative. Returns a modified STRING value.

## datetime\addMinutes

`datetime\addMinutes(VALUE, MINUTES)`

Adds MINUTES to a datetime VALUE. MINUTES can be negative. Returns a modified STRING value.

!!! example

    `$modifiedValue = datetime\addMinutes('2021-01-01 00:00', 10)`

## datetime\addHours

`datetime\addHours(VALUE, HOURS)`

Adds HOURS to a datetime VALUE. HOURS can be negative. Returns a modified STRING value.

## datetime\addDays

`datetime\addDays(VALUE, DAYS)`

Adds DAYS to a date or datetime VALUE. DAYS can be negative.

!!! example

    `datetime\addDays(dateStart, 1)`

## datetime\addWeeks

`datetime\addWeeks(VALUE, WEEKS)`

Adds WEEKS to a date or datetime VALUE. WEEKS can be negative. Returns a modified STRING value.

!!! example

    `datetime\addWeeks(dateStart, 4)`

## datetime\addMonths

`datetime\addMonths(VALUE, MONTHS)`

Adds MONTHS to a date or datetime VALUE. MONTHS can be negative. Returns a modified STRING value.

!!! example

    `datetime\addMonths(dateStart, 1)`

## datetime\addYears

`datetime\addYears(VALUE, YEARS)`

!!! example

    `datetime\addYears(dateStart, 1)`

Adds YEARS to a date or datetime VALUE. YEARS can be negative. Returns a modified STRING value.

## datetime\closest

`datetime\closest(VALUE, TYPE, TARGET, [IS_PAST], [TIMEZONE])`

Returns the closest date or datetime to VALUE based on passed arguments.

TYPE can be one of the following values: 'time', 'minute', 'hour', 'date', 'month', 'dayOfWeek'. TARGET is an integer value or a string value. 
IS_PAST means to find the closest in the past. If TIMEZONE is omitted, then the default timezone is used.

!!! example

    `datetime\closest(datetime\now(), 'time', '20:00')` Will return the closest datetime value in the future with 20:00 time.

    `datetime\closest('2017-11-20', 'date', 1, true)` Will return `2017-11-01`, the first day of the month.

    `datetime\closest(datetime\now(), 'dayOfWeek', 1)` Will return the next Monday (the beginning of the day).
