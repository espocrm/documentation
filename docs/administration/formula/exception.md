# Formula > Functions > Exception

* [exception\throwInvalid](#exceptionthrowinvalid)

## exception\throwInvalid

`exception\throwInvalid([MESSAGE])`

*As of v9.4.*

Throws a validation exception. To be used withing Before-save script (not API before-save script).
Can be used for internal validation that is performed every time an entity is saved.

The error message (passed as the first parameter) is not displayed to the user, but logged.

!!! example

    ```
    if (!assignedUserId) {
        exception\throwInvalid("No assigned user.");
    }
    ```
